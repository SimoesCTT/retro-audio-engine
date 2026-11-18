use std::ffi::{CStr, CString};
use std::os::raw::{c_int, c_long};
use std::path::Path;
use libgme_sys::*;

#[derive(Debug)]
pub enum GmeError {
    CppError(String),
    NullPointer,
}

impl std::fmt::Display for GmeError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            GmeError::CppError(msg) => write!(f, "GME Error: {}", msg),
            GmeError::NullPointer => write!(f, "GME Error: Null pointer encountered"),
        }
    }
}

impl std::error::Error for GmeError {}

pub type Result<T> = std::result::Result<T, GmeError>;

pub struct MusicEmu {
    raw: *mut Music_Emu,
}

unsafe impl Send for MusicEmu {}

impl Drop for MusicEmu {
    fn drop(&mut self) {
        unsafe {
            if !self.raw.is_null() {
                gme_delete(self.raw);
            }
        }
    }
}

impl MusicEmu {
    pub fn open_file<P: AsRef<Path>>(path: P, sample_rate: c_long) -> Result<Self> {
        let path_str = path.as_ref().to_str().ok_or_else(|| {
            GmeError::CppError("Invalid path encoding".into())
        })?;
        let c_path = CString::new(path_str).map_err(|_| {
            GmeError::CppError("Path contains interior null byte".into())
        })?;

        let mut raw_emu: *mut Music_Emu = std::ptr::null_mut();
        unsafe {
            let err = gme_open_file(c_path.as_ptr(), &mut raw_emu, sample_rate as c_int);
            if !err.is_null() {
                let msg = CStr::from_ptr(err).to_string_lossy().into_owned();
                return Err(GmeError::CppError(msg));
            }
            if raw_emu.is_null() {
                return Err(GmeError::NullPointer);
            }
        }

        Ok(Self { raw: raw_emu })
    }

    pub fn start_track(&mut self, track: c_int) -> Result<()> {
        unsafe {
            let err = gme_start_track(self.raw, track);
            Self::check_err(err)
        }
    }

    pub fn play(&mut self, buffer: &mut [i16]) -> Result<()> {
        unsafe {
            let err = gme_play(self.raw, buffer.len() as c_int, buffer.as_mut_ptr());
            Self::check_err(err)
        }
    }

    pub fn track_count(&self) -> c_int {
        unsafe { gme_track_count(self.raw) }
    }

    pub fn mute_voice(&mut self, voice: c_int, muting: bool) {
        unsafe {
            gme_mute_voice(self.raw, voice, if muting { 1 } else { 0 });
        }
    }

    #[inline]
    fn check_err(err: gme_err_t) -> Result<()> {
        if err.is_null() {
            Ok(())
        } else {
            let msg = unsafe { CStr::from_ptr(err).to_string_lossy().into_owned() };
            Err(GmeError::CppError(msg))
        }
    }
}
