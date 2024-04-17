use honeyos_kernel::{
    display::HeadDisplay, system::fs::init_fs_manager, system::shell::SystemShell,
};
use wasm_bindgen::{closure::Closure, prelude::wasm_bindgen, JsCast};

/// The greeting message of the OS
const GREETING_MESSAGE: &str = r#"                                                    
.-..-.                         .--.  .--.   Developed by GetAGripGal
: :; :                        : ,. :: .--'  ---------------------------
:    : .--. ,-.,-. .--. .-..-.: :: :`. `.   Online: #online#
: :: :' .; :: ,. :' '_.': :; :: :; : _`, :  User-Agent: #user_agent#
:_;:_;`.__.':_;:_;`.__.'`._. ;`.__.'`.__.'  ---------------------------
                          .-. :             Welcome to HoneyOS!
                          `._.'             Type 'help' for a list of commands.
                                            A desktop environment is coming soon!
                                            For now, enjoy the shell! :3
                                            ---------------------------
"#;

#[wasm_bindgen(main)]
async fn main() {
    console_log::init_with_level(log::Level::Info).unwrap();
    set_panicking_hook();

    log::info!("{}", format_greeting_message());

    let window = web_sys::window().unwrap();
    let document = window.document().unwrap();

    // Initialize the filesystem manager
    init_fs_manager();
    // Initialize the display
    init_display(&document);
    // Initialize the system shell
    init_shell();

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

    // Initialize the head display
    HeadDisplay::init_once(display.unchecked_into());
}

/// Initialize the system shell
fn init_shell() {
    SystemShell::init_once();

    // Welcome message
    {
        let shell = SystemShell::get();
        let mut shell = shell.lock().unwrap();
        shell.stdout_mut().write(format_greeting_message());
    }
    // Display the shell on the screen
    {
        let display: std::sync::Arc<std::sync::Mutex<HeadDisplay>> = HeadDisplay::get();
        let display = display.lock().unwrap();
        display.display(&SystemShell);
    }
}

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
