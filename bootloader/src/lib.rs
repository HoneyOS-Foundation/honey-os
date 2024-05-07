use hapi::{display::DisplayServer, js_console::JsConsoleLogger, util::term::keypressed_to_string};
use std::time::Duration;

/// The greeting message of the OS
const GREETING_MESSAGE: &str = "    
 .-..-.                         .--.  .--.   Developed by \x1b[95mGetAGripGal\x1b[97m 
 : :; :                        : ,. :: .--'  ---------------------------
 :    : .--. ,-.,-. .--. .-..-.: :: :`. `.   Welcome to \x1b[93mHoneyOS!\x1b[97m            
 : :: :' .; :: ,. :' '_.': :; :: :; : _`, :  ---------------------------
 :_;:_;`.__.':_;:_;`.__.'`._. ;`.__.'`.__.'  \x1b[95mPID:\x1b[97m #pid_log#                              
                          .-. :              \x1b[95mOnline:\x1b[97m #online_log#                              
                          `._.'              \x1b[95mUser Agent:\x1b[97m #user_agent_log#                              

";

/// The color test of the display server
const COLOR_TEST: &str = "                                             \x1b[30m▓\x1b[90m█\x1b[31m▓\x1b[91m█\x1b[32m▓\x1b[92m█\x1b[33m▓\x1b[93m█\x1b[34m▓\x1b[94m█\x1b[35m▓\x1b[95m█\x1b[36m▓\x1b[96m█\x1b[37m▓\x1b[97m█";

#[hapi::main]
async fn main() -> anyhow::Result<()> {
    JsConsoleLogger::init();

    let greeting = format_greeting();

    let mut display = DisplayServer::register();
    DisplayServer::claim(&display)?;

    let mut keyspressed = Vec::new();

    unsafe {
        let num = hapi::mem::alloc::<u32>();
        *num = 10;
        log::info!("ptr: {} value: {}", num as u32, *num);
    }

    display.set_text(format!(
        "{}\n{}\n{}",
        greeting,
        COLOR_TEST,
        keypressed_to_string(&keyspressed)
    ))?;

    loop {
        if let Some(key) = display.key_buffer() {
            keyspressed.push(key);

            display.set_text(format!(
                "{}\n{}\n{}",
                greeting,
                COLOR_TEST,
                keypressed_to_string(&keyspressed)
            ))?;
        }
        std::thread::sleep(Duration::from_secs_f32(1.0 / 60.0));
    }
}

/// Format the greeting message
fn format_greeting() -> String {
    let temp = GREETING_MESSAGE.to_string();
    let temp = temp.replace("#online_log#", &hapi::browser::is_online().to_string());
    let temp = temp.replace("#pid_log#", hapi::process::pid().unwrap());
    let temp = temp.replace("#user_agent_log#", hapi::browser::user_agent().unwrap());
    temp
}
