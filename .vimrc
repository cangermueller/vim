" General settings {
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
set nosmartindent
set wrap

set textwidth=80
set cc=+1

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
set updatetime=1000
set backspace=2 " Fix backspace problem since vim7.4

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

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType gitconfig setl noexpandtab tabstop=4 shiftwidth=4

cabbr th tab help
cabbr tn tab new

if filereadable($HOME . '/.vim/local.vim')
  source ~/.vim/local.vim
endif
" }


" Key bindings {
map <Leader>1 :let @/='\<<C-R>=expand("<cWORD>")<CR>\>'<CR>:set hls<CR>
map <Leader>2 :nohls<CR>
map <Leader>3 :set cursorline!<CR>
map <Leader>4 ml:execute 'match Search /\%'.line('.').'l/'<CR>
map <Leader>5 ml:execute 'match Search //'<CR>
map <Leader>cw :botright cw <CR>
map <Leader>cq :ccl <CR>
map <Leader>cn :cn <CR>
map <Leader>cp :cp <CR>
map <Leader>lw :botright lopen <CR>
map <Leader>lq :lcl <CR>
map <Leader>ln :lnext <CR>
map <Leader>lp :lprev <CR>
map <Leader>ll :PymodeLint<CR>
map <Leader>qq :NERDTree <CR>
map <Leader>qe :TagbarToggle <CR>
map <Leader>gs :Gstatus <CR>
map <Leader>t :%s/\s\+$//g <CR>
nmap <C-w>k :wincmd k<CR>
nmap <C-w>j :wincmd j<CR>
nmap <C-w>h :wincmd h<CR>
nmap <C-w>l :wincmd l<CR>

let maplocalleader=','
nmap <LocalLeader>w <Plug>RSendLine
imap <LocalLeader>w <Plug>RSendLine
vmap <LocalLeader>w <Plug>RSendLine
imap <LocalLeader>a <Plug>RCompleteArgs
imap <LocalLeader>c <c-x><c-o>
imap <LocalLeader>i ```{r}<CR>```<ESC>:normal!O<CR> "Insert chunk in Rmd
"}


" python-mode {
let g:pymode = 1
let g:pymode_run = 0  " use ipy run instead of pymode
let g:pymode_rope = 0 " activate rope
let g:pymode_doc = 0  " activate pydoc -> use jedi instead
let g:pymode_doc_key = 'K'

let g:pymode_lint = 1
let g:pymode_lint_ignore = 'E226,E501,W'
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_cwindow = 1

let g:pymode_breakpoint = 0
let g:pymode_breakpoint_key = 'b'

let g:pymode_folding = 0
let g:pymode_options = 0
" }

" jedi-vim {
let g:jedi#popup_on_dot = 0
" }


" r-plugin {
let vimrplugin_notmuxconf = 1
let vimrplugin_assign = 1
let vimrplugin_assign_map = "<C-j>"
let vimrplugin_insert_mode_cmds=1 "allow commands in insert mode -> see .vim/r-plugin/common_global.vim: function RCreateMaps
let rrst_syn_hl_chunk = 1 "syntax highlight chunck options
let rmd_syn_hl_chunk = 1 "syntax highlight chunck options
let vimrplugin_openpdf = 1 "automatically open pdf. \kop to open pdf
let vimrplugin_routmorecolors=1
let vimrplugin_vimpager="tabnew"
let vimrplugin_vsplit = 1
let vimrplugin_show_args = 1
"}



" vim-markdown {
let g:vim_markdown_folding_disabled=1
" }


" LaTeX-Box {
let g:LatexBox_viewer='open -a Preview'
let g:LatexBox_quickfix=2
let g:LatexBox_Folding=0
let g:LatexBox_show_warnings=0
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_complete_inlineMath=1
" }


" tagbar {
let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 1
let g:tagbar_autoclose = 1
" }
