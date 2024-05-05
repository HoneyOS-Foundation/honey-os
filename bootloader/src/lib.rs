use std::time::Duration;

use hapi::{
    display::DisplayServer,
    js_console::{log, JsConsoleLogger},
};

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

/// The color test of the display server
const COLOR_TEST: &str = "                                             \x1b[30m▓\x1b[90m█\x1b[31m▓\x1b[91m█\x1b[32m▓\x1b[92m█\x1b[33m▓\x1b[93m█\x1b[34m▓\x1b[94m█\x1b[35m▓\x1b[95m█\x1b[36m▓\x1b[96m█\x1b[37m▓\x1b[97m█";

#[hapi::main]
fn main() -> anyhow::Result<()> {
    JsConsoleLogger::init();

    let mut display = DisplayServer::register();
    DisplayServer::claim(&display)?;

    let mut last = hapi::time::since_startup();
    let mut delta = 0.0;
    loop {
        display.set_text(format!(
            "FPS: {}\n{}\n{}",
            (1.0f64 / delta).floor(),
            GREETING_MESSAGE,
            COLOR_TEST
        ))?;

        // Calculate fps
        let now = hapi::time::since_startup();
        delta = now as f64 - last as f64;
        last = now;

        std::thread::sleep(Duration::from_millis(1));
    }
}
