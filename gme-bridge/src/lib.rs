pub mod synth;
pub mod filter;
pub mod recorder;

use libgme_rs::MusicEmu;

#[derive(Debug, Clone, Copy)]
pub struct EmulatorConfig {
    pub sample_rate: f32,
    pub target_channels: usize,
}

pub struct EmulatorNode {
    emu: MusicEmu,
    #[allow(dead_code)]
    config: EmulatorConfig,
    pcm_buffer_i16: Vec<i16>,
}

impl EmulatorNode {
    pub fn new(emu: MusicEmu, config: EmulatorConfig, max_frames_per_block: usize) -> Self {
        let pcm_buffer_i16 = vec![0; max_frames_per_block * config.target_channels];
        Self {
            emu,
            config,
            pcm_buffer_i16,
        }
    }

    #[inline]
    pub fn process(&mut self, output_left: &mut [f32], output_right: &mut [f32]) -> Result<(), libgme_rs::GmeError> {
        let frame_count = output_left.len().min(self.pcm_buffer_i16.len() / 2);
        let active_slice = &mut self.pcm_buffer_i16[..frame_count * 2];

        self.emu.play(active_slice)?;

        for (i, chunk) in active_slice.chunks_exact(2).enumerate().take(frame_count) {
            output_left[i] = chunk[0] as f32 / 32768.0;
            output_right[i] = chunk[1] as f32 / 32768.0;
        }

        Ok(())
    }

    pub fn set_track(&mut self, track: i32) -> Result<(), libgme_rs::GmeError> {
        self.emu.start_track(track)
    }

    pub fn mute_channel(&mut self, channel: i32, muted: bool) {
        self.emu.mute_voice(channel, muted);
    }
}
