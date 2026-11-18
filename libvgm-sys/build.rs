use std::path::Path;

fn main() {
    let local_path = Path::new("libvgm");
    let workspace_path = Path::new("../libvgm");

    if local_path.exists() {
        println!("cargo:warning=Using local libvgm directory");
    } else if workspace_path.exists() {
        println!("cargo:warning=Using workspace root libvgm directory");
    } else {
        panic!("libvgm directory not found. Place libvgm in libvgm-sys/ or the workspace root.");
    }
}
