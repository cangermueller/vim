" ==============================================================================
" vim-lsp settings
" ==============================================================================
setlocal omnifunc=lsp#complete
setlocal signcolumn=yes

" Send async completion requests.
" WARNING: Might interfere with other completion plugins.
let g:lsp_async_completion = 1

" " Enable UI for diagnostics
" let g:lsp_signs_enabled = 1           " enable diagnostics signs in the gutter
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
" let g:lsp_semantic_delay = 500

" " Automatically show completion options
" let g:asyncomplete_auto_popup = 1

" " Timeout milliseconds to abort :LspDocumentFormatSync  (can prevent hanging).
" let g:lsp_format_sync_timeout = 1000

" au User lsp_setup call lsp#register_server({
"     \ 'name': 'CiderLSP',
"     \ 'cmd': {server_info->[
"     \   '--tooltag=vim-lsp',
"     \   '--noforward_sync_responses',
"     \ ]},
"     \ 'allowlist': [
"     \   'c', 'cpp', 'java', 'kotlin', 'proto', 'textproto', 'go', 'python'
"     \ ],
"     \})

map <LocalLeader>jj :LspDefinition<cr>zt
map <LocalLeader>jJ :LspPeekDefinition<cr>
map <LocalLeader>ju :LspDeclaration<cr>zt
map <LocalLeader>jU :LspPeekDeclaration<cr>
map <LocalLeader>ji :vsplit \| LspDefinition <cr>zt
map <LocalLeader>jr :LspReferences<cr>
map <LocalLeader>jR :LspRename<cr>
map <LocalLeader>jt :LspHover<cr>
map <LocalLeader>js :LspStatus<cr>

map <LocalLeader>jf :LspDocumentRangeFormat<cr>
map <LocalLeader>jF :LspDocumentFormat<cr>

map <LocalLeader>je :LspDocumentDiagnostics<cr>
map <LocalLeader>j] :LspNextDiagnostic<cr>
map <LocalLeader>j[ :LspPreviousDiagnostic<cr>

imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
