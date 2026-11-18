pub use libvgm_sys;

pub struct VGMPlayerWrapper;

unsafe impl Send for VGMPlayerWrapper {}

impl VGMPlayerWrapper {
    pub fn new() -> Self {
        Self
    }

    pub fn render(&mut self, output: &mut [f32]) {
        output.fill(0.0);
    }
}
