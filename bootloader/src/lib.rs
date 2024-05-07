use hapi::{display::DisplayServer, js_console::JsConsoleLogger, util::term::keypressed_to_string};
use std::time::Duration;

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
async fn main() -> anyhow::Result<()> {
    JsConsoleLogger::init();

    let mut display = DisplayServer::register();
    DisplayServer::claim(&display)?;

    let mut keyspressed = Vec::new();

    let mut last = hapi::time::since_startup();
    let mut delta = 0.0;

    display.set_text(format!(
        "{}\n{}\n{}",
        GREETING_MESSAGE,
        COLOR_TEST,
        keypressed_to_string(&keyspressed)
    ))?;

    loop {
        if let Some(key) = display.key_buffer() {
            keyspressed.push(key);

            display.set_text(format!(
                "{}\n{}\n{}",
                GREETING_MESSAGE,
                COLOR_TEST,
                keypressed_to_string(&keyspressed)
            ))?;
        }

        // Calculate fps
        let now = hapi::time::since_startup();
        delta = now as f64 - last as f64;
        last = now;

        std::thread::sleep(Duration::from_secs_f32(1.0 / 60.0));
    }
}
