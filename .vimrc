" General settings {
source ~/.vim/vundle.vim

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
set linebreak
set cc=+1

set mouse=  "a
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

set directory=~/tmp,/tmp,. " directories for swap files

set list
set listchars=tab:▸-,trail:·,extends:»,precedes:«,nbsp:⍽

set spell
set spelllang=en_gb

" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType gitconfig setl noexpandtab tabstop=4 shiftwidth=4
autocmd FileType r,rmd setlocal formatoptions-=t " do not break lines automatically

cabbr th tab help
cabbr tn tab new

if filereadable($HOME . '/.vim/local.vim')
  source ~/.vim/local.vim
endif
" }


" Key bindings {
let maplocalleader=','

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
map <Leader>tt :%s/\s\+$//g <CR> <c-o>
map <Leader>tw :set textwidth=0 <CR>
map <Leader>tW :set textwidth=80 <CR>
nmap <C-w>k :wincmd k<CR>
nmap <C-w>j :wincmd j<CR>
nmap <C-w>h :wincmd h<CR>
nmap <C-w>l :wincmd l<CR>
imap <C-a>a <C-o>^
imap <C-a>e <C-o>$
nmap <C-a>a ^
nmap <C-a>e $
" }


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

" commenter {
let NERDSpaceDelims=1
"}
