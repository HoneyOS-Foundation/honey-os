use hapi::display::DisplayServer;

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

#[hapi::main]
fn main() -> anyhow::Result<()> {
    let mut display = DisplayServer::register();
    DisplayServer::claim(&display)?;

    display.set_text(GREETING_MESSAGE)?;
    Ok(())
}
