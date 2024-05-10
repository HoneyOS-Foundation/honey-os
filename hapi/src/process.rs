use std::ffi::CStr;

/// Get the process id
pub fn pid() -> Option<String> {
    let ptr = unsafe { crate::ffi::hapi_process_get_pid() };
    // # Safety
    // Since the string is garunteed to be null ternimated, there is no way of accessing unallocated memory
    let cstring = unsafe { CStr::from_ptr(ptr as *const i8) };
    Some(cstring.to_string_lossy().to_string())
}

/// Spawn a wasm binary as a subprocess and return it's pid
pub fn spawn_subprocess(bin: &[u8]) -> Option<String> {
    let bin = bin.to_vec();
    let pid_ptr =
        unsafe { crate::ffi::hapi_process_spawn_subprocess(bin.as_ptr(), bin.len() as u32) };

    if pid_ptr == std::ptr::null() {
        return None;
    }

    // # Safety
    // Since the string is garunteed to be null ternimated, there is no way of accessing unallocated memory
    let cstring = unsafe { CStr::from_ptr(pid_ptr as *const i8) };
    Some(cstring.to_string_lossy().to_string())
}
