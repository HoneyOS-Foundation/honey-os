use std::sync::{Arc, Mutex, Once};

/// The head display instance
static mut HEAD_DISPLAY: Option<Arc<Mutex<Display>>> = None;

/// The display module
#[derive(Debug, Clone)]
pub struct Display {
    // The root element of the display
    root: web_sys::HtmlElement,
}

impl Display {
    /// Initialize the head display
    /// This function should only be called once
    pub fn init_once(root: web_sys::HtmlElement) {
        static SET_DISPLAY: Once = Once::new();
        // Safety: HEAD_DISPLAY is initialized only once and is ensured to be thread-safe by the Mutex
        SET_DISPLAY.call_once(|| unsafe {
            HEAD_DISPLAY = Some(Arc::new(Mutex::new(Display { root })));
        });
    }

    /// Get the head display
    pub fn get() -> Arc<Mutex<Display>> {
        // Safety: HEAD_DISPLAY is initialized in init_once, and is ensured to be thread-safe by the Mutex
        unsafe { HEAD_DISPLAY.clone().unwrap() }
    }

    /// Get the root element of the display
    pub fn root(&self) -> &web_sys::HtmlElement {
        &self.root
    }

    /// Clear the display
    pub fn clear(&self) {
        self.root.set_inner_html("");
    }

    /// Append an element to the display
    pub fn append(&self, element: &web_sys::Element) {
        self.root.append_child(element).unwrap();
    }

    /// Display the object on the screen
    pub fn display(&self, displayable: &dyn Displayable) {
        displayable.display(self);
    }
}

/// Allows objects to interact with the display
pub trait Displayable {
    /// Display the object on the screen
    fn display(&self, display: &Display);
}
