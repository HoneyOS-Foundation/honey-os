use std::ffi::CStr;

/// Get the user agent of the browser
pub fn user_agent<'a>() -> Option<String> {
    // # Safety
    // Since we check for failed allocations, there is no way to access unallocated memory.
    let ptr = unsafe { crate::ffi::hapi_browser_user_agent() };
    if ptr == std::ptr::null() {
        return None;
    }

    // # Safety
    // Since we know for certain the string is null terminated, there is no way to access unallocated memory
    let cstring = unsafe { CStr::from_ptr(ptr as *const i8) };
    Some(cstring.to_string_lossy().to_string())
}

/// Return whether the browser is online
pub fn is_online() -> bool {
    unsafe { crate::ffi::hapi_browser_is_online() > 0 }
}
