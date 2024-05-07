use std::sync::Arc;

use honeyos_process::api::{ApiModuleBuilder, ApiModuleCtx};
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
            memory.write(ptr, &pid.as_bytes());
            ptr as *const u8
        })
        .into_js_value(),
    );
}
