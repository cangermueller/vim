" ==============================================================================
" YouCompleteMe
" ==============================================================================
map <LocalLeader>jj :YcmCompleter GoToDefinition <cr>zt
map <LocalLeader>jJ :YcmCompleter GoToDefinition <cr> :-tabnew<cr><C-O><C-O>:tabnext<cr>
map <LocalLeader>jd :YcmCompleter GoToDeclaration <cr>zt
map <LocalLeader>jk :YcmCompleter GetType <cr>
map <LocalLeader>jf :YcmCompleter FixIt <cr>

map <LocalLeader>ej :call pymode#motion#move('\v^}', '')<cr>zt
map <LocalLeader>ek :call pymode#motion#move('\v^\w', 'b')<cr>zt
map <LocalLeader>jf gg /FLAG<cr>zt:nohls<cr>
map <LocalLeader>ji gg /import<cr>zt:nohls<cr>
