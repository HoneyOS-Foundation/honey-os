use honey_os::{display::Display, system::shell::SystemShell};
use wasm_bindgen::{closure::Closure, prelude::wasm_bindgen, JsCast};

#[wasm_bindgen(main)]
async fn main() {
    console_log::init_with_level(log::Level::Info).unwrap();
    set_panicking_hook();

    let window = web_sys::window().unwrap();
    let document = window.document().unwrap();

    // Initialize the display
    init_display(&document);

    // Initialize the head shell
    {
        SystemShell::init_once();

        // Welcome message
        let shell = SystemShell::get();
        let mut shell = shell.lock().unwrap();
        shell.stdout_mut().writeln("Welcome to Honey OS!");
    }
    // Display the shell on the screen
    {
        let display = Display::get();
        let display = display.lock().unwrap();
        display.display(&SystemShell);
    }

    // Start the execution loop
    execution_loop(0.0);
}

/// The panic hook for the WASM module
fn set_panicking_hook() {
    static SET_HOOK: std::sync::Once = std::sync::Once::new();
    SET_HOOK.call_once(|| {
        std::panic::set_hook(Box::new(|panic_info| {
            // Destroy the head shell
            SystemShell::destroy();

            let display = Display::get();
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

    // Initialize the head display
    Display::init_once(display.unchecked_into());
}

/// The main execution loop of the OS
/// This function will be called repeatedly to execute the OS
fn execution_loop(_time_stamp: f64) {
    // The main execution loop of the OS
    let window = web_sys::window().unwrap();

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
