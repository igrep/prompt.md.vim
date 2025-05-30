# prompt.md.vim

Commands and functions to help you compose and submit long prompts as a markdown file (`*.prompt.md` file) to a CLI/TUI based coding agent. Currently, it supports only Claude Code so far.

## Provided Functions

- `prompt_md#send_at_this_path()`:
    - Put `@<the current file path (buffer name)>` at the last `*.prompt.md` file.
- `prompt_md#send_at_this_path_with_hash_line_and_switch_to_prompt()`:
    - Put `@<the current file path (buffer name)>#<the current line number>` at the last `*.prompt.md` file.
- `prompt_md#send_last_word()`:
    - Put `<the last word under the cursor>` at the last `*.prompt.md` file.
- `prompt_md#send_selection()`:
    - Put the selected lines (if no lines are selected, the entire buffer) at the last `*.prompt.md` file and switch to it.

### `*_and_open_prompt()` Variants

- `prompt_md#send_at_this_path_and_open_prompt()`:
    - Put `@<the current file path (buffer name)>#<the current line number>` at the last `*.prompt.md` file, then switch to the `*.prompt.md` file.
- `prompt_md#send_at_this_path_with_hash_line_and_open_prompt()`:
    - Put `@<the current file path (buffer name)>#<the current line number>` at the last `*.prompt.md` file, then switch to the `*.prompt.md` file.
- `prompt_md#send_last_word_and_open_prompt()`:
    - Put `<the last word under the cursor>` at the last `*.prompt.md` file, then switch to the `*.prompt.md` file.
- `prompt_md#send_selection_and_open_prompt()`:
    - Put the selected lines (if no lines are selected, the entire buffer) at the last `*.prompt.md` file, then switch to the `*.prompt.md` file.

## Options

- `g:prompt_md_path`:
    - The path where the `*.prompt.md` files are stored. Default is `.prompts` (relative from the current directory).

<!-- MEMO

```
" TODO: implement function! SendAtThisPathToSwitchToPrompt()
function! AtLastWindowPath() abort
  wincmd p
  let result = "a@" . expand('%') . " "
  wincmd p
  return result
endfunction

function! AtLastWindowPathHashLine() abort
  wincmd p
  let result = "a@" . expand('%') . '#' . line('.') . " "
  wincmd p
  return result
endfunction

function! LastWindowWord() abort
  wincmd p
  let result = "a " . expand('<cword>') . " "
  wincmd p
  return result
endfunction

let g:prompt_md_path = ".prompts"
function! CreatePromptFileForThisBranch() abort
  let fileName = system('git rev-parse --abbrev-ref HEAD') . '.prompt.md'
  call mkdir(g:prompt_md_path . '/' . fnamemodify(filename, ':p:h'), 'p')
  execute 'edit ' . fileName
endfunction

function! EnterThisFileAsPrompt() abort
  let contents = join(getline(1, '$'), "\n")
  call TerminalRegistrySwitchToAi()
  call terminal_registry#send("ai", contents)
  startinsert
endfunction

augroup prompt_md
  autocmd!
  autocmd BufRead *.prompt.md abbreviate <expr> <buffer> @f AtLastWindowPath()
  autocmd BufRead *.prompt.md abbreviate <expr> <buffer> @l AtLastWindowPathHashLine()
  autocmd BufRead *.prompt.md abbreviate <expr> <buffer> @w LastWindowWord()
augroup END
```
-->
