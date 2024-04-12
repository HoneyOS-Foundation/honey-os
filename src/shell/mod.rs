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
        match key {
            '\n' => {
                // Enter key pressed
                self.history.push(self.current_command.clone());
                self.history_index = self.history.len();
                self.current_command.clear();
                self.cursor_position = 0;

                let command = self.history.last().unwrap();
                let command_parsed = ParsedCommand::parse(command);

                // Clear the screen if the command is "clear"
                self.stdout.writeln(&format!("> {}", command));

                // TODO: In the future each command will be a separate wasm module executed by the wasmer-vm.
                // For now, we will just handle the clear and echo commands

                if command_parsed.command == "help" {
                    self.stdout.writeln("Available commands:");
                    self.stdout.writeln("  clear - Clear the screen");
                    self.stdout
                        .writeln("  echo - Print the arguments to the screen");
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
            }
            '\u{0008}' => {
                // Backspace key pressed
                if self.cursor_position > 0 {
                    self.current_command.remove(self.cursor_position - 1);
                    self.cursor_position -= 1;
                }
            }
            _ => {
                // Other keys pressed
                self.current_command.insert(self.cursor_position, key);
                self.cursor_position += 1;
            }
        }
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
}
