use hapi::{display::DisplayServer, js_console::JsConsoleLogger};

#[hapi::main]
async fn main() -> anyhow::Result<()> {
    JsConsoleLogger::init();

    let mut display = DisplayServer::register();
    DisplayServer::claim(&display)?;

    display.set_text("Booting...")?;

    Ok(())
}
