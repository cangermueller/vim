set textwidth=80
set formatoptions-=t

" vim-ipython mappings
let g:ipy_perform_mappings=0
map  <buffer> <silent> <LocalLeader>rf :IPython<CR>
map  <buffer> <silent> <LocalLeader>aa <Plug>(IPython-RunFile)
map  <buffer> <silent> <LocalLeader>h <Plug>(IPython-OpenPyDoc)
map  <buffer> <silent> <LocalLeader>w <Plug>(IPython-RunLine)
map  <buffer> <silent> <LocalLeader>d <Plug>(IPython-RunLine)j
xmap <buffer> <silent> <LocalLeader>w <Plug>(IPython-RunLines)
imap <buffer> <silent> <LocalLeader>w <C-o><Plug>(IPython-RunLine)<CR>
