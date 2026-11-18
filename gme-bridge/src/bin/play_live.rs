use libgme_rs::MusicEmu;
use gme_bridge::{EmulatorNode, EmulatorConfig};
use gme_bridge::filter::BiquadFilter;
use gme_bridge::recorder::WavWriter;
use cpal::traits::{DeviceTrait, HostTrait, StreamTrait};
use std::env;
use std::path::Path;
use std::sync::{Arc, Mutex};
use std::io::{self, BufRead, Write};

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: {} <path-to-audio-file> [initial_track] [output_wav_file]", args[0]);
        std::process::exit(1);
    }

    let file_path = &args[1];
    let initial_track: i32 = args.get(2)
        .and_then(|s| s.parse().ok())
        .unwrap_or(0);
    let wav_output_path = args.get(3).cloned();

    let sample_rate = 44100_u32;
    println!("Loading retro audio file: {}", file_path);

    let emu = MusicEmu::open_file(Path::new(file_path), sample_rate as i64)
        .expect("Failed to open music file with libgme");

    let track_count = emu.track_count();
    println!("Loaded successfully! Total available tracks: 0 to {}", track_count - 1);

    if let Some(ref path) = wav_output_path {
        println!("Recording enabled -> Saving output stream to {}", path);
    }

    let config = EmulatorConfig {
        sample_rate: sample_rate as f32,
        target_channels: 2,
    };

    let max_block_size = 512;
    let mut node = EmulatorNode::new(emu, config, max_block_size);
    node.set_track(initial_track).expect("Failed to start initial track");

    let mut filter_left = BiquadFilter::new_lowpass(sample_rate as f32, 4000.0, 0.707);
    let mut filter_right = BiquadFilter::new_lowpass(sample_rate as f32, 4000.0, 0.707);

    let node_arc = Arc::new(Mutex::new(node));
    let recorder_arc = Arc::new(Mutex::new(
        wav_output_path.map(|p| WavWriter::create(p, sample_rate, 2).expect("Failed to create WAV file"))
    ));

    let host = cpal::default_host();
    let device = host.default_output_device()
        .expect("No output audio device found");

    let mut cpal_config: cpal::StreamConfig = device.default_output_config()
        .expect("Failed to get default output config")
        .into();
    
    cpal_config.sample_rate = cpal::SampleRate(sample_rate);
    cpal_config.channels = 2;

    let err_fn = |err| eprintln!("An error occurred on the audio stream: {}", err);

    let node_clone = Arc::clone(&node_arc);
    let recorder_clone = Arc::clone(&recorder_arc);
    let stream = device.build_output_stream(
        &cpal_config,
        move |data: &mut [f32], _: &cpal::OutputCallbackInfo| {
            let mut node = node_clone.lock().unwrap();
            let frame_count = data.len() / 2;
            
            let mut left = vec![0.0f32; frame_count];
            let mut right = vec![0.0f32; frame_count];

            if node.process(&mut left, &mut right).is_ok() {
                let mut peak_l: f32 = 0.0;
                let mut peak_r: f32 = 0.0;
                let mut interleaved_frame = vec![0.0f32; data.len()];

                for (i, frame) in data.chunks_mut(2).enumerate() {
                    let l = filter_left.process(left[i]);
                    let r = filter_right.process(right[i]);
                    frame[0] = l;
                    frame[1] = r;

                    interleaved_frame[i * 2] = l;
                    interleaved_frame[i * 2 + 1] = r;

                    if l.abs() > peak_l { peak_l = l.abs(); }
                    if r.abs() > peak_r { peak_r = r.abs(); }
                }

                if let Some(recorder) = recorder_clone.lock().unwrap().as_mut() {
                    let _ = recorder.write_interleaved(&interleaved_frame);
                }

                let bar_width = 30;
                let filled_l = ((peak_l.clamp(0.0, 1.0) * bar_width as f32) as usize).min(bar_width);
                let filled_r = ((peak_r.clamp(0.0, 1.0) * bar_width as f32) as usize).min(bar_width);

                let meter_l = format!("[{:<width$}]", "=".repeat(filled_l), width = bar_width);
                let meter_r = format!("[{:<width$}]", "=".repeat(filled_r), width = bar_width);

                print!("\rL: {} ({:.2}) | R: {} ({:.2})  ", meter_l, peak_l, meter_r, peak_r);
                let _ = io::stdout().flush();
            } else {
                data.fill(0.0);
            }
        },
        err_fn,
        None,
    ).expect("Failed to build output audio stream");

    stream.play().expect("Failed to start audio stream");

    println!("\n=== Interactive Audio Player with WAV Recording ===");
    println!("Commands:");
    println!("  <track_num>        - Switch track (0 to {})", track_count - 1);
    println!("  mute <channel>     - Mute specific sound channel");
    println!("  unmute <channel>   - Unmute specific sound channel");
    println!("  q                  - Exit and finalize recording\n");

    let node_input_clone = Arc::clone(&node_arc);
    let recorder_exit_clone = Arc::clone(&recorder_arc);
    std::thread::spawn(move || {
        let stdin = io::stdin();
        for line in stdin.lock().lines() {
            if let Ok(input) = line {
                let trimmed = input.trim();
                if trimmed.eq_ignore_ascii_case("q") {
                    println!("\nExiting...");
                    if let Some(recorder) = recorder_exit_clone.lock().unwrap().as_mut() {
                        let _ = recorder.finalize();
                        println!("WAV file recording successfully finalized and saved.");
                    }
                    std::process::exit(0);
                }

                let parts: Vec<&str> = trimmed.split_whitespace().collect();
                if parts.is_empty() {
                    continue;
                }

                let mut node = node_input_clone.lock().unwrap();
                if parts.len() == 2 && (parts[0].eq_ignore_ascii_case("mute") || parts[0].eq_ignore_ascii_case("unmute")) {
                    if let Ok(channel) = parts[1].parse::<i32>() {
                        let mute = parts[0].eq_ignore_ascii_case("mute");
                        node.mute_channel(channel, mute);
                        println!("\n-> Channel {} {}", channel, if mute { "muted" } else { "unmuted" });
                    } else {
                        println!("\nInvalid channel number.");
                    }
                } else if let Ok(new_track) = trimmed.parse::<i32>() {
                    match node.set_track(new_track) {
                        Ok(_) => println!("\n-> Switched live to track {}", new_track),
                        Err(e) => eprintln!("\n-> Failed to switch track: {}", e),
                    }
                } else {
                    println!("\nUnknown command.");
                }
            }
        }
    });

    loop {
        std::thread::sleep(std::time::Duration::from_millis(500));
    }
}
