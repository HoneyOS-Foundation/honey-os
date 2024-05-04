use std::sync::Arc;

use honeyos_display::{DisplayMode, DisplayServer};
use honeyos_process::api::{ApiModuleBuilder, ApiModuleCtx};
use wasm_bindgen::closure::Closure;

use crate::process::process_manager;

/// Register the display api
pub fn register_display_api(ctx: Arc<ApiModuleCtx>, builder: &mut ApiModuleBuilder) {
    // hapi_display_server_register
    // - Registers a display for the process
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_display_server_register",
        Closure::<dyn Fn()>::new(move || {
            let mut display_server = DisplayServer::blocking_get();
            display_server.register(ctx_f.pid(), DisplayMode::Text);
        })
        .into_js_value(),
    );
    // hapi_display_server_claim_main
    // - Claim the display server, displaying the process's display
    // - Returns -1 if no display is registered
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_display_server_claim_main",
        Closure::<dyn Fn() -> i32>::new(move || {
            let mut display_server = DisplayServer::blocking_get();
            if !display_server.has_display(ctx_f.pid()) {
                return -1;
            }
            display_server.set_current(ctx_f.pid());
            return 0;
        })
        .into_js_value(),
    );

    // hapi_display_push_stdout
    // - Push stdout to the display.
    // - Returns -1 if no display is registered
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_display_push_stdout",
        Closure::<dyn Fn() -> i32>::new(move || loop {
            let mut display_server = DisplayServer::blocking_get();
            let Some(display) = display_server.display_mut(ctx_f.pid()) else {
                return -1;
            };

            // Get stdout from the process manager
            let process_manager = process_manager();
            let Ok(mut process_manager) = process_manager.try_lock() else {
                continue;
            };
            let process = process_manager.get_mut(ctx_f.pid()).unwrap();
            let stdout = process.stdout_mut();
            // Sync stdout
            stdout.sync();

            // Send stdout to the display
            display.text = stdout.buffer();
            return 0;
        })
        .into_js_value(),
    );
}
