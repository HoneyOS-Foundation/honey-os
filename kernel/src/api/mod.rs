//! The kernel exposes some methods and constants to the wasm processes in order to control the os.
//! These methods need to be registered beforehand.
//! This is done by a callback that gets called everytime a process gets initialized.
pub mod display;
pub mod time;

use std::sync::Arc;

use honeyos_process::{
    api::{ApiModuleBuilder, ApiModuleCtx},
    stdout::StdoutMessage,
};
use wasm_bindgen::closure::Closure;

use self::{display::register_display_api, time::register_time_api};

/// Register the api.
/// This gets called for every process that gets initialized
pub fn register_api(ctx: Arc<ApiModuleCtx>, builder: &mut ApiModuleBuilder) {
    register_stdout_api(ctx.clone(), builder);
    register_display_api(ctx.clone(), builder);
    register_time_api(ctx.clone(), builder);
}

/// Register the stdout api
fn register_stdout_api(ctx: Arc<ApiModuleCtx>, builder: &mut ApiModuleBuilder) {
    // stdout_clear
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_stdout_clear",
        Closure::<dyn Fn()>::new(move || loop {
            if let Ok(mut stdout) = ctx_f.stdout().lock() {
                stdout.push(StdoutMessage::Clear);
                break;
            }
        })
        .into_js_value(),
    );
    // stdout_clear_line
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_stdout_clear_line",
        Closure::<dyn Fn()>::new(move || loop {
            if let Ok(mut stdout) = ctx_f.stdout().lock() {
                stdout.push(StdoutMessage::ClearLine);
                break;
            }
        })
        .into_js_value(),
    );
    // stdout_write
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_stdout_write",
        Closure::<dyn Fn(*const u8, u32)>::new(move |ptr: *const u8, len: u32| loop {
            let stdout = ctx_f.stdout();
            let Ok(mut stdout) = stdout.lock() else {
                continue;
            };
            let string = ctx_f.memory().read(ptr as u32, len as u32);
            let string = String::from_utf8_lossy(&string).to_string();
            stdout.push(StdoutMessage::String(string.clone()));
            log::info!("{}: {}", ctx_f.pid(), string);
            break;
        })
        .into_js_value(),
    );
}
