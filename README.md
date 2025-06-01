# prompt.md.vim

Commands and functions to help you compose and submit long prompts as a markdown file (`*.prompt.md` file) to a CLI/TUI based coding agent. Currently, it supports only Claude Code so far.

## Provided Functions

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

### `*_and_open_prompt()` Variants

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
