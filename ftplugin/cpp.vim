" ==============================================================================
" YouCompleteMe
" ==============================================================================
map <LocalLeader>jj :YcmCompleter GoToDefinition <cr>zt
map <LocalLeader>jJ :YcmCompleter GoToImprecise <cr>zt
map <LocalLeader>ju :YcmCompleter GoToDeclaration <cr>zt
map <LocalLeader>jk :YcmCompleter GetType <cr>
map <LocalLeader>jK :YcmCompleter GetTypeImprecise <cr>
map <LocalLeader>jf :YcmCompleter FixIt <cr>
map <LocalLeader>je :YcmDiags<cr>
map <LocalLeader>jE :YcmShowDetailedDiagnostic<cr>

" Avoid incorrect replacement of nested comments by [>FOO<]
let g:NERDUsePlaceHolders=1
