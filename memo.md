# TODO: Append this to the README.md later.

## Options

- `g:prompt_md_path`:
    - The path where the `*.prompt.md` files are stored. Default is `.prompts` (relative from the current directory).

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

## Key Bindings

*This plugin provides no key bindings by default. Assign as you like!*

But here's my example (with a bonus feature to create a new `*.prompt.md` file for the current git branch):

```vim
" TODO
```
