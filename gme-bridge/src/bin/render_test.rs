use libgme_rs::MusicEmu;
use gme_bridge::{EmulatorNode, EmulatorConfig};
use std::env;
use std::path::Path;

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: {} <path-to-vgm-or-nsf-file> [track_index]", args[0]);
        std::process::exit(1);
    }

    let file_path = &args[1];
    let track_idx: i32 = args.get(2)
        .and_then(|s| s.parse().ok())
        .unwrap_or(0);

    let sample_rate = 44100_i64;
    println!("Opening game music file: {}", file_path);

    let emu = MusicEmu::open_file(Path::new(file_path), sample_rate)
        .expect("Failed to open music file with libgme");

    let track_count = emu.track_count();
    println!("Successfully loaded! Total tracks available: {}", track_count);

    let config = EmulatorConfig {
        sample_rate: sample_rate as f32,
        target_channels: 2,
    };

    let max_block_size = 512;
    let mut node = EmulatorNode::new(emu, config, max_block_size);

    node.set_track(track_idx)
        .expect("Failed to start selected track");

    println!("Rendering track {} at {} Hz...", track_idx, sample_rate);

    let mut left_buf = vec![0.0f32; max_block_size];
    let mut right_buf = vec![0.0f32; max_block_size];

    // Simulate rendering 5 seconds of audio in real-time blocks
    let total_seconds = 5;
    let blocks_per_second = sample_rate as usize / max_block_size;
    let total_blocks = blocks_per_second * total_seconds;

    for block in 0..total_blocks {
        node.process(&mut left_buf, &mut right_buf)
            .expect("Error during emulator audio processing");

        if block % blocks_per_second == 0 {
            print!(".");
            std::io::Write::flush(&mut std::io::stdout()).unwrap();
        }
    }

    println!("\nSuccessfully rendered {} seconds of audio through the emulator node!", total_seconds);
}
