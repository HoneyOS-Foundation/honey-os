/// Get the user agent of the browser
pub fn user_agent<'a>() -> Option<&'a str> {
    // # Safety
    // Since we check for failed allocations, there is no way to access unallocated memory.
    let ptr = unsafe { crate::ffi::hapi_browser_user_agent() };
    let len = unsafe { crate::ffi::hapi_browser_user_agent_length() } as usize;

    if ptr == std::ptr::null() {
        return None;
    }

    unsafe { std::str::from_utf8(std::slice::from_raw_parts(ptr, len)).ok() }
}

/// Return whether the browser is online
pub fn is_online() -> bool {
    unsafe { crate::ffi::hapi_browser_is_online() > 0 }
}
