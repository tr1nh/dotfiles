source ~/.vimrc

" Shortcuts for prettier & linter
nnoremap <Leader>pp :CocCommand prettier.formatFile<CR>
nnoremap <Leader>pd :DartFmt<CR>

" Shortcuts for code action in coc.nvim
nmap <silent><leader>a <Plug>(coc-codeaction)
vmap <silent><leader>a <Plug>(coc-codeaction-selected)

" Shortcuts for code action in coc.nvim
nmap <silent><leader>d <Plug>(coc-definition)
nmap <silent><leader>D <Plug>(coc-implementation)
nmap <silent><leader>r <Plug>(coc-references)

" Shortcuts for Copilot Chat
nnoremap <Leader>C :CopilotChatToggle<CR>

" Copilot Chat config
lua << EOF
require("CopilotChat").setup {
  -- See Configuration section for options
}
EOF