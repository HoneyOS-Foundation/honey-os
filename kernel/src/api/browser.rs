use std::{ffi::CString, sync::Arc};

use honeyos_process::api::{ApiModuleBuilder, ApiModuleCtx};
use wasm_bindgen::{closure::Closure, prelude::wasm_bindgen};

/// Gets returned to describe a file
#[repr(C)]
#[wasm_bindgen]
struct FileDescriptor {
    len: u32,
    ptr: *const u8,
}

/// Register the browser api
pub fn register_browser_api(ctx: Arc<ApiModuleCtx>, builder: &mut ApiModuleBuilder) {
    // hapi_browser_user_agent
    // Returns a pointer to the user agent.
    // ### Returns
    // - The user agent on success
    // - `NULL`` if failed allocate the string.
    let ctx_f = ctx.clone();
    let user_agent = web_sys::js_sys::eval("self.navigator.userAgent")
        .unwrap()
        .as_string()
        .unwrap();
    let user_agent = CString::new(user_agent).unwrap();
    let user_agent_bytes = user_agent.as_bytes();
    let user_agent_len = user_agent_bytes.len() as u32;
    builder.register(
        "hapi_browser_user_agent",
        Closure::<dyn Fn() -> *const u8>::new(move || {
            let memory = ctx_f.memory();
            let Some(ptr) =
                memory.alloc(user_agent_len as u32 * std::mem::size_of::<char>() as u32)
            else {
                return std::ptr::null();
            };
            memory.write(ptr, user_agent.as_bytes());
            ptr as *const u8
        })
        .into_js_value(),
    );

    // hapi_browser_user_agent_length
    // Returns the length of the user agent string
    builder.register(
        "hapi_browser_user_agent_length",
        Closure::<dyn Fn() -> u32>::new(move || user_agent_len).into_js_value(),
    );

    // hapi_browser_is_online
    // Returns whether the browser is online
    let is_online: bool = web_sys::js_sys::eval("self.navigator.onLine")
        .unwrap()
        .as_bool()
        .unwrap();
    builder.register(
        "hapi_browser_is_online",
        Closure::<dyn Fn() -> u32>::new(move || is_online as u32).into_js_value(),
    );

    // hapi_browser_request_upload
    // Tell the browser to create an upload window.
    // Blocks until a file is uploaded.
    // Returns the bytes in the file.
    // let ctx_f = ctx.clone();
    // builder.register(
    //     "hapi_browser_request_upload",
    //     Closure::<dyn Fn() -> *const u8>::new(move || 0 as *const u8).into_js_value(),
    // );[
}
