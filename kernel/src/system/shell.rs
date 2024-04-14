use std::fmt::Write;
use std::future::IntoFuture;
use std::sync::{Arc, Mutex, Once};

use wasm_bindgen::{closure::Closure, JsCast, JsValue};
use web_sys::KeyboardEvent;

use crate::display::{Display, Displayable};
use crate::shell::Shell;

/// The unique ID of the system shell
const SYSTEM_SHELL_ID: usize = 0;

/// The main shell of the OS.
/// This shell will be used to interact with the user.
/// Other shells can be created for different purposes, but must be interacted with through other applications.
static mut SYSTEM_SHELL: Option<Arc<Mutex<Shell>>> = None;

/// The callback for the keyboard event listener
static mut KEY_CALLBACK: Option<JsValue> = None;

/// Initialize the system shell of the OS
pub struct SystemShell;

impl SystemShell {
    /// Initialize the system shell
    /// This function should be called only once
    pub fn init_once() {
        static SET_HOOK: Once = Once::new();
        SET_HOOK.call_once(|| unsafe {
            SYSTEM_SHELL = Some(Arc::new(Mutex::new(Shell::new(SYSTEM_SHELL_ID))));
            // Initialize the keyboard event listener
            let js_callback = Closure::wrap(Box::new(key_callback) as Box<dyn FnMut(_)>);
            KEY_CALLBACK = Some(js_callback.into_js_value());
            // Add the event listener
            web_sys::window()
                .unwrap()
                .add_event_listener_with_callback(
                    "keydown",
                    KEY_CALLBACK.as_ref().unwrap().unchecked_ref(),
                )
                .unwrap();

            // Display the shell on the screen
            let display = Display::get();
            let display = display.lock().unwrap();
            display.display(&SystemShell);
        });
    }

    /// Destroy the system shell
    pub fn destroy() {
        unsafe {
            // Remove the event listener
            web_sys::window()
                .unwrap()
                .remove_event_listener_with_callback(
                    "keydown",
                    KEY_CALLBACK.as_ref().unwrap().unchecked_ref(),
                )
                .unwrap();
            // Clear the system shell
            SYSTEM_SHELL = None;
            KEY_CALLBACK = None;
        }
    }

    /// Get the system shell
    pub fn get() -> Arc<Mutex<Shell>> {
        unsafe { SYSTEM_SHELL.clone().unwrap() }
    }
}

/// The key callback for the keyboard event listener
fn key_callback(event: KeyboardEvent) {
    let key = event.key();
    let control = event.ctrl_key();
    let shell = SystemShell::get();
    let mut shell = shell.lock().unwrap();
    match key.as_str() {
        "Enter" => shell.process_input(),
        "Backspace" => shell.delete_previous(control),
        "Delete" => shell.delete_next(control),
        "ArrowUp" => shell.previous_command(),
        "ArrowDown" => shell.next_command(),
        "ArrowLeft" => shell.move_cursor_left(control),
        "ArrowRight" => shell.move_cursor_right(control),
        _ => {
            if key.len() == 1 {
                shell.handle_key_press(key.chars().next().unwrap());
            }
        }
    }

    // Update the display
    let display = Display::get();
    let display = display.lock().unwrap();
    drop(shell); // Release the lock before calling display
    display.display(&SystemShell);
}

impl Displayable for SystemShell {
    fn display(&self, display: &Display) {
        display.clear();
        let shell = SystemShell::get();
        let mut shell = shell.lock().unwrap();

        let root = display.root();
        let output = shell.stdout().buffer();

        // Create the output display elements
        let window = web_sys::window().unwrap();
        let document = window.document().unwrap();
        let shell_display = document.create_element("div").unwrap();
        shell_display.set_class_name("shell");
        root.append_child(&shell_display).unwrap();

        let output = output
            .split('\n')
            .map(|line| format!("<div class='output'>{}</div>", line))
            .collect::<String>();

        // Insert a `|` at the cursor position
        let command_displayed = format!(
            "{}<span class='cursor'>|</span>{}",
            &shell.current_command()[..shell.cursor_position],
            &shell.current_command()[shell.cursor_position..]
        );
        let current_command = format!("<div>> {}</div>", command_displayed);

        shell_display.set_inner_html(&format!("{}{}", output, current_command));
        display
            .root()
            .set_scroll_top(display.root().scroll_height());
    }
}
