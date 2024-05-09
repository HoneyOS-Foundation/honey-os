use std::ffi::CStr;

/// Get the process id
pub fn pid() -> Option<String> {
    let ptr = unsafe { crate::ffi::hapi_process_get_pid() };
    // # Safety
    // Since the string is garunteed to be null ternimated, there is no way of accessing unallocated memory
    let cstring = unsafe { CStr::from_ptr(ptr as *const i8) };
    Some(cstring.to_string_lossy().to_string())
}
