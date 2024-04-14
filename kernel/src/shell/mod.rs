pub mod parse;

use self::parse::ParsedCommand;
use crate::stdout::StdOut;

/// The interactive shell of the OS
#[derive(Default, Debug, Clone)]
pub struct Shell {
    // The unique ID of the shell
    id: usize,
    // The history of commands entered by the user
    history: Vec<String>,
    // The index of the current command in the history
    history_index: usize,
    // The standard output of the shell
    stdout: StdOut,

    // The cursor position in the current command
    pub cursor_position: usize,
    // The current command being entered
    pub current_command: String,

    // Whether control is pressed
    pub control_pressed: bool,
}

impl Shell {
    /// Create a new shell instance
    pub fn new(id: usize) -> Self {
        Self {
            id,
            ..Default::default()
        }
    }

    /// Get the unique ID of the shell
    pub fn id(&self) -> usize {
        self.id
    }

    /// Handle a key press event
    pub fn handle_key_press(&mut self, key: char) {
        // Other keys pressed
        self.current_command.insert(self.cursor_position, key);
        self.cursor_position += 1;
    }

    /// Process a command
    pub fn process_input(&mut self) {
        if self.current_command.is_empty() {
            self.stdout.writeln("> ");
            return;
        }
        self.history.push(self.current_command.clone());
        self.history_index = self.history.len();
        self.cursor_position = 0;

        let command_parsed = ParsedCommand::parse(self.current_command());
        self.stdout
            .writeln(&format!("> {}", self.current_command()));

        // TODO: In the future each command will be a separate wasm module executed by the wasmer-vm.
        // For now, we will just handle the clear and echo commands

        if command_parsed.command == "help" {
            self.stdout.writeln("clear echo");
        }
        // The clear command
        else if command_parsed.command == "clear" {
            self.stdout.clear();
        }
        // The echo command
        else if command_parsed.command == "echo" {
            self.stdout.writeln(&command_parsed.args.join(" "));
        } else if command_parsed.command != "" {
            self.stdout.writeln(format!(
                "behash: `{}` command not found",
                command_parsed.command
            ));
        }

        // Clear the current command
        self.current_command.clear();
    }

    /// Get the current command being entered
    pub fn current_command(&self) -> &str {
        &self.current_command
    }

    /// Get the command history
    pub fn history(&self) -> &[String] {
        &self.history
    }

    /// Get the standard output of the shell
    pub fn stdout(&self) -> &StdOut {
        &self.stdout
    }

    /// Get the output mutibly
    pub fn stdout_mut(&mut self) -> &mut StdOut {
        &mut self.stdout
    }

    /// Move to the previous command in the history
    pub fn previous_command(&mut self) {
        if self.history.len() == 0 {
            return;
        }

        if self.history_index > 0 {
            self.history_index -= 1;
            if self.history_index > self.history.len() {
                self.history_index = self.history.len() - 1;
            }
            self.current_command = self.history[self.history_index].clone();
        }
    }

    /// Move to the next command in the history
    pub fn next_command(&mut self) {
        if self.history.len() == 0 {
            return;
        }

        if self.history_index < self.history.len() - 1 {
            self.history_index += 1;
            self.current_command = self.history[self.history_index].clone();
        }
    }

    /// Move the cursor to the left
    /// If control is pressed, move the cursor to the previous word
    pub fn move_cursor_left(&mut self, ctrl_key: bool) {
        if ctrl_key {
            // Move the cursor to the previous word
            let mut cursor = self.cursor_position;
            while cursor > 0
                && !self
                    .current_command
                    .chars()
                    .nth(cursor - 1)
                    .unwrap()
                    .is_whitespace()
            {
                cursor -= 1;
            }
            // Skip the whitespaces
            while cursor > 0
                && self
                    .current_command
                    .chars()
                    .nth(cursor - 1)
                    .unwrap()
                    .is_whitespace()
            {
                cursor -= 1;
            }
            self.cursor_position = cursor;
        } else if self.cursor_position > 0 {
            self.cursor_position -= 1;
        }
    }

    /// Move the cursor to the right
    /// If control is pressed, move the cursor to the next word
    pub fn move_cursor_right(&mut self, ctrl_key: bool) {
        if ctrl_key {
            // Move the cursor to the next word
            let mut cursor = self.cursor_position;
            while cursor < self.current_command.len()
                && !self
                    .current_command
                    .chars()
                    .nth(cursor)
                    .unwrap()
                    .is_whitespace()
            {
                cursor += 1;
            }
            // Skip the whitespaces
            while cursor < self.current_command.len()
                && self
                    .current_command
                    .chars()
                    .nth(cursor)
                    .unwrap()
                    .is_whitespace()
            {
                cursor += 1;
            }
            self.cursor_position = cursor;
        } else if self.cursor_position < self.current_command.len() {
            self.cursor_position += 1;
        }
    }

    /// Delete the previous character
    /// If control is pressed, delete the previous word
    pub fn delete_previous(&mut self, ctrl_key: bool) {
        if ctrl_key {
            // Delete the previous word
            let previous_cursor = self.cursor_position;
            let mut cursor = self.cursor_position;
            while cursor > 0
                && !self
                    .current_command
                    .chars()
                    .nth(cursor - 1)
                    .unwrap()
                    .is_whitespace()
            {
                cursor -= 1;
            }
            // Skip the whitespaces
            while cursor > 0
                && self
                    .current_command
                    .chars()
                    .nth(cursor - 1)
                    .unwrap()
                    .is_whitespace()
            {
                cursor -= 1;
            }
            self.current_command.drain(cursor..previous_cursor);
            self.cursor_position = cursor;
        } else if self.cursor_position > 0 {
            self.current_command.remove(self.cursor_position - 1);
            self.cursor_position -= 1;
        }
    }

    /// Delete the next character
    /// If control is pressed, delete the next word
    pub fn delete_next(&mut self, ctrl_key: bool) {
        if ctrl_key {
            // Delete the next word
            let next_cursor = self.cursor_position;
            let mut cursor = self.cursor_position;
            while cursor < self.current_command.len()
                && !self
                    .current_command
                    .chars()
                    .nth(cursor)
                    .unwrap()
                    .is_whitespace()
            {
                cursor += 1;
            }
            // Skip the whitespaces
            while cursor < self.current_command.len()
                && self
                    .current_command
                    .chars()
                    .nth(cursor)
                    .unwrap()
                    .is_whitespace()
            {
                cursor += 1;
            }
            self.current_command.drain(self.cursor_position..cursor);
        } else if self.cursor_position < self.current_command.len() {
            self.current_command.remove(self.cursor_position);
        }
    }

    /// Paste text at the cursor position
    pub fn paste(&mut self, text: &str) {
        for c in text.chars() {
            self.current_command.insert(self.cursor_position, c);
        }
    }
}
