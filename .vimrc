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
set pastetoggle=<Leader>p
set clipboard=unnamed
set showmatch " Show matching bracket
set mat=2 " Time show matching bracket

set undofile
set undodir=~/.vim/undo

set directory=~/tmp,/tmp,. " directories for swap files

set list
set listchars=tab:▸-,trail:·,extends:»,precedes:«,nbsp:⍽

set spell
set spelllang=en_us

syntax on
filetype indent on
filetype plugin on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized


au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Training whitespaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
map <Leader>S :call DeleteTrailingWS()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType gitconfig setl noexpandtab tabstop=4 shiftwidth=4
autocmd FileType r,rmd setlocal formatoptions-=t " do not break lines automatically


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbr th tab help
cabbr tn tab new
cabbr vg vimgrep
cabbr lop lopen 20
command Q qa!
command S xa!
command W wa!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Source local configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable($HOME . '/.vim/local.vim')
  source ~/.vim/local.vim
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let maplocalleader=','

map <Leader>1 :let @/='\<<C-R>=expand("<cWORD>")<CR>\>'<CR>:set hls<CR>
map <Leader>2 :nohls<CR>
map <Leader>3 :set cursorline!<CR>
map <Leader>4 ml:execute 'match Search /\%'.line('.').'l/'<CR>
map <Leader>5 ml:execute 'match Search //'<CR>

map <Leader>D :windo diffthis <CR>
" open file from cur path
map <leader>E :e <c-r>=expand("%:p:h")<cr>/
" open tab from cur path
map <leader>T :tabedit <c-r>=expand("%:p:h")<cr>/
map <Leader>f :NERDTreeToggle <CR>
map <Leader>F :cd %:p:h <CR>
" replace word under cursor
:nnoremap <leader>vs :%s/\<<C-r><C-w>\>/

" Completion
inoremap <C-l> <C-x><C-l>
inoremap <C-f> <C-x><C-f>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap ∆ mz:m+<cr>`z
nmap  mz:m-2<cr>`z
vmap ∆ :m'>+<cr>`<my`>mzgv`yo`z
vmap  :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Emacs like
imap <C-a>a <C-o>^
imap <C-a>e <C-o>$
nmap <C-a>a ^
nmap <C-a>e $

" Yank and paste
nmap <Leader>P :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <Leader>P <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
vmap <Leader>P :!pbpaste<CR>
nmap <Leader>Y :.w !pbcopy<CR><CR>
vmap <Leader>Y :w !pbcopy<CR><CR>
nmap "P "0p

" quickfix
map <Leader>cw :botright cw <CR>
map <Leader>cq :cclose <CR>
map <Leader>cj :cnext <CR>
map <Leader>ck :cprev <CR>

" location list
map <LocalLeader>mm :botright lopen 50 <CR>
map <LocalLeader>mn :lcl <CR>
map <LocalLeader>mj :lnext <CR>
map <LocalLeader>mk :lprev <CR>

" Tabs
map <Leader>gn :tabnew <CR>
map <Leader>gc :tabclose <CR>
map <Leader>go :tabonly <CR>
map <Leader>e :set expandtab! <CR>

" Spell checking
map <leader>ss :setlocal spell!<cr>
map <leader>sj ]s
map <leader>sk [s
map <leader>sa zg
map <leader>sA zug
map <leader>s? z=

" Settings
map <Leader>w :set textwidth=0 <CR>
map <Leader>W :set textwidth=80 <CR>  l
map <Leader>N :set number!<CR> " (no) number

" Windows
nmap <C-w>k :wincmd k<CR>
nmap <C-w>j :wincmd j<CR>
nmap <C-w>h :wincmd h<CR>
nmap <C-w>l :wincmd l<CR>
nmap <C-w>% :wincmd v<CR>
nmap <C-w>T :wincmd s<CR>
nmap <C-w><Up> :resize +5<CR>
nmap <C-w><Down> :resize -5<CR>
nmap <C-w><Left> :vertical resize +5<CR>
nmap <C-w><Right> :vertical resize -5<CR>

" Buffers
map <Leader>gs :Gstatus <CR>
map <Leader>gS :Git status -u <CR>
map gb :bnext <CR>
map gB :bNext <CR>
map gsb :sbnext <CR>
map gsB :sbNext <CR>
map gvb :vertical sbnext <CR>
map gvB :vertical sbNext <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LaTeX-Box
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LatexBox_viewer='open -a Preview'
let g:LatexBox_quickfix=2
let g:LatexBox_Folding=0
let g:LatexBox_show_warnings=0
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_complete_inlineMath=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 1
let g:tagbar_autoclose = 1
map <Leader>t :TagbarToggle <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDSpaceDelims=1
let g:NERDTreeShowBookmarks=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='badwolf' " badwolf, powerlineish
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_section_b = '%{getcwd()}' " cwd in section a
let g:airline_section_c = '%f' " full filename in section b


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MRU
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>H :MRU <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EasyGrep
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let EasyGrepCommand=1
let g:EasyGrepFilesToExclude=".svn,.git,*.pyc,*.swp"
let EasyGrepJumpToMatch=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Supertab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menuone,longest,preview
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabMappingTabLiteral = "<Leader><tab>"
let g:SuperTabLongestHighlight = 1
