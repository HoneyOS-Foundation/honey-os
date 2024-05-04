pub mod api;
pub mod process;
pub mod system;

use crate::{process::init_process_manager, system::fs::init_fs_manager};
use honeyos_display::DisplayServer;
use wasm_bindgen::prelude::{wasm_bindgen, Closure, JsCast};

/// The kernel entrypoint
#[wasm_bindgen(start)]
async fn main() {
    console_log::init_with_level(log::Level::Info).unwrap();
    set_panic_hook();

    let window = web_sys::window().unwrap();

    // Initialize the display server
    DisplayServer::init_once();

    // Initialize the filesystem manager
    init_fs_manager();
    // Initialize the process manager
    init_process_manager(&window).await.unwrap();

    // Start the execution loop
    execution_loop(0.0);
}

/// The panic hook for the WASM module
fn set_panic_hook() {
    static SET_HOOK: std::sync::Once = std::sync::Once::new();
    SET_HOOK.call_once(|| {
        std::panic::set_hook(Box::new(|panic_info| {
            log::error!("Kernel Panic: {}", panic_info);

            let display_server = DisplayServer::get().unwrap();
            let root = display_server.root().unwrap();
            root.set_inner_text(&format!("Kernel Panic: {}", panic_info));
        }));
    });
}

/// The main execution loop of the OS
/// This function will be called repeatedly to execute the OS
fn execution_loop(_time_stamp: f64) {
    // The main execution loop of the OS
    let window = web_sys::window().unwrap();

    // Render the display server
    if let Some(mut display_server) = DisplayServer::get() {
        display_server.render();
    }

    // Schedule the next cycle
    window
        .request_animation_frame(
            &Closure::once_into_js(move |time_stamp: f64| {
                execution_loop(time_stamp);
            })
            .as_ref()
            .unchecked_ref(),
        )
        .unwrap();
}
