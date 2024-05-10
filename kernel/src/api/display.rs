use std::{ffi::CString, sync::Arc};

use honeyos_display::{DisplayMode, DisplayServer, KeyBuffer};
use honeyos_process::{
    api::{ApiModuleBuilder, ApiModuleCtx},
    ProcessManager,
};
use wasm_bindgen::closure::Closure;

/// Register the display api
pub fn register_display_api(ctx: Arc<ApiModuleCtx>, builder: &mut ApiModuleBuilder) {
    // hapi_display_server_register
    // Registers a display for the process
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
    // Claim the display server, displaying the process's display
    // ### Returns
    // - `0` on success
    // - `-1` if no display is registered
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
    // Push stdout to the display's text-mode buffer.
    // ### Returns
    // - `0` on success
    // - `-1` if no display is registered
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_display_push_stdout",
        Closure::<dyn Fn() -> i32>::new(move || loop {
            let mut display_server = DisplayServer::blocking_get();
            let Some(display) = display_server.display_mut(ctx_f.pid()) else {
                return -1;
            };

            // Get stdout from the process manager
            let mut process_manager = ProcessManager::blocking_get();
            let process = process_manager.process_mut(ctx_f.pid()).unwrap();
            let stdout = process.stdout_mut();
            // Sync stdout
            stdout.sync();

            // Send stdout to the display
            display.set_text(stdout.buffer());
            return 0;
        })
        .into_js_value(),
    );

    // hapi_display_set_text
    // Set the text in the displays text-mode buffer.
    // ### Returns
    // - `0` on success
    // - `-1` if no display is registered
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_display_set_text",
        Closure::<dyn Fn(*const u8, u32) -> i32>::new(move |ptr: *const u8, len: u32| loop {
            let mut display_server: std::sync::MutexGuard<DisplayServer> =
                DisplayServer::blocking_get();
            let Some(display) = display_server.display_mut(ctx_f.pid()) else {
                return -1;
            };

            let memory = ctx_f.memory();
            let buf = memory.read(ptr as u32, len);
            let string = String::from_utf8_lossy(&buf).to_string();
            display.set_text(string);
            return 0;
        })
        .into_js_value(),
    );

    // hapi_display_get_key_buffer
    // Get the key in the displays key buffer. Clears it afterwards.
    // ### Returns
    // - `-1` or if the key buffer is empty.
    // - `-2` if no display is registered.
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_display_get_key_buffer",
        Closure::<dyn Fn() -> i32>::new(move || loop {
            let mut display_server = DisplayServer::blocking_get();
            let Some(display) = display_server.display_mut(ctx_f.pid()) else {
                return -2;
            };
            return display.keybuffer.key;
        })
        .into_js_value(),
    );

    // hapi_display_get_key_shift
    // Whether or not the shift key is in the key buffer
    // ### Returns
    // - `-1` if no display is registered.
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_display_get_key_shift",
        Closure::<dyn Fn() -> i32>::new(move || loop {
            let mut display_server = DisplayServer::blocking_get();
            let Some(display) = display_server.display_mut(ctx_f.pid()) else {
                return -1;
            };
            return display.keybuffer.shift as i32;
        })
        .into_js_value(),
    );

    // hapi_display_get_key_ctrl
    // Whether or not the control key is in the key buffer
    // ### Returns
    // - `-1` if no display is registered.
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_display_get_key_ctrl",
        Closure::<dyn Fn() -> i32>::new(move || loop {
            let mut display_server = DisplayServer::blocking_get();
            let Some(display) = display_server.display_mut(ctx_f.pid()) else {
                return -1;
            };
            return display.keybuffer.ctrl as i32;
        })
        .into_js_value(),
    );

    // hapi_display_clear_key
    // Clears the key buffer of the display
    // ### Returns
    // - `-1` if no display is registered.
    let ctx_f = ctx.clone();
    builder.register(
        "hapi_display_clear_key",
        Closure::<dyn Fn() -> i32>::new(move || loop {
            let mut display_server = DisplayServer::blocking_get();
            let Some(display) = display_server.display_mut(ctx_f.pid()) else {
                return -1;
            };
            display.keybuffer = KeyBuffer {
                key: -1,
                shift: false,
                ctrl: false,
            };
            return 0;
        })
        .into_js_value(),
    );
}
