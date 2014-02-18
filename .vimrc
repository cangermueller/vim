"## VI configuration file #####################################################


"-- General settings ----------------------------------------------------------

filetype off
source ~/.vim/vundle.vim
filetype plugin indent on


set nocompatible
set hlsearch
nnoremap * *<C-O>
set incsearch
set ignorecase
set smartcase

set number
set cursorline
set ruler

set autoindent
set smartindent
set wrap

set mouse=r
set expandtab
set tabstop=2
set shiftwidth=2
set tabpagemax=20
set wildmode=longest:full
set wildmenu
set nocp
set diffopt+=vertical
set splitright
set splitbelow

syntax on
filetype indent on
filetype plugin on

set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

set undofile
set undodir=~/.vim/undo

set list
set listchars=tab:▸-,trail:·,extends:»,precedes:«,nbsp:⍽

set spell
set spelllang=en_gb

set updatetime=1000

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType gitconfig setl noexpandtab tabstop=4 shiftwidth=4

cabbr th tab help
cabbr tn tab new


"-- Key mappings ---------------------------------------------------------------


map <Leader>1 :let @/='\<<C-R>=expand("<cWORD>")<CR>\>'<CR>:set hls<CR>
map <Leader>2 :nohls<CR>
map <Leader>3 :set cursorline!<CR>
map <Leader>4 ml:execute 'match Search /\%'.line('.').'l/'<CR>
map <Leader>5 ml:execute 'match Search //'<CR>
map <Leader>cw :botright cw <CR>
map <Leader>cc :ccl <CR>
map <Leader>cn :cn <CR>
map <Leader>cp :cp <CR>
map <Leader>lw :botright lopen <CR>
map <Leader>lc :lcl <CR>
map <Leader>ln :lnext <CR>
map <Leader>lp :lprev <CR>
map <Leader>qq :NERDTree <CR>

map <Leader>qe :TagbarToggle <CR>
let g:tagbar_ctags_bin='~/apps/bin/ctags'

map <Leader>,# :s/^/# /<CR>:nohlsearch<CR>
map <Leader>.# :s/^#\s\?//<CR>:nohlsearch<CR>
map <Leader>,/ :s/^/\/\/ /<CR>:nohlsearch<CR>
map <Leader>./ :s/^\/\/\s\?//<CR>:nohlsearch<CR>


"-- ipy mapping --------------------------------------------------------------


autocmd Filetype python call PythonMappings()
function PythonMappings()
  let g:ipy_perform_mappings = 0
  map  <buffer> <silent> <Leader>rf     :IPython<CR>
  map  <buffer> <silent> <Leader>aa     <Plug>(IPython-RunFile)
  map  <buffer> <silent> <Leader>l     <Plug>(IPython-RunLine)
  map  <buffer> <silent> <Leader>L     <Plug>(IPython-RunLineAsTopLevel)
  map  <buffer> <silent> <Leader>d     <Plug>(IPython-RunLine) j
  map  <buffer> <silent> <Leader>D     <Plug>(IPython-RunLineAsTopLevel) j
  xmap <buffer> <silent> <Leader>l     <Plug>(IPython-RunLines)
endfunction


"-- pymode -------------------------------------------------------------------


let g:pymode_run = 0  " use ipy run instead of pymode
let g:pymode_rope = 1 " activate rope
let g:pymode_doc = 0  " activate pydoc
let g:pymode_doc_key = 'K'

" pylint syntax checking
let g:pymode_lint = 1
"let g:pymode_lint_checker = 'pyflakes'
let g:pymode_lint_ignore = 'E226'
let g:pymode_lint_onfly = 0
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


"-- R plugin ----------------------------------------------------------------


let vimrplugin_notmuxconf = 0
let vimrplugin_assign = 1
" let vimrplugin_assign_map = "<C-j>"
let vimrplugin_vimpager="tabnew"
let vimrplugin_insert_mode_cmds=1 "allow commands in insert mode -> see .vim/r-plugin/common_global.vim: function RCreateMaps
let rrst_syn_hl_chunk = 1 "syntax highlight chunck options
let rmd_syn_hl_chunk = 1 "syntax highlight chunck options
let vimrplugin_openpdf = 0 "automatically open pdf. \kop to open pdf
let vimrplugin_openpdf_quietly = 1
let vimrplugin_routmorecolors=1
"imap <buffer><silent> <C-X><C-U> <C-R>=RCompleteArgs()<CR>


"-- vim-markdown -------------------------------------------------------------


let g:vim_markdown_folding_disabled=1

"-- LatexBox -------------------------------------------------------------

let g:LatexBox_viewer='open -a Preview'
let g:LatexBox_quickfix=2
let g:LatexBox_Folding=1
let g:LatexBox_show_warnings=0
let g:LatexBox_latexmk_preview_continuously=1
