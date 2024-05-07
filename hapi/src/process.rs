/// Get the process id
pub fn pid() -> Option<&'static str> {
    const UUID_SIZE: usize = 36;
    let ptr = unsafe { crate::ffi::hapi_process_get_pid() };
    unsafe { std::str::from_utf8(std::slice::from_raw_parts(ptr, UUID_SIZE)).ok() }
}
