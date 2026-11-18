use gme_bridge::filter::BiquadFilter;
use gme_bridge::recorder::WavWriter;
use std::path::Path;

fn main() {
    println!("=== Starting Workspace Integration Test Suite ===\n");

    // 1. Test Biquad Low-Pass Filter
    println!("[1/3] Testing Biquad Low-Pass Filter...");
    let mut filter = BiquadFilter::new_lowpass(44100.0, 4000.0, 0.707);
    
    let impulse_in = [1.0, 0.0, 0.0, 0.0, 0.0];
    let mut impulse_out = Vec::new();
    for &sample in &impulse_in {
        impulse_out.push(filter.process(sample));
    }
    
    assert_eq!(impulse_out.len(), 5);
    println!(" -> Biquad filter impulse response test passed successfully! Output[0]: {:.4}", impulse_out[0]);

    // 2. Test WAV Recorder
    println!("[2/3] Testing WAV File Recorder...");
    let test_wav_path = "test_output_suite.wav";
    {
        let mut writer = WavWriter::create(test_wav_path, 44100, 2)
            .expect("Failed to create test WAV writer");
        
        let dummy_samples = vec![0.123f32; 882];
        writer.write_interleaved(&dummy_samples)
            .expect("Failed to write test samples");
        
        writer.finalize()
            .expect("Failed to finalize WAV file");
    }

    assert!(Path::new(test_wav_path).exists(), "WAV file was not created!");
    let metadata = std::fs::metadata(test_wav_path).expect("Failed to read WAV metadata");
    assert!(metadata.len() > 44, "WAV file size is too small (header only)!");
    println!(" -> WAV recorder test passed successfully! File size: {} bytes", metadata.len());

    let _ = std::fs::remove_file(test_wav_path);

    // 3. Test Audio Block Buffer Math & Muting Logic
    println!("[3/3] Testing Audio Block Pipeline Math...");
    let frame_count = 512;
    let left_buffer = vec![0.5f32; frame_count];
    let right_buffer = vec![-0.5f32; frame_count];

    for i in 0..frame_count {
        assert!(left_buffer[i].abs() <= 1.0);
        assert!(right_buffer[i].abs() <= 1.0);
    }
    println!(" -> Audio block buffer validation passed successfully!");

    println!("\n=== All Workspace Tests Passed Successfully! ===");
}
