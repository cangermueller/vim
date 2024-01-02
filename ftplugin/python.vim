set textwidth=80
set formatoptions-=t
set complete+=t

if executable("ipdb3")
  map <LocalLeader>bb oimport ipdb; ipdb.set_trace()<ESC>:w<CR>
  map <LocalLeader>bB Oimport ipdb; ipdb.set_trace()<ESC>:w<CR>
else
  map <LocalLeader>bb oimport pdb; pdb.set_trace()<ESC>:w<CR>
  map <LocalLeader>bB Oimport pdb; pdb.set_trace()<ESC>:w<CR>
endif

map <LocalLeader>BB oimport pdb; pdb.set_trace()<ESC>:w<CR>
map <LocalLeader>Bb Oimport pdb; pdb.set_trace()<ESC>:w<CR>
map <LocalLeader>bi oimport ipdb; ipdb.set_trace()<ESC>:w<CR>
map <LocalLeader>bI Oimport ipdb; ipdb.set_trace()<ESC>:w<CR>

if filereadable($HOME . '/.vim/ftplugin/python_local.vim')
  source ~/.vim/ftplugin/python_local.vim
endif
