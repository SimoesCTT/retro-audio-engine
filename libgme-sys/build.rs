use std::env;
use std::path::PathBuf;

fn main() {
    // Probe for system libgme via pkg-config
    let library = pkg_config::Config::new()
        .atleast_version("0.6.0")
        .probe("libgme")
        .unwrap_or_else(|e| {
            eprintln!("Error: libgme could not be found via pkg-config: {}", e);
            eprintln!("Ensure game-music-emu-devel is installed via dnf.");
            std::process::exit(1);
        });

    for path in &library.link_paths {
        println!("cargo:rustc-link-search=native={}", path.display());
    }
    for lib in &library.libs {
        println!("cargo:rustc-link-lib={}", lib);
    }

    // Configure bindgen with header search paths from pkg-config
    let bindings = library.include_paths.iter().fold(bindgen::Builder::default(), |b, path| {
        b.clang_arg(format!("-I{}", path.display()))
    });

    let bindings = bindings
        .header("wrapper.h")
        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
        .generate()
        .expect("Unable to generate libgme bindings");

    // Write bindings to cargo output directory
    let out_path = PathBuf::from(env::var("OUT_DIR").unwrap());
    bindings
        .write_to_file(out_path.join("bindings.rs"))
        .expect("Couldn't write bindings file!");
}
