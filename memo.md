# TODO: Append this to the README.md later.

```
let g:prompt_md_path = ".prompts"
function! CreatePromptFileForThisBranch() abort
  let fileName = system('git rev-parse --abbrev-ref HEAD') . '.prompt.md'
  call mkdir(g:prompt_md_path . '/' . fnamemodify(filename, ':p:h'), 'p')
  execute 'edit ' . fileName
endfunction
```

## Key Bindings

*This plugin provides no key bindings by default. Assign as you like!*

But here's my example (with a bonus feature to create a new `*.prompt.md` file for the current git branch):

```vim
" TODO
```
