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
" => Trailing whitespaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.R :call DeleteTrailingWS()
autocmd BufWrite *.Rmd :call DeleteTrailingWS()
autocmd BufWrite *.sh :call DeleteTrailingWS()
map <Leader>St :call DeleteTrailingWS()<CR>
" multiple blank lines -> single one
map <Leader>Sl :g/^\_$\n\_^$/d<CR>:nohlsearch<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType gitconfig setl noexpandtab tabstop=4 shiftwidth=4
autocmd FileType r,rmd setlocal formatoptions-=t " do not break lines automatically
" change cwd to current file on insert mode
" autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
" autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)


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

" open file from cur path
map <leader>E :e <c-r>=expand("%:p:h")<cr>/
" open tab from cur path
map <leader>T :tabedit <c-r>=expand("%:p:h")<cr>/
map <Leader>f :NERDTreeToggle <CR>
map <Leader>F :cd %:p:h <CR>
" replace word under cursor
:map <leader>vs :%s/\<<C-r><C-w>\>/
" replace windows ^M newline (encoding, line wrap)
:map <Leader>vn mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Settings
map <Leader>w :set textwidth=0 <CR>
map <Leader>W :set textwidth=80 <CR>  l
map <Leader>N :set number!<CR> " (no) number
map <Leader>e :set expandtab! <CR>
map <Leader>i :set ignorecase!<CR>

" Highlighting
map <Leader>1 :let @/='\<<C-R>=expand("<cWORD>")<CR>\>'<CR>:set hls<CR>
map <Leader>2 :nohls<CR>
map <Leader>3 :set cursorline!<CR>
map <Leader>4 ml:execute 'match Search /\%'.line('.').'l/'<CR>
map <Leader>5 ml:execute 'match Search //'<CR>

" Completion
inoremap <C-l> <C-x><C-l>
inoremap <C-f> <C-x><C-f>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <c-j> mz:m+<cr>`z
nmap <c-k> mz:m-2<cr>`z
vmap <c-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <c-k> :m'<-2<cr>`>my`<mzgv`yo`z
" if has("mac") || has("macunix")
  " nmap <D-j> <M-j>
  " nmap <D-k> <M-k>
  " vmap <D-j> <M-j>
  " vmap <D-k> <M-k>
" endif

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
map <LocalLeader>no :botright cw <CR>
map <LocalLeader>nq :cclose <CR>
map <LocalLeader>nn :cnext <CR>
map <LocalLeader>nm :cprev <CR>

" location list
map <LocalLeader>mo :botright lopen 50 <CR>
map <LocalLeader>mq :lcl <CR>
map <LocalLeader>mm :lnext <CR>
map <LocalLeader>mn :lprev <CR>

" Tabs
map gn :tabnew 
map gN :-tabnew 
map gm :$tabnew 
map gM :0tabnew 
map gq :tabclose <CR>
map go :tabonly <CR>
map gh :tabprev <CR>
map gl :tabnext <CR>
map gH :tabm -1 <CR>
map gL :tabm +1 <CR>
map g? :tab help 

" Spell checking
map <leader>ss :setlocal spell!<cr>
map <leader>sj ]s
map <leader>sk [s
map <leader>sa zg
map <leader>sA zug
map <leader>s? z=

" Windows
nmap <C-w>k :wincmd k<CR>
nmap <C-w>j :wincmd j<CR>
nmap <C-w>h :wincmd h<CR>
nmap <C-w>l :wincmd l<CR>
nmap <C-w>% :vsplit 
nmap <C-w>T :split 
nmap <C-w><Up> :resize +5<CR>
nmap <C-w><Down> :resize -5<CR>
nmap <C-w><Left> :vertical resize +5<CR>
nmap <C-w><Right> :vertical resize -5<CR>

" Buffers
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
let g:airline#extensions#tabline#fnamemod = ':t'


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
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-p>"
let g:SuperTabMappingTabLiteral = "<Leader><tab>"
let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&omnifunc:<c-x><c-o>",
\ "&completefunc:<c-x><c-u>"
\ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>Gd :Gdiff<CR>:wincmd x<CR>:wincmd h<CR>
map <Leader>Go :windo diffoff<CR>:wincmd q<CR>
map <Leader>Gt :windo diffthis<CR>
map <Leader>Gs :Gstatus <CR>
map <Leader>GS :Git status -u <CR>

