use std::path::Path;
use std::process::Command;

fn main() {
    let libvgm_path = Path::new("libvgm");

    if !libvgm_path.exists() {
        let status = Command::new("git")
            .args(["clone", "https://github.com/vgmtrans/libvgm.git", "libvgm"])
            .status();
        
        if let Ok(s) = status {
            assert!(s.success(), "git clone of libvgm failed");
        } else {
            panic!("git executable not found or failed to run");
        }
    } else {
        println!("cargo:warning=Using local libvgm directory");
    }
}
