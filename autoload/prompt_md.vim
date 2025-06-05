let s:last_prompt_file = ''
let s:last_claude_terminal = -1

function! prompt_md#remember_last_prompt_file()
  let s:last_prompt_file = {
        \ 'path': expand('%:p'),
        \ 'pos': getcurpos(),
        \ }
endfunction

function! prompt_md#remember_last_claude_terminal()
  let s:last_claude_terminal = bufnr('%')
endfunction

" Switch to the last *.prompt.md file
function! prompt_md#open_prompt_file()
  if empty(s:last_prompt_file)
    echoerr "No *.prompt.md file remembered"
    return
  endif
  execute 'edit ' . s:last_prompt_file['path']
endfunction

function! prompt_md#send_at_this_path_and_open_prompt()
  let l:current_file = expand('%:p')
  if empty(l:current_file)
    echoerr "No file path available"
    return
  endif
  call prompt_md#send_and_open_prompt('@' . l:current_file)
endfunction

function! prompt_md#send_at_this_path()
  call prompt_md#send_at_this_path_and_open_prompt()
  e #
endfunction

function! prompt_md#send_at_this_path_with_hash_line_and_open_prompt() range
  let l:current_file = expand('%:p')
  if empty(l:current_file)
    echoerr "No file path available"
    return
  endif
  let l:start_line = line("'<") || line('.')
  let l:end_line = line("'>")
  if l:end_line == 0
    call prompt_md#send_and_open_prompt('@' . l:current_file . '#' . l:start_line)
  else
    call prompt_md#send_and_open_prompt('@' . l:current_file . '#' . l:start_line . '-' . l:end_line)
  endif
endfunction

function! prompt_md#send_at_this_path_with_hash_line() range
  call prompt_md#send_at_this_path_with_hash_line_and_open_prompt()
  e #
endfunction

function! prompt_md#send_word_and_open_prompt()
  let l:word = expand('<cword>')
  if empty(l:word)
    echoerr "No word under cursor"
    return
  endif
  call prompt_md#send_and_open_prompt(l:word)
endfunction

function! prompt_md#send_word()
  call prompt_md#send_word_and_open_prompt()
  e #
endfunction

function! prompt_md#send_selection_and_open_prompt() range
  let l:start_line = line("'<")
  let l:end_line = line("'>")

  if l:start_line == 0 || l:end_line == 0
    let l:lines = getline(1, '$')
  else
    let l:lines = getline(l:start_line, l:end_line)
  endif

  call prompt_md#send_and_open_prompt(join(l:lines, "\n"))
endfunction

function! prompt_md#send_selection() range
  call prompt_md#send_selection_and_open_prompt()
  e #
endfunction

function! prompt_md#send_and_open_prompt(string)
  if empty(s:last_prompt_file)
    echoerr "No *.prompt.md file remembered"
    return
  endif

  execute 'edit ' . s:last_prompt_file['path']
  call setpos('.', s:last_prompt_file['pos'])

  let save_z = @z
  try
    let @z = a:string
    execute 'normal! "zp'
  finally
    let @z = save_z
  endtry
endfunction

function! prompt_md#send(string)
  call prompt_md#send_and_open_prompt(a:string)
  e #
endfunction

function! prompt_md#submit()
  if empty(s:last_prompt_file)
    echoerr "No *.prompt.md file remembered"
    return
  endif

  if !filereadable(s:last_prompt_file['path'])
    echoerr "Prompt file not readable: " . s:last_prompt_file['path']
    return
  endif

  let l:content = readfile(s:last_prompt_file['path'])
  let l:text = join(l:content, "\n")

  if s:last_claude_terminal == -1 || !bufexists(s:last_claude_terminal)
    terminal claude
    let s:last_claude_terminal = bufnr('%')
  else
    execute 'buffer ' . s:last_claude_terminal
  endif

  call chansend(b:terminal_job_id, l:text)
endfunction

function! prompt_md#submit_selection() range
  let l:start_line = line("'<")
  let l:end_line = line("'>")

  if l:start_line == 0 || l:end_line == 0
    echoerr "No selection found"
    return
  endif

  let l:lines = getline(l:start_line, l:end_line)
  let l:text = join(l:lines, "\n")

  if s:last_claude_terminal == -1 || !bufexists(s:last_claude_terminal)
    terminal claude
    let s:last_claude_terminal = bufnr('%')
  else
    execute 'buffer ' . s:last_claude_terminal
  endif

  call chansend(b:terminal_job_id, l:text)
endfunction
