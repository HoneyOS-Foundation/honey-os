use std::time::Duration;

use hapi::display::{Display, DisplayServer};

/// The greeting message of the OS
const GREETING_MESSAGE: &str = r#"                                                    
.-..-.                         .--.  .--.   Developed by GetAGripGal
: :; :                        : ,. :: .--'  ---------------------------
:    : .--. ,-.,-. .--. .-..-.: :: :`. `.   Welcome to HoneyOS!
: :: :' .; :: ,. :' '_.': :; :: :; : _`, :  ---------------------------
:_;:_;`.__.':_;:_;`.__.'`._. ;`.__.'`.__.'  
                         .-. :
                         `._.'
"#;

/// Fake loading icon
fn loading_bar(display: &mut Display, message: &str, cycles: usize, delay: u64, success: bool) {
    const LOADING_ICONS: &[&str] = &[
        "\x1b[91m*\x1b[31m•\x1b[97m  ",
        "\x1b[31m•\x1b[91m*\x1b[31m•\x1b[97m ",
        " \x1b[31m•\x1b[91m*\x1b[31m•\x1b[97m",
        "  \x1b[31m•\x1b[91m*\x1b[97m",
        " \x1b[31m•\x1b[91m*\x1b[31m•\x1b[97m",
        "\x1b[31m•\x1b[91m*\x1b[31m•\x1b[97m ",
    ];

    for i in 0..cycles {
        let icon = LOADING_ICONS[i % LOADING_ICONS.len()];
        let output = format!("[{}] {}", icon, message);
        hapi::println!("{}", output);
        unsafe { hapi::ffi::hapi_display_push_stdout() };

        std::thread::sleep(Duration::from_millis(delay));
        hapi::stdout::clear_line();
    }

    let status_label = if success {
        " \x1b[92mok\x1b[97m "
    } else {
        "\x1b[91mfail\x1b[97m"
    };
    hapi::println!("[{}] {}", status_label, message);
    unsafe { hapi::ffi::hapi_display_push_stdout() };
}

#[hapi::main]
fn main() {
    // Register the display
    let mut display = DisplayServer::register();
    DisplayServer::claim(&display).unwrap();

    hapi::println!("Booting into HoneyOS");
    display.push_stdout().unwrap();

    loading_bar(&mut display, "Setting up the environment", 25, 250, true);
    loading_bar(&mut display, "Preparing funny messages", 25, 250, false);
    loading_bar(&mut display, "Moving some bytes", 25, 100, true);

    hapi::println!("Boot completed!");
    display.push_stdout().unwrap();
    std::thread::sleep(Duration::from_millis(500));

    hapi::stdout::clear();
    hapi::println!("{}", GREETING_MESSAGE);
    hapi::println!("Im sorry for lying. It's a fake loading screen :(");
    display.push_stdout().unwrap();
}
