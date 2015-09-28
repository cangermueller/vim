set textwidth=80
set formatoptions-=t

" python-mode {
let g:pymode = 1
let g:pymode_run = 0  " use ipy run instead of pymode
let g:pymode_rope = 0 " activate rope
let g:pymode_doc = 0  " activate pydoc -> use jedi instead
let g:pymode_doc_key = 'K'
let g:pymode_indent = 1 " gq to reindent
let g:pymode_syntax = 1 " syntax highlight
let g:pymode_syntax_all = 1

" lint
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 15
let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_cwindow = 1
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pep8', 'pyflakes']
" pep8: code convention
" pep257: documentation
" pyflakes: syntax
" pylint: syntax, very verbose
let g:pymode_lint_ignore = ''
let g:pymode_lint_signs = 1
map <LocalLeader>ll :PymodeLint<CR>
map <LocalLeader>la :PymodeLintAuto<CR>
map <LocalLeader>lj :lnext <CR>
map <LocalLeader>lk :lprev <CR>
map <LocalLeader>bb oimport ipdb; ipdb.set_trace()<ESC>
map <LocalLeader>bB Oimport ipdb; ipdb.set_trace()<ESC>
map <LocalLeader>bu oimport pudb; pudb.set_trace()<ESC>
map <LocalLeader>bU Oimport pudb; pudb.set_trace()<ESC>
map <LocalLeader>bp oimport pdb; pdb.set_trace()<ESC>
map <LocalLeader>bP Oimport pdb; pdb.set_trace()<ESC>

" Sphinx
map <LocalLeader>Sx :s/^\(.\)/>>> \1/<CR>  " Sphinx doctest
map <LocalLeader>Sz :s/^>>> //<CR>
vmap <LocalLeader>Sx :s/^\(.\)/>>> \1/<CR>
vmap <LocalLeader>Sz :s/^>>> //<CR>

let g:pymode_breakpoint = 0
let g:pymode_breakpoint_key = 'b'

let g:pymode_folding = 0
let g:pymode_options = 0

" jump back from doc window
map <buffer> <silent> <LocalLeader>K K <c-w>p
" }

" jedi-vim {
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0 " can be slow
let g:jedi#auto_close_doc = 0
map <LocalLeader>D :call jedi#goto_definitions() <CR>
" }

" vim-ipython {
let g:ipy_perform_mappings=0 " Disable default key bindings
map  <buffer> <silent> <LocalLeader>rf :IPython<CR>
map  <buffer> <silent> <LocalLeader>aa <Plug>(IPython-RunFile)
map  <buffer> <silent> <LocalLeader>rh <Plug>(IPython-OpenPyDoc)
map  <buffer> <silent> <LocalLeader>w <Plug>(IPython-RunLine)
imap  <buffer> <silent> <LocalLeader>w <C-o><Plug>(IPython-RunLine)
xmap <buffer> <silent> <LocalLeader>w <Plug>(IPython-RunLines)
"map  <buffer> <silent> <LocalLeader>d <Plug>(IPython-RunLine)j
map  <buffer> <silent> <LocalLeader>q <Plug>(IPython-RunLine)j
imap <buffer> <silent> <LocalLeader>q <C-o><Plug>(IPython-RunLine)<CR>
" }
