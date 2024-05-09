//! Utility methods for terminal emulation

use crate::display::KeyPress;

use super::keys::KeyCode;

/// Process a list of keypresses into a string
pub fn keypressed_to_string(keys: &[KeyPress]) -> String {
    let mut result = Vec::<char>::new();

    let mut insert_mode = false;
    let mut cursor = 0;
    let mut amount_processed = 0;
    while amount_processed < keys.len() {
        let current_key = &keys[amount_processed];
        let current_code = KeyCode::from(current_key.key);
        match current_code {
            KeyCode::Enter => {
                if cursor < result.len() {
                    if insert_mode {
                        result.insert(cursor, '\n');
                    } else {
                        result[cursor] = '\n';
                    }
                } else {
                    result.push('\n');
                }
                cursor += 1;
            }
            KeyCode::Delete if current_key.shift => {
                insert_mode = !insert_mode;
            }
            KeyCode::Backspace => {
                if current_key.ctrl {
                    if cursor > 0 {
                        cursor -= 1;
                        while result[cursor] != ' ' {
                            result.remove(cursor);
                            if cursor <= 0 {
                                break;
                            }
                            cursor -= 1;
                        }
                    }
                } else {
                    if cursor > 0 {
                        cursor -= 1;
                        result.remove(cursor);
                    }
                }
            }
            KeyCode::LeftArrow => {
                if current_key.ctrl {
                    if cursor > 0 {
                        cursor -= 1;
                        while result[cursor] != ' ' {
                            if cursor <= 0 {
                                break;
                            }
                            cursor -= 1;
                        }
                    }
                } else {
                    if cursor > 0 {
                        cursor -= 1;
                    }
                }
            }
            KeyCode::RightArrow => {
                if current_key.ctrl {
                    if cursor < result.len() {
                        cursor += 1;
                        while cursor < result.len() && result[cursor] != ' ' {
                            cursor += 1;
                        }
                    }
                } else {
                    if cursor < result.len() {
                        cursor += 1;
                    }
                }
            }
            _ => {
                if let Some(c) = current_key.to_char() {
                    if cursor < result.len() {
                        if insert_mode {
                            result.insert(cursor, c);
                        } else {
                            result[cursor] = c;
                        }
                    } else {
                        result.push(c);
                    }
                    cursor += 1;
                }
            }
        }

        amount_processed += 1;
    }

    result.insert(cursor, '|');
    String::from_iter(&result)
}
