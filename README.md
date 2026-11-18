# Retro Audio Workspace (Rust & FFI Sound Chip Emulation Engine)

A high-performance, zero-allocation Rust audio workspace designed to rescue, wrap, and repurpose unmaintained C/C++ retro sound chip emulation libraries (`libgme` and `libVGM`) from Fedora distribution deprecation.

---

## Workspace Architecture
.
├── Cargo.toml            # Workspace manifest
├── libgme-sys/           # Low-level unsafe FFI bindings for Game Music Emu
├── libgme-rs/            # Safe idiomatic Rust wrappers for libgme
├── libvgm-sys/           # CMake build automation & bindgen bindings for libVGM
├── libvgm-rs/            # Safe idiomatic Rust wrappers for libVGM
└── gme-bridge/           # High-level audio graph, DSP filters, VU meter & WAV recorder

## Key Features Implemented

1. **Robust FFI & Build Automation (`libgme-sys`, `libvgm-sys`)**
   - Automated CMake building and static library linking for `libVGM` (`vgmplayer`, `vgmemu`, `vgmutil`) and system dependencies (`stdc++`, `z`, custom Linux `iconv` stubs).
   - `bindgen`-generated C++ bindings supporting C++ namespaces and robust error handling.

2. **Zero-Allocation DSP & Filtering (`gme-bridge/src/filter.rs`)**
   - Direct Form II Transposed biquad resonant low-pass filter operating in real time with zero heap allocations in the audio callback loop.

3. **Multi-Format Playback & Routing (`gme-bridge/src/synth.rs`)**
   - Unified `RetroAudioSource` trait handling NSF, SPC, VGM, GBS, and GYM formats seamlessly.

4. **Real-Time Terminal Peak VU Metering & Muting**
   - Live ASCII stereo peak metering (`L / R` RMS/peak bars).
   - Dynamic channel muting and voice isolation (`mute <channel>`, `unmute <channel>`).
   - Dynamic track switching on the fly via stdin terminal commands.

5. **Zero-Dependency WAV File Recording (`gme-bridge/src/recorder.rs`)**
   - Direct streaming of processed 32-bit IEEE float stereo audio to standard WAV files with automated RIFF header finalization on exit.

---

## Building and Testing

### Build the Workspace
```bash
cargo build --workspace

Run the Integration Test Suite
Executes the biquad filter impulse response test, WAV recorder verification, and audio buffer math checks:
cargo run --bin full_test

Run the Live Audio Player
Stream and filter retro music files in real time with CPAL audio output:
cargo run --bin play_live -- <path-to-file.nsf/.spc> [initial_track] [output_recording.wav]
License
MIT License. Authored under the framework of high-performance systems engineering.
