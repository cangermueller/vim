set textwidth=80
set formatoptions-=t
set complete+=t


" ==============================================================================
" python-mode
" ==============================================================================
let g:pymode = 1
let g:pymode_run = 0  " use ipy run instead of pymode
let g:pymode_rope = 0 " activate rope
let g:pymode_doc = 0  " activate pydoc -> use jedi instead
let g:pymode_doc_key = 'M'
let g:pymode_indent = 1 " gq to reindent
let g:pymode_syntax = 1 " syntax highlight
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
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
let g:pymode_lint_signs = 1
let g:pymode_lint_sort = ['E', 'C', 'I']
let g:pymode_python = 'python3'
" let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257', 'pyflakes']
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_options_max_line_length = 80
let g:pymode_lint_options_pep8 = {
  \ 'max_line_length': g:pymode_options_max_line_length}
let g:pymode_options_colorcolumn = 1
" pep8: code convention
" pep257: documentation
" pyflakes: syntax
" pylint: syntax, very verbose
" let g:pymode_lint_ignore = ['E402'] " module level import not at top
" C901: function is too complex (21)
" E111: indentation not multiple of four
" E114: indentation not multiple of four
" E125: continuation line with same indent as next logical line
" E129: visually indented line with same indent as next logical line
" E231: missing whitespace after ','
" E402: module level import not at top of file
" E501: line too long (83 > 79 characters) [pep8]
let g:pymode_lint_ignore = [
      \'E402',
      \'E124',
      \'E125',
      \'E129',
      \'C901']



" ==============================================================================
" Key binding
" ==============================================================================
map <LocalLeader>ll :lclose<CR>:PymodeLint<CR>
map <LocalLeader>lf :lclose<CR>:PymodeLint<CR>:lfirst<CR>
map <LocalLeader>le :lclose<CR>
map <LocalLeader>la :PymodeLintAuto<CR>
map <LocalLeader>sf F'if<esc>2f'
" Make functions private / public
map <LocalLeader>sp bi_<esc>w
map <LocalLeader>sP bxw


" ==============================================================================
" PDB
" ==============================================================================
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

map <LocalLeader>bd :g/db\.set_trace()/d<CR>:w<CR>
map <LocalLeader>bf /db\.set_trace<CR>zz:set nohls<CR>
map <buffer> <silent> <LocalLeader>K K <c-w>p
map ff /for.*:$<CR>


" ==============================================================================
"  Jedi
" ==============================================================================
" let g:jedi#popup_on_dot = 0
" let g:jedi#use_tabs_not_buffers = 0
" set noshowmode "needed for call_signatures=2
" call_signature: 1=above, 2=bottom
" let g:jedi#show_call_signatures = 0
" let g:jedi#show_call_signatures_delay = 1
" let g:jedi#auto_close_doc = 1

" map <LocalLeader>js :call jedi#show_call_signatures() <CR>
" imap <LocalLeader>js <ESC>:call jedi#show_call_signatures() <CR>a
" map <LocalLeader>jj :call jedi#goto() <CR>zt
" map <LocalLeader>jJ :call jedi#goto() <CR> :-tabnew<CR><C-O><C-O>:tabnext<CR>zt
" map <LocalLeader>jd :call jedi#show_documentation() <CR>:wincmd k<CR>
" imap <LocalLeader>jd <ESC>:call jedi#show_documentation() <CR>:wincmd k<CR>a


" ==============================================================================
" Motions / Navigation
" ==============================================================================
map <LocalLeader>eJ :call pymode#motion#move('\v^(class\|def)\s', '')<cr>zt
map <LocalLeader>eK :call pymode#motion#move('\v^(class\|def)\s', 'b')<cr>zt
map <LocalLeader>ej :call pymode#motion#move('^\s*def\s', '')<cr>zt
map <LocalLeader>ek k:call pymode#motion#move('^\s*def\s', 'b')<cr>zt
map <LocalLeader>ea gg /ArgumentParser<cr>zt:nohls<cr>
map <LocalLeader>em gg /def main<cr>zt:nohls<cr>
map <LocalLeader>ei G ?^import<cr>]]3kz.:nohls<cr>
map <LocalLeader>eI [[3kz.

if filereadable($HOME . '/.vim/ftplugin/python_local.vim')
  source ~/.vim/ftplugin/python_local.vim
endif
