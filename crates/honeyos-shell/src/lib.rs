pub mod parse;
pub mod stdout;

use std::sync::{Arc, Mutex};

use honeyos_fs::FsManager;
use stdout::StdOut;

use self::parse::ParsedCommand;

/// The interactive shell of the OS
#[derive(Clone)]
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

    // A reference to the file system manager
    fs_manager: Arc<Mutex<FsManager>>,
    // The current directory
    current_directory: String,
}

impl Shell {
    /// Create a new shell instance
    pub fn new(id: usize, fs_manager: Arc<Mutex<FsManager>>) -> Self {
        Self {
            id,
            history: Vec::new(),
            history_index: 0,
            stdout: StdOut::new(),
            cursor_position: 0,
            current_command: String::new(),
            control_pressed: false,
            fs_manager,
            current_directory: "/".to_string(),
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
        self.stdout.writeln(&format!(
            "{}> {}",
            self.current_directory(),
            self.current_command()
        ));

        // TODO: In the future each command will be a separate wasm module executed by the wasmer-vm.
        // For now, we will just handle the clear and echo commands

        if command_parsed.command == "help" {
            self.stdout
                .writeln("help clear echo reboot ls cd touch mkdir rm rmdir cp mv");
        }
        // The clear command
        else if command_parsed.command == "clear" {
            self.stdout.clear();
        }
        // The echo command
        else if command_parsed.command == "echo" {
            self.stdout.writeln(&command_parsed.args.join(" "));
        }
        // The reboot command
        else if command_parsed.command == "reboot" {
            web_sys::window().unwrap().location().reload().unwrap();
        }
        // The ls command
        else if command_parsed.command == "ls" {
            let fs_manager = self.fs_manager.lock().unwrap();
            let files = fs_manager.root().ls(&self.current_directory);
            if let Some(files) = files {
                for file in files {
                    self.stdout.writeln(&file);
                }
            }
        }
        // The cd command
        else if command_parsed.command == "cd" {
            let fs_manager = self.fs_manager.lock().unwrap();
            let new_directory = command_parsed.args.join(" ");
            let full_path = if new_directory.starts_with('/') {
                new_directory.clone()
            } else {
                if self.current_directory == "/" {
                    format!("/{}", new_directory)
                } else {
                    format!("{}/{}", self.current_directory, new_directory)
                }
            };
            if fs_manager.root().is_dir(&full_path) {
                self.current_directory = honeyos_fs::normalize_path(&full_path);
            } else if fs_manager.root().is_file(&full_path) {
                self.stdout
                    .writeln(format!("cd: {} Not a directory", full_path));
            } else {
                self.stdout
                    .writeln(format!("cd: {} No such file or directory", full_path));
            }
        }
        // The touch command
        else if command_parsed.command == "touch" {
            let fs_manager = self.fs_manager.lock().unwrap();
            let file_name = command_parsed.args.join(" ");
            let full_path = if file_name.starts_with('/') {
                file_name.clone()
            } else {
                format!("{}/{}", self.current_directory, file_name)
            };
            fs_manager.root().touch(&full_path);
        }
        // The mkdir command
        else if command_parsed.command == "mkdir" {
            let fs_manager = self.fs_manager.lock().unwrap();
            let directory_name = command_parsed.args.join(" ");
            let full_path = if directory_name.starts_with('/') {
                directory_name.clone()
            } else {
                format!("{}/{}", self.current_directory, directory_name)
            };
            fs_manager.root().mkdir(&full_path);
        }
        // The rm command
        else if command_parsed.command == "rm" {
            let fs_manager = self.fs_manager.lock().unwrap();
            let file_name = command_parsed.args.join(" ");
            let full_path = if file_name.starts_with('/') {
                file_name.clone()
            } else {
                format!("{}/{}", self.current_directory, file_name)
            };
            if !fs_manager.root().exists(&full_path) {
                self.stdout.writeln(format!(
                    "rm: cannot remove '{}': No such file or directory",
                    full_path
                ));
            } else {
                fs_manager.root().rm(&full_path);
            }
        }
        // The rmdir command
        else if command_parsed.command == "rmdir" {
            let fs_manager = self.fs_manager.lock().unwrap();
            let directory_name = command_parsed.args.join(" ");
            let full_path = if directory_name.starts_with('/') {
                directory_name.clone()
            } else {
                format!("{}/{}", self.current_directory, directory_name)
            };
            fs_manager.root().rmdir(&full_path);
        }
        // The cp command
        else if command_parsed.command == "cp" {
            let fs_manager = self.fs_manager.lock().unwrap();
            let from = command_parsed.args[0].clone();
            let to = command_parsed.args[1].clone();
            fs_manager.root().cp(&from, &to);
        }
        // The mv command
        else if command_parsed.command == "mv" {
            let fs_manager = self.fs_manager.lock().unwrap();
            let from = command_parsed.args[0].clone();
            let to = command_parsed.args[1].clone();
            fs_manager.root().mv(&from, &to);
        }
        // The write command
        else if command_parsed.command == "write" {
            let fs_manager = self.fs_manager.lock().unwrap();
            if command_parsed.args.len() > 2 {
                let file_name = command_parsed.args[0].clone();
                let content = command_parsed.args[1..].join(" ");
                log::info!("Writing to file: {}", file_name);
                let full_path = if file_name.starts_with('/') {
                    file_name.clone()
                } else {
                    format!("{}/{}", self.current_directory, file_name)
                };
                // If the file does not exist, create it
                if !fs_manager.root().exists(&full_path) {
                    log::info!("Creating file: {}", full_path);
                    fs_manager.root().touch(&full_path);
                }
                fs_manager.root().write(&full_path, content.as_bytes());
            } else {
                self.stdout.writeln("write: missing file operand");
            }
        }
        // The cat command
        else if command_parsed.command == "cat" {
            let fs_manager = self.fs_manager.lock().unwrap();
            let file_name = command_parsed.args.join(" ");
            let full_path = if file_name.starts_with('/') {
                file_name.clone()
            } else {
                format!("{}/{}", self.current_directory, file_name)
            };
            let content = fs_manager.root().read(&full_path);
            if let Some(content) = content {
                self.stdout.writeln(&*String::from_utf8_lossy(&content));
            } else {
                self.stdout
                    .writeln(format!("cat: {}: No such file or directory", full_path));
            }
        }
        // Handle an unknown command
        else if command_parsed.command != "" {
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

    /// Get the current directory
    pub fn current_directory(&self) -> &str {
        &self.current_directory
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
