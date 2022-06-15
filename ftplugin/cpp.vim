" ==============================================================================
" YouCompleteMe
" ==============================================================================
map <LocalLeader>jj :YcmCompleter GoToDefinition <cr>zt
map <LocalLeader>jJ :YcmCompleter GoToImprecise <cr>zt
map <LocalLeader>ju :YcmCompleter GoToDeclaration <cr>zt
map <LocalLeader>jd :YcmCompleter GetDoc <cr>
map <LocalLeader>jr :YcmCompleter GoToReferences <CR>
map <LocalLeader>jt :YcmCompleter GetType <cr>
map <LocalLeader>jT :YcmCompleter GetTypeImprecise <cr>
map <LocalLeader>jf :YcmCompleter FixIt <cr>
map <LocalLeader>je :YcmDiags<cr>
map <LocalLeader>jE :YcmShowDetailedDiagnostic<cr>

" Avoid incorrect replacement of nested comments by [>FOO<]
let g:NERDUsePlaceHolders=0

" Add /*argument_name=*/ before argument
map <LocalLeader>C viwo<esc>i/*=*/<esc>2hi
