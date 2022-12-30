" ==============================================================================
" YCM: YouCompleteMe setting
" ==============================================================================
let g:ycm_key_list_select_completion=['<TAB>', '<Down>']
let g:ycm_key_list_stop_completion = ['<c-y>','<CR>']
let g:ycm_auto_hover = ""
" let g:ycm_disable_signature_help = 0  " =1 means no function signature

" " Avoid incorrect replacement of nested comments by [>FOO<]
let g:NERDUsePlaceHolders=0

" Add /*argument_name=*/ before argument
map <LocalLeader>C viwo<esc>i/*=*/<esc>2hi

" Set to LSP if available
" let g:ycm_language_server =

map <LocalLeader>jj :YcmCompleter GoToDefinition <cr>zt
map <LocalLeader>ji :vsplit \| YcmCompleter GoToDefinition <cr>zt
map <LocalLeader>ju :YcmCompleter GoToDeclaration <cr>zt
map <LocalLeader>jD <Plug>(YCMHover)
map <LocalLeader>jd :YcmCompleter GetDoc <cr>
map <LocalLeader>jr :YcmCompleter GoToReferences <CR>
map <LocalLeader>jt :YcmCompleter GetType <cr>
map <LocalLeader>jf :YcmCompleter FixIt <cr>
map <LocalLeader>je :YcmShowDetailedDiagnostic<cr>
map <LocalLeader>jE :YcmDiags<cr>
