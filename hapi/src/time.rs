/// Get the time in seconds since the start of the process
pub fn since_startup() -> f64 {
    unsafe { crate::ffi::hapi_time_since_startup() }
}
