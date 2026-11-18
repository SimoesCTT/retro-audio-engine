use libgme_rs::MusicEmu;
use std::path::Path;

pub trait RetroAudioSource {
    fn process_block(&mut self, left: &mut [f32], right: &mut [f32]) -> Result<(), String>;
    fn set_track(&mut self, track: i32) -> Result<(), String>;
    fn track_count(&self) -> i32;
}

pub struct GmeAudioSource {
    emu: MusicEmu,
    pcm_buffer: Vec<i16>,
}

impl GmeAudioSource {
    pub fn open<P: AsRef<Path>>(path: P, sample_rate: i64, max_frames: usize) -> Result<Self, String> {
        let emu = MusicEmu::open_file(path, sample_rate).map_err(|e| e.to_string())?;
        Ok(Self {
            emu,
            pcm_buffer: vec![0; max_frames * 2],
        })
    }
}

impl RetroAudioSource for GmeAudioSource {
    fn process_block(&mut self, left: &mut [f32], right: &mut [f32]) -> Result<(), String> {
        let frames = left.len().min(self.pcm_buffer.len() / 2);
        let slice = &mut self.pcm_buffer[..frames * 2];

        self.emu.play(slice).map_err(|e| e.to_string())?;

        for (i, chunk) in slice.chunks_exact(2).enumerate() {
            if i < frames {
                left[i] = chunk[0] as f32 / 32768.0;
                right[i] = chunk[1] as f32 / 32768.0;
            }
        }
        Ok(())
    }

    fn set_track(&mut self, track: i32) -> Result<(), String> {
        self.emu.start_track(track).map_err(|e| e.to_string())
    }

    fn track_count(&self) -> i32 {
        self.emu.track_count()
    }
}
