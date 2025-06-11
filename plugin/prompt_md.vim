if exists('g:loaded_prompt_md')
  finish
endif
let g:loaded_prompt_md = 1

autocmd BufReadPost,BufNewFile *.prompt.md call prompt_md#remember_last_prompt_file()
autocmd WinLeave *.prompt.md call prompt_md#remember_last_prompt_file()
autocmd TermOpen term://*claude* call prompt_md#remember_last_claude_terminal()

command! PromptMdSendAtThisPath call prompt_md#send_at_this_path()
command! -range PromptMdSendAtThisPathWithHashLine call prompt_md#send_at_this_path_with_hash_line()
command! PromptMdSendWord call prompt_md#send_word()
command! -range=% PromptMdSendSelection call prompt_md#send_selection()
command! -nargs=1 PromptMdSend call prompt_md#send(<q-args>)

command! PromptMdSendAtThisPathAndOpenPrompt call prompt_md#send_at_this_path_and_open_prompt()
command! -range PromptMdSendAtThisPathWithHashLineAndOpenPrompt call prompt_md#send_at_this_path_with_hash_line_and_open_prompt()
command! PromptMdSendWordAndOpenPrompt call prompt_md#send_word_and_open_prompt()
command! -range=% PromptMdSendSelectionAndOpenPrompt call prompt_md#send_selection_and_open_prompt()
command! -nargs=1 PromptMdSendAndOpenPrompt call prompt_md#send_and_open_prompt(<q-args>)

command! PromptMdOpenPromptFile call prompt_md#open_prompt_file()

command! PromptMdSubmit call prompt_md#submit()
command! -range=% PromptMdSubmitSelection call prompt_md#submit_selection()
