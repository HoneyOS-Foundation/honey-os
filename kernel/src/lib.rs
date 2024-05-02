pub mod display;
pub mod process;
pub mod system;

use crate::{
    display::HeadDisplay,
    process::{init_process_manager, process_manager},
    system::fs::init_fs_manager,
};
use wasm_bindgen::{closure::Closure, prelude::wasm_bindgen, JsCast};

/// The greeting message of the OS
const GREETING_MESSAGE: &str = r#"                                                    
.-..-.                         .--.  .--.   Developed by GetAGripGal
: :; :                        : ,. :: .--'  ---------------------------
:    : .--. ,-.,-. .--. .-..-.: :: :`. `.   Online: #online#
: :: :' .; :: ,. :' '_.': :; :: :; : _`, :  User-Agent: #user_agent#
:_;:_;`.__.':_;:_;`.__.'`._. ;`.__.'`.__.'  ---------------------------
                         .-. :              Welcome to HoneyOS!
                         `._.'              ---------------------------
"#;

/// The kernel entrypoint
#[wasm_bindgen(start)]
fn main() {
    console_log::init_with_level(log::Level::Info).unwrap();
    set_panicking_hook();

    log::info!("{}", format_greeting_message());

    let window = web_sys::window().unwrap();
    let document = window.document().unwrap();
    // Initialize the filesystem manager
    init_fs_manager();
    // Initialize the display
    init_display(&document);
    // Initialize the process manager
    init_process_manager();

    // Start the execution loop
    execution_loop(0.0);
}

/// The panic hook for the WASM module
fn set_panicking_hook() {
    static SET_HOOK: std::sync::Once = std::sync::Once::new();
    SET_HOOK.call_once(|| {
        std::panic::set_hook(Box::new(|panic_info| {
            log::error!("Kernel Panic: {}", panic_info);

            let display = HeadDisplay::get();
            let display = display.lock().unwrap();
            display.clear();
            display.root().set_inner_html(&format!(
                "<pre>Kernel Panic: </pre><pre>{}</pre>",
                panic_info
            ));
        }));
    });
}

/// Initialize the display
fn init_display(document: &web_sys::Document) {
    // Create the display
    let display = document.create_element("div").unwrap();
    display.set_id("display");
    document.body().unwrap().append_child(&display).unwrap();
    display.set_inner_html(&format_greeting_message());

    // Initialize the head display
    HeadDisplay::init_once(display.unchecked_into());
}

// /// Initialize the system shell
// fn init_shell() {
//     let display: std::sync::Arc<std::sync::Mutex<HeadDisplay>> = HeadDisplay::get();
//     let display = display.lock().unwrap();
//     let root = display.root();
//     root.set_inner_html(&format_greeting_message());
// }

/// Format the greeting message with the system information
fn format_greeting_message() -> String {
    let window = web_sys::window().unwrap();
    let navigator = window.navigator();
    let user_agent = navigator.user_agent().unwrap();
    let online = navigator.on_line();

    GREETING_MESSAGE
        .replace("#user_agent#", &user_agent)
        .replace("#online#", &online.to_string())
}

/// The main execution loop of the OS
/// This function will be called repeatedly to execute the OS
fn execution_loop(_time_stamp: f64) {
    // The main execution loop of the OS
    let window = web_sys::window().unwrap();

    // Update the process manager
    // Block until the process manager is available
    let pm = process_manager();
    if let Ok(mut pm) = pm.try_lock() {
        pm.update();
        let display = HeadDisplay::get();
        if let Ok(display) = display.try_lock() {
            for process in pm.processes_mut() {
                let Some(out) = process.stdout() else {
                    continue;
                };
                let html = display.root().inner_html();
                display.root().set_inner_html(&format!("{}{}", html, out));
            }
        };
    }

    // Schedule the next execution of the OS
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
