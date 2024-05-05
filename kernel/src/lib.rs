pub mod api;
pub mod boot;

use anyhow::anyhow;
use honeyos_display::DisplayServer;
use honeyos_fs::FsManager;
use honeyos_process::ProcessManager;
use wasm_bindgen::prelude::{wasm_bindgen, Closure, JsCast};

/// The kernel entrypoint
#[wasm_bindgen(start)]
async fn main() {
    console_log::init_with_level(log::Level::Info).unwrap();
    set_panic_hook();

    let window = web_sys::window()
        .ok_or(anyhow!(
            "Failed to get window. Kernel must be executed in main thread."
        ))
        .unwrap();

    // Initialize kernel systems
    DisplayServer::init_once();
    FsManager::init_once();
    ProcessManager::init_once(api::register_api);

    // Request the boot excutable and execute it once fetched
    boot::request_boot_executable(&window).await.unwrap();

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
