use std::{ffi::CString, sync::Arc};

use honeyos_process::{
    api::{ApiModuleBuilder, ApiModuleCtx},
    ProcessManager,
};
use wasm_bindgen::closure::Closure;

/// Register the process api
pub fn register_process_api(ctx: Arc<ApiModuleCtx>, builder: &mut ApiModuleBuilder) {
    // hapi_process_get_pid
    // Returns the process id of the current process
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_process_get_pid",
        Closure::<dyn Fn() -> *const u8>::new(move || {
            let pid = ctx_f.pid().to_string();
            let memory = ctx_f.memory();
            let Some(ptr) = memory.alloc(pid.len() as u32) else {
                return std::ptr::null();
            };

            let cstring = CString::new(pid).unwrap();
            memory.write(ptr, &cstring.as_bytes());
            ptr as *const u8
        })
        .into_js_value(),
    );

    // hapi_process_spawn_subprocess
    // Spawn a wasm binary as a subprocess.
    // ### Returns
    // - The pid of the subprocess on success.
    // - NULL if the subprocess failed to spawn.
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_process_spawn_subprocess",
        Closure::<dyn Fn(*const u8, u32) -> *const u8>::new(move |bin, bin_len| {
            let memory = ctx_f.memory();
            let wasm_bin = memory.read(bin as u32, bin_len);

            let mut process_manager = ProcessManager::blocking_get();
            let pid = process_manager.spawn(wasm_bin, None);

            // Return the process id
            let pid = pid.to_string();
            let Some(ptr) = memory.alloc(pid.len() as u32) else {
                return std::ptr::null();
            };

            let cstring = CString::new(pid).unwrap();
            memory.write(ptr, &cstring.as_bytes());
            ptr as *const u8
        })
        .into_js_value(),
    );
}
