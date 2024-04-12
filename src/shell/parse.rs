/// A parsed command
#[derive(Debug)]
pub struct ParsedCommand {
    pub command: String,
    pub args: Vec<String>,
}

impl ParsedCommand {
    /// Parse a command from a string
    pub fn parse(command: &str) -> Self {
        let mut parts = command.split_whitespace();
        let command = parts.next().unwrap_or_default().to_string();

        // Parse the arguments
        // Arguments are separated by spaces, but can be enclosed in quotes
        let mut args = vec![];
        let mut current_arg = String::new();
        let mut in_quotes = false;
        for part in parts {
            if part.starts_with('"') {
                in_quotes = true;
                current_arg = part.trim_start_matches('"').to_string();
            } else if part.ends_with('"') {
                in_quotes = false;
                current_arg.push(' ');
                current_arg.push_str(part.trim_end_matches('"'));
                args.push(current_arg.clone());
                current_arg.clear();
            } else if in_quotes {
                current_arg.push(' ');
                current_arg.push_str(part);
            } else {
                args.push(part.to_string());
            }
        }
        if !current_arg.is_empty() {
            args.push(current_arg);
        }

        Self { command, args }
    }
}
