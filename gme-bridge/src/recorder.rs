use std::fs::File;
use std::io::{self, Write, Seek, SeekFrom};
use std::path::Path;

pub struct WavWriter {
    file: File,
    data_size: u32,
}

impl WavWriter {
    pub fn create<P: AsRef<Path>>(path: P, sample_rate: u32, channels: u16) -> io::Result<Self> {
        let mut file = File::create(path)?;

        // Write RIFF/WAVE header placeholders
        file.write_all(b"RIFF")?;
        file.write_all(&[0u8; 4])?; // ChunkSize placeholder
        file.write_all(b"WAVE")?;
        file.write_all(b"fmt ")?;
        file.write_all(&16u32.to_le_bytes())?; // Subchunk1Size (16 for PCM)
        file.write_all(&3u16.to_le_bytes())?;  // AudioFormat (3 for IEEE float)
        file.write_all(&channels.to_le_bytes())?;
        file.write_all(&sample_rate.to_le_bytes())?;
        
        let byte_rate = sample_rate * channels as u32 * 4; // 4 bytes per float sample
        file.write_all(&byte_rate.to_le_bytes())?;
        
        let block_align = channels * 4;
        file.write_all(&block_align.to_le_bytes())?;
        file.write_all(&32u16.to_le_bytes())?; // BitsPerSample (32 for float)
        file.write_all(b"data")?;
        file.write_all(&[0u8; 4])?; // Subchunk2Size placeholder

        Ok(Self { file, data_size: 0 })
    }

    pub fn write_interleaved(&mut self, samples: &[f32]) -> io::Result<()> {
        for &sample in samples {
            self.file.write_all(&sample.to_le_bytes())?;
            self.data_size += 4;
        }
        Ok(())
    }

    pub fn finalize(&mut self) -> io::Result<()> {
        let file_size = 36 + self.data_size;
        self.file.seek(SeekFrom::Start(4))?;
        self.file.write_all(&file_size.to_le_bytes())?;
        self.file.seek(SeekFrom::Start(40))?;
        self.file.write_all(&self.data_size.to_le_bytes())?;
        self.file.flush()?;
        Ok(())
    }
}
