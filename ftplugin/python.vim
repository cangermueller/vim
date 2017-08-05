set textwidth=80
set formatoptions-=t
set complete+=t
set tabstop=2
set shiftwidth=2


" ==============================================================================
" python-mode
" ==============================================================================
let g:pymode = 1
let g:pymode_run = 0  " use ipy run instead of pymode
let g:pymode_rope = 0 " activate rope
let g:pymode_doc = 0  " activate pydoc -> use jedi instead
let g:pymode_doc_key = 'K'
let g:pymode_indent = 1 " gq to reindent
let g:pymode_syntax = 1 " syntax highlight
let g:pymode_syntax_all = 1
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_key = 'b'
let g:pymode_folding = 0
let g:pymode_options = 0

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
let g:pymode_lint_ignore = 'E402' " module level import not at top
let g:pymode_lint_signs = 1
let g:pymode_lint_sort = ['E', 'C', 'I']


" ==============================================================================
" Key binding
" ==============================================================================
map <LocalLeader>lL :wincmd o<CR>:PymodeLint<CR>
map <LocalLeader>ll :wincmd o<CR>:PymodeLint<CR><C-W>j<CR>
map <LocalLeader>la :PymodeLintAuto<CR>
if executable("ipdb")
  map <LocalLeader>bb oimport ipdb; ipdb.set_trace()<ESC>
  map <LocalLeader>bB Oimport ipdb; ipdb.set_trace()<ESC>
else
  map <LocalLeader>bb oimport pdb; pdb.set_trace()<ESC>
  map <LocalLeader>bB Oimport pdb; pdb.set_trace()<ESC>
endif
map <LocalLeader>bu oimport pudb; pudb.set_trace()<ESC>
map <LocalLeader>bU Oimport pudb; pudb.set_trace()<ESC>
map <LocalLeader>bp oimport pdb; pdb.set_trace()<ESC>
map <LocalLeader>bP Oimport pdb; pdb.set_trace()<ESC>
map <LocalLeader>bd :g/set_trace()/d <CR>
map <buffer> <silent> <LocalLeader>K K <c-w>p
map <LocalLeader>D o# TODO:
imap <LocalLeader>D # TODO:
map ff /for.*:$<CR>


" ==============================================================================
" Sphinx
" ==============================================================================
map <LocalLeader>Sx :s/^\(.\)/>>> \1/<CR>  " Sphinx doctest
map <LocalLeader>Sz :s/^>>> //<CR>
vmap <LocalLeader>Sx :s/^\(.\)/>>> \1/<CR>
vmap <LocalLeader>Sz :s/^>>> //<CR>


" ==============================================================================
" jedi
" ==============================================================================
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
set noshowmode "needed for call_signatures=2
let g:jedi#show_call_signatures = 2
let g:jedi#show_call_signatures_delay = 1
let g:jedi#auto_close_doc = 1
map <LocalLeader>jj :call jedi#goto() <CR>
map <LocalLeader>jJ :call jedi#goto() <CR> :-tabnew<CR><C-O><C-O>:tabnext<CR>
map <LocalLeader>jk :call jedi#show_documentation() <CR>:wincmd k<CR>
imap <LocalLeader>jk <ESC>:call jedi#show_documentation() <CR>:wincmd k<CR>a
map <LocalLeader>js :call jedi#show_call_signatures() <CR>
imap <LocalLeader>js <ESC>:call jedi#show_call_signatures() <CR>a


" ==============================================================================
" YouCompleteMe
" ==============================================================================
" if exists("g:ycm_add_preview_to_completeopt")
"   map <LocalLeader>jj :YcmCompleter GoTo <CR>
"   map <LocalLeader>jJ :YcmCompleter GoTo <CR> :-tabnew<CR><C-O><C-O>:tabnext<CR>
"   map <LocalLeader>jk :YcmCompleter GetDoc <CR>
"   map <LocalLeader>jr :YcmCompleter GoToReferences <CR>
" endif


" ==============================================================================
" vim-ipython
" ==============================================================================
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


" ==============================================================================
" Supertab
" ==============================================================================
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" let g:ycm_filetype_blacklist = {
        " \ 'tagbar' : 1,
        " \ 'qf' : 1,
        " \ 'notes' : 1,
        " \ 'markdown' : 1,
        " \ 'unite' : 1,
        " \ 'text' : 1,
        " \ 'vimwiki' : 1,
        " \ 'pandoc' : 1,
        " \ 'infolog' : 1,
        " \ 'mail' : 1,
        " \ 'python' : 1,
        " \}
        "


" ==============================================================================
" Motions / Navigation
" ==============================================================================
map <LocalLeader>eJ :call pymode#motion#move('\v^(class\|def)\s', '')<cr>
map <LocalLeader>eK :call pymode#motion#move('\v^(class\|def)\s', 'b')<cr>
map <LocalLeader>ej :call pymode#motion#move('^\s*def\s', '')<cr>
map <LocalLeader>ek :call pymode#motion#move('^\s*def\s', 'b')<cr>
map <LocalLeader>ja gg /ArgumentParser<cr>zt:nohls<cr>
map <LocalLeader>jm gg /def main<cr>zt:nohls<cr>
map <LocalLeader>ji G ?^import<cr>]]3kz.:nohls<cr>
map <LocalLeader>jI [[3kz.
