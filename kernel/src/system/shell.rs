use std::sync::{Arc, Mutex, Once};

use wasm_bindgen::{closure::Closure, JsCast, JsValue};
use web_sys::KeyboardEvent;

use crate::display::{Displayable, HeadDisplay};
use crate::system::fs::fs_manager;
use honeyos_shell::Shell;

/// The unique ID of the system shell
const SYSTEM_SHELL_ID: usize = 0;

/// The main shell of the OS.
/// This shell will be used to interact with the user.
/// Other shells can be created for different purposes, but must be interacted with through other applications.
static mut SYSTEM_SHELL: Option<Arc<Mutex<Shell>>> = None;

/// The callback for the keyboard event listener
static mut KEY_CALLBACK: Option<JsValue> = None;

/// The ondrop callback for the file drop event listener
// static mut DROP_CALLBACK: Option<JsValue> = None;

/// The callback for when the input is changed
static mut INPUT_CHANGE_CALLBACK: Option<JsValue> = None;

/// Initialize the system shell of the OS
pub struct SystemShell;

impl SystemShell {
    /// Initialize the system shell
    /// This function should be called only once
    pub fn init_once() {
        static SET_HOOK: Once = Once::new();
        SET_HOOK.call_once(|| unsafe {
            SYSTEM_SHELL = Some(Arc::new(Mutex::new(Shell::new(
                SYSTEM_SHELL_ID,
                fs_manager(),
            ))));

            // Set up the event listeners
            let window = web_sys::window().unwrap();
            let document = window.document().unwrap();
            let input_change_callback =
                Closure::wrap(Box::new(input_change_callback) as Box<dyn FnMut(_)>);
            let input_change_callback = input_change_callback.into_js_value();
            INPUT_CHANGE_CALLBACK = Some(input_change_callback);

            // Set up the keyboard event listener
            let key_callback = Closure::wrap(Box::new(key_callback) as Box<dyn FnMut(_)>);
            let key_callback = key_callback.into_js_value();
            document
                .add_event_listener_with_callback("keydown", key_callback.as_ref().unchecked_ref())
                .unwrap();
            KEY_CALLBACK = Some(key_callback);

            // Display the shell on the screen
            let display = HeadDisplay::get();
            let display = display.lock().unwrap();
            display.display(&SystemShell);
        });
    }

    /// Destroy the system shell
    pub fn destroy() {
        unsafe {
            // Remove the event listeners
            let window = web_sys::window().unwrap();
            let document = window.document().unwrap();
            document
                .remove_event_listener_with_callback(
                    "keydown",
                    KEY_CALLBACK.as_ref().unwrap().unchecked_ref(),
                )
                .unwrap();

            // Clear the system shell
            SYSTEM_SHELL = None;
            KEY_CALLBACK = None;
            INPUT_CHANGE_CALLBACK = None;
        }
    }

    /// Get the system shell
    pub fn get() -> Arc<Mutex<Shell>> {
        unsafe { SYSTEM_SHELL.clone().unwrap() }
    }
}

/// Update the display of the system shell
pub fn update_system_shell() {
    let display = HeadDisplay::get();
    let display = display.lock().unwrap();
    display.display(&SystemShell);
}

/// The key callback for the keyboard event listener
fn key_callback(event: KeyboardEvent) {
    let key = event.key();
    let _control = event.ctrl_key();
    let shell = SystemShell::get();
    let mut shell = shell.lock().unwrap();
    match key.as_str() {
        "Enter" => {
            shell.process_input();
            drop(shell);
            update_system_shell();
        }
        "ArrowUp" => {
            shell.previous_command();
            drop(shell);
            update_system_shell();
        }
        "ArrowDown" => {
            shell.next_command();
            drop(shell);
            update_system_shell();
        }

        _ => {}
    }
}

/// The input change callback for the input event listener
fn input_change_callback(event: KeyboardEvent) {
    let value = event
        .target()
        .unwrap()
        .dyn_into::<web_sys::HtmlInputElement>()
        .unwrap()
        .value();
    let shell = SystemShell::get();
    let mut shell = shell.lock().unwrap();
    shell.current_command = value;
}

impl Displayable for SystemShell {
    fn display(&self, display: &HeadDisplay) {
        display.clear();
        let shell = SystemShell::get();
        let shell = shell.lock().unwrap();

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

        // Create the input display elements
        let input_display = document.create_element("div").unwrap();
        let input_element = document.create_element("input").unwrap();
        input_element.set_class_name("command-input");
        let input_element = input_element
            .dyn_into::<web_sys::HtmlInputElement>()
            .unwrap();
        input_element.set_attribute("type", "text").unwrap();
        input_element
            .set_attribute("value", &shell.current_command())
            .unwrap();
        // Set the cursor position
        input_element
            .set_selection_range(shell.cursor_position as u32, shell.cursor_position as u32)
            .unwrap();

        // Set the callback for the input element
        unsafe {
            input_element
                .add_event_listener_with_callback(
                    "input",
                    INPUT_CHANGE_CALLBACK.as_ref().unwrap().unchecked_ref(),
                )
                .unwrap();
        }

        // Add the input element to the display
        input_display.set_class_name("input-display");
        input_display.set_inner_html(&format!(
            "<div class='fs-display'>{}> </div> ",
            shell.current_directory()
        ));
        let input_element = input_display.append_child(&input_element).unwrap();

        shell_display.set_inner_html(&format!("{}", output));
        shell_display.append_child(&input_display).unwrap();

        let input_element = input_element
            .dyn_into::<web_sys::HtmlInputElement>()
            .unwrap();
        input_element.focus().unwrap();

        display
            .root()
            .set_scroll_top(display.root().scroll_height());
    }
}
