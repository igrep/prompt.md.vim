# prompt.md.vim

Commands and functions to help you compose and submit long prompts as a markdown file (`*.prompt.md` file) to a CLI/TUI based coding agent. Currently, it supports only Claude Code so far.

## Provided Functions

### Composing Prompts

- `prompt_md#send_at_this_path()`:
    - Put `@<the current file path (buffer name)>` at the last `*.prompt.md` file.
- `prompt_md#send_at_this_path_with_hash_line_and_open_to_prompt()`:
    - Put `@<the current file path (buffer name)>#<the current line number>` at the last `*.prompt.md` file.
- `prompt_md#send_last_word()`:
    - Put `<the last word under the cursor>` at the last `*.prompt.md` file.
- `prompt_md#send_selection()`:
    - Put the selected lines (if no lines are selected, the entire buffer) at the last `*.prompt.md` file and switch to it.
- `prompt_md#send(string)`:
    - Put the argument `string` at the last `*.prompt.md` file and switch to it.
- `prompt_md#open_prompt()`:
    - Open the last `*.prompt.md` file.

#### `*_and_open_prompt()` Variants

- `prompt_md#send_at_this_path_and_open_prompt()`:
    - Put `@<the current file path (buffer name)>#<the current line number>` at the last `*.prompt.md` file, then switch to the `*.prompt.md` file.
- `prompt_md#send_at_this_path_with_hash_line_and_open_prompt()`:
    - Put `@<the current file path (buffer name)>#<the current line number>` at the last `*.prompt.md` file, then switch to the `*.prompt.md` file.
- `prompt_md#send_last_word_and_open_prompt()`:
    - Put `<the last word under the cursor>` at the last `*.prompt.md` file, then switch to the `*.prompt.md` file.
- `prompt_md#send_selection_and_open_prompt()`:
    - Put the selected lines (if no lines are selected, the entire buffer) at the last `*.prompt.md` file, then switch to the `*.prompt.md` file.
- `prompt_md#send_and_open_prompt(string)`:
    - Put the argument `string` at the last `*.prompt.md` file, then switch to the `*.prompt.md` file.

### Submitting Prompts

**NOTE**: Against their names, these functions only paste the contents of the last `*.prompt.md` file to the coding agent, it does not submit it. You need to hit the `Enter` to submit it.

- `prompt_md#submit()`:
    - Send the contents of the last `*.prompt.md` file to the coding agent and switch to its buffer.
- `prompt_md#submit_selection()`:
    - Send the selected lines of the buffer to the coding agent and switch to its buffer.
    - NOTES:
        - This function is available even if the opened file is not a `*.prompt.md` file. Because its target is not the last `*.prompt.md` file.
        - If no lines are selected, it raises an error.

## Compatibility

This plugin is written in plain-old Vim script, but I tested it only on Neovim. Sorry if it does not work on Vim.
