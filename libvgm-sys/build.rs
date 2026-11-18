use std::env;
use std::path::{Path, PathBuf};
use std::process::Command;
use std::fs;

fn find_static_libs(dir: &Path, search_paths: &mut Vec<PathBuf>, lib_names: &mut Vec<String>) {
    if let Ok(entries) = fs::read_dir(dir) {
        for entry in entries.flatten() {
            let path = entry.path();
            if path.is_dir() {
                find_static_libs(&path, search_paths, lib_names);
            } else if let Some(ext) = path.extension() {
                if ext == "a" || ext == "lib" {
                    if let Some(parent) = path.parent() {
                        if !search_paths.contains(&parent.to_path_buf()) {
                            search_paths.push(parent.to_path_buf());
                        }
                    }
                    if let Some(file_name) = path.file_stem().and_then(|s| s.to_str()) {
                        let lib_name = file_name.strip_prefix("lib").unwrap_or(file_name);
                        let is_stub = lib_name == "zdll" 
                            || lib_name == "zlib" 
                            || lib_name == "zlib64" 
                            || lib_name == "zlib64d" 
                            || lib_name == "zlibd" 
                            || lib_name == "zlibstatic"
                            || lib_name == "iconv"; // handled via dummy or system libc
                        
                        if !is_stub && !lib_names.contains(&lib_name.to_string()) {
                            lib_names.push(lib_name.to_string());
                        }
                    }
                }
            }
        }
    }
}

fn main() {
    println!("cargo:rerun-if-changed=build.rs");
    println!("cargo:rerun-if-changed=wrapper.h");

    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());
    let libvgm_dir = out_dir.join("libvgm");

    if !libvgm_dir.exists() {
        let status = Command::new("git")
            .args(&[
                "clone",
                "--depth",
                "1",
                "https://github.com/ValleyBell/libvgm.git",
                libvgm_dir.to_str().unwrap(),
            ])
            .status()
            .expect("Failed to execute git clone for libvgm");

        if !status.success() {
            panic!("Failed to clone ValleyBell/libvgm repository");
        }
    }

    let dst = cmake::Config::new(&libvgm_dir).build();

    // On Linux, if CMake/libvgm requests static iconv, provide a dummy archive so the linker succeeds
    let target = env::var("TARGET").unwrap_or_default();
    if target.contains("linux") {
        let dummy_c = out_dir.join("dummy_iconv.c");
        let dummy_o = out_dir.join("dummy_iconv.o");
        let dummy_a = out_dir.join("libiconv.a");

        fs::write(&dummy_c, "void __libvgm_dummy_iconv(void) {}\n").ok();
        
        let _ = Command::new("cc")
            .args(&["-c", dummy_c.to_str().unwrap(), "-o", dummy_o.to_str().unwrap()])
            .status();

        let _ = Command::new("ar")
            .args(&["rcs", dummy_a.to_str().unwrap(), dummy_o.to_str().unwrap()])
            .status();

        println!("cargo:rustc-link-search=native={}", out_dir.display());
    }

    let mut search_paths = Vec::new();
    let mut lib_names = Vec::new();
    find_static_libs(&dst, &mut search_paths, &mut lib_names);

    let build_root = out_dir.join("build");
    if build_root.exists() {
        find_static_libs(&build_root, &mut search_paths, &mut lib_names);
    }

    for path in &search_paths {
        println!("cargo:rustc-link-search=native={}", path.display());
    }

    for lib in &lib_names {
        println!("cargo:rustc-link-lib=static={}", lib);
    }

    // Link system libraries
    println!("cargo:rustc-link-lib=stdc++");
    println!("cargo:rustc-link-lib=z");

    if target.contains("linux") {
        println!("cargo:rustc-link-lib=static=iconv");
    } else {
        println!("cargo:rustc-link-lib=iconv");
    }

    let bindings = bindgen::Builder::default()
        .header("wrapper.h")
        .clang_arg(format!("-I{}", libvgm_dir.display()))
        .clang_arg(format!("-I{}", libvgm_dir.join("player").display()))
        .clang_arg(format!("-I{}", libvgm_dir.join("emu").display()))
        .clang_arg(format!("-I{}", libvgm_dir.join("utils").display()))
        .clang_arg("-x")
        .clang_arg("c++")
        .enable_cxx_namespaces()
        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
        .generate()
        .expect("Unable to generate libvgm bindings");

    let bindings_path = out_dir.join("bindings.rs");
    bindings
        .write_to_file(bindings_path)
        .expect("Couldn't write libvgm bindings!");
}
