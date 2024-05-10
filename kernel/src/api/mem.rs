use std::{os::raw::c_void, sync::Arc};

use honeyos_process::api::{ApiModuleBuilder, ApiModuleCtx};
use wasm_bindgen::closure::Closure;

/// Register the memory api
pub fn register_mem_api(ctx: Arc<ApiModuleCtx>, builder: &mut ApiModuleBuilder) {
    // hapi_mem_alloc
    // Allocate a block of memory and return it's pointer.
    // ### Returns
    // - The pointer to the block
    // - `NULL` if the memory allocation failed
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_mem_alloc",
        Closure::<dyn Fn(u32) -> *mut c_void>::new(move |size| {
            let memory = ctx_f.memory();
            let Some(ptr) = memory.alloc(size) else {
                return std::ptr::null_mut();
            };
            ptr as *mut c_void
        })
        .into_js_value(),
    );

    // hapi_mem_realloc
    // Reallocate a block of memory and return the new pointer.
    // ### Returns
    // - The pointer to the block
    // - `NULL` if the memory allocation failed
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_mem_realloc",
        Closure::<dyn Fn(*mut c_void, u32) -> *mut c_void>::new(move |ptr, size| {
            let memory = ctx_f.memory();
            let Some(new_ptr) = memory.realloc(ptr as u32, size) else {
                return std::ptr::null_mut();
            };
            new_ptr as *mut c_void
        })
        .into_js_value(),
    );
}
