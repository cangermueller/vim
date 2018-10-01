" ==============================================================================
" YouCompleteMe
" ==============================================================================
map <LocalLeader>jj :YcmCompleter GoToDefinition <CR>
map <LocalLeader>jJ :YcmCompleter GoToDefinition <CR> :-tabnew<CR><C-O><C-O>:tabnext<CR>
map <LocalLeader>ji :YcmCompleter GoToDeclaration <CR>
map <LocalLeader>jk :YcmCompleter GetType <CR>
map <LocalLeader>jf :YcmCompleter FixIt <CR>

map <LocalLeader>ej :call pymode#motion#move('\v^}', '')<cr>zt
map <LocalLeader>ek :call pymode#motion#move('\v^\w', 'b')<cr>zt
map <LocalLeader>jf gg /FLAG<cr>zt:nohls<cr>
map <LocalLeader>ji gg /import<cr>zt:nohls<cr>
