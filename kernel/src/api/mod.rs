//! The kernel exposes some methods and constants to the wasm processes in order to control the os.
//! These methods need to be registered beforehand.
//! This is done by a callback that gets called everytime a process gets initialized.
pub mod browser;
pub mod display;
pub mod mem;
pub mod process;
pub mod time;

use std::sync::Arc;

use honeyos_process::{
    api::{ApiModuleBuilder, ApiModuleCtx},
    stdout::StdoutMessage,
};
use wasm_bindgen::closure::Closure;

use self::{
    browser::register_browser_api, display::register_display_api, mem::register_mem_api,
    process::register_process_api, time::register_time_api,
};

/// Register the api.
/// This gets called for every process that gets initialized
pub fn register_api(ctx: Arc<ApiModuleCtx>, builder: &mut ApiModuleBuilder) {
    register_js_console_api(ctx.clone(), builder);
    register_stdout_api(ctx.clone(), builder);
    register_display_api(ctx.clone(), builder);
    register_time_api(ctx.clone(), builder);
    register_process_api(ctx.clone(), builder);
    register_browser_api(ctx.clone(), builder);
    register_mem_api(ctx.clone(), builder)
}

/// Register the js-console api
fn register_js_console_api(ctx: Arc<ApiModuleCtx>, builder: &mut ApiModuleBuilder) {
    // hapi_js_console_log_info
    // Logs a string to the js console as info
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_js_console_log_info",
        Closure::<dyn Fn(*const u8, u32)>::new(move |ptr, len| {
            let string = ctx_f.memory().read(ptr as u32, len as u32);
            let string = String::from_utf8_lossy(&string).to_string();
            log::info!("PID: {} - {}", ctx_f.pid(), string);
        })
        .into_js_value(),
    );

    // hapi_js_console_log_warn
    // Logs a string to the js console as a warning
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_js_console_log_warn",
        Closure::<dyn Fn(*const u8, u32)>::new(move |ptr, len| {
            let string = ctx_f.memory().read(ptr as u32, len as u32);
            let string = String::from_utf8_lossy(&string).to_string();
            log::warn!("PID: {} - {}", ctx_f.pid(), string);
        })
        .into_js_value(),
    );

    // hapi_js_console_log_error
    // Logs a string to the js console as an error
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_js_console_log_error",
        Closure::<dyn Fn(*const u8, u32)>::new(move |ptr, len| {
            let string = ctx_f.memory().read(ptr as u32, len as u32);
            let string = String::from_utf8_lossy(&string).to_string();
            log::error!("PID: {} - {}", ctx_f.pid(), string);
        })
        .into_js_value(),
    );
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
