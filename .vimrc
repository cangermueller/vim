source ~/.vim/vundle.vim

set hlsearch
nnoremap * *<C-O>
set incsearch
set ignorecase
set smartcase

set relativenumber
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
set wildignore+=*.so,*.swp,*.zip,*.gz,*.pdf,*.pyo,*.ipynb
set nocp
set diffopt+=vertical
set splitright
set splitbelow
set updatetime=1000
set backspace=2 " Fix backspace problem since vim7.4
set showmatch " Show matching bracket
set mat=2 " Time show matching bracket

set undofile
set undodir=~/.vim/undo

set directory=~/tmp,/tmp,. " directories for swap files
set noswapfile

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
autocmd BufWrite *.{py,R,Rmd,sh,txt,coffee} :call DeleteTrailingWS()

function DeleteEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWrite *.{py,R,Rmd,sh,txt,coffee} :call DeleteEndLines()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType gitconfig setl noexpandtab tabstop=4 shiftwidth=4
autocmd FileType sh,r,rmd setlocal formatoptions-=t " do not break lines automatically
" change cwd to current file on insert mode
" autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
" autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbr th tab help
cabbr tn tab new
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

" Misc
map <Leader>f :NERDTree<cr>
map <Leader>F :cd %:p:h<cr>
map <Leader>Rx :!chmod u+x <c-r>=expand("%:p")<cr><cr><cr>
map <Leader>Rr :!clear && <c-r>=expand("%:p")<cr><cr>
vmap <Leader>D <s-v>d
" Join/wrap lines without space
map <Leader>J Jx
" Apply macro on every visually selected line
vmap <Leader>m :normal @


" Tabs
map gi :e <c-r>=expand("%:p:h")<cr>/<cr>G
map gI :e <c-r>=expand("%:p:h")<cr>/
map go :tabedit <c-r>=expand("%:p:h")<cr>/<cr>G
map gO :tabedit <c-r>=expand("%:p:h")<cr>/
map gp :-tabnew <c-r>=expand("%:p:h")<cr>/<cr>G
map gP :-tabnew <c-r>=expand("%:p:h")<cr>/
map gn :tabnew 
map gN :-tabnew 
map gm :$tabnew 
map gM :0tabnew 
map gq :tabclose <cr>
map gQ :tabonly <cr>
map gh :tabprev <cr>
map gl :tabnext <cr>
map gH :tabm -1 <cr>
map gL :tabm +1 <cr>
map g? :tab help 
map g, :tabfirst <cr>
map g. :tablast <cr>

" Settings
map <Leader>Sw :set textwidth=0 <cr>
map <Leader>SW :set textwidth=80 <cr>  l
map <Leader>Sn :set number!<cr>:set norelativenumber!<cr> " (no) number
map <Leader>Se :set expandtab! <cr>
map <Leader>Si :set ignorecase!<cr>
map <Leader>St :call DeleteTrailingWS()<cr>
map <Leader>ST :call DeleteEndLines()<cr>
map <Leader>Sl :g/^\_$\n\_^$/d<cr>:nohlsearch<cr>

" Highlighting
map <Leader>1 :let @/='\<<C-R>=expand("<cWORD>")<cr>\>'<cr>:set hls<cr>
map <Leader>2 :nohls<cr>
map <Leader>3 :set cursorline!<cr>
map <Leader>4 ml:execute 'match Search /\%'.line('.').'l/'<cr>
map <Leader>5 ml:execute 'match Search //'<cr>

" Completion
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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
set pastetoggle=<Leader>pt
nmap <Leader>pp o<ESC>p
nmap <Leader>P :set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
imap <Leader>P <Esc>:set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
vmap <Leader>P :!pbpaste<cr>
nmap <Leader>Y :.w !pbcopy<cr><cr>
vmap <Leader>Y :w !pbcopy<cr><cr>
nmap "P "0p

" Quickfix
map <LocalLeader>vv :botright cw <cr>
map <LocalLeader>vq :cclose <cr>
map <LocalLeader>vj :cnext <cr>
map <LocalLeader>vk :cprev <cr>

" Location list
map <LocalLeader>cc :botright lopen 50 <cr>
map <LocalLeader>cq :lcl <cr>
map <LocalLeader>cj :lnext <cr>
map <LocalLeader>ck :lprev <cr>

" Spell checking
map <leader>ss :setlocal spell!<cr>
map <leader>sj ]s
map <leader>sk [s
map <leader>sa zg
map <leader>sA zug
map <leader>s? z=

" Windows
nmap <c-w>k :wincmd k<cr>
nmap <c-w>j :wincmd j<cr>
nmap <c-w>h :wincmd h<cr>
nmap <c-w>l :wincmd l<cr>
nmap <c-w>% :vsplit 
nmap <c-w>T :split 
nmap <C-w><up> :resize +5<cr>
nmap <C-w><down> :resize -5<cr>
nmap <C-w><left> :vertical resize +5<cr>
nmap <c-w><right> :vertical resize -5<cr>
nmap <c-w>z :wincmd \|<cr>

" Buffers
map gb :bnext <cr>
map gB :bNext <cr>
map gsb :sbnext <cr>
map gsB :sbNext <cr>
map gvb :vertical sbnext <cr>
map gvB :vertical sbNext <cr>


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
map <Leader>t :w<cr>:TagbarToggle<cr>s


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
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#branch#enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EasyGrep, vimgrep
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let EasyGrepCommand=1
let g:EasyGrepFilesToExclude=".svn,.git,*.pyc,*.swp"
let EasyGrepJumpToMatch=0
let EasyGrepMode=2
cabbr vg vimgrep
cabbr eg Grep -R
" Grep word under cursor and show occurrences in current file
map <Leader>Vv * :vimgrep /\<<c-r><c-w>\>/j <c-r>=expand("%:p")<cr><cr> :botright cw<cr><c-w>k

" Substitution, replacement
" - replace word under cursor
:map <leader>VS :%s/\<<C-r><C-w>\>/
:map <leader>Vs :.,$s/\<<C-r><C-w>\>/
" - replace windows ^M newline (encoding, line wrap)
:map <Leader>Vn mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


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
map <Leader>Gd :Gdiff<cr>:wincmd x<cr>:wincmd h<cr>
map <Leader>Go :windo diffoff<cr>:wincmd q<cr>
map <Leader>Gt :windo diffthis<cr>
map <Leader>Gs :Gstatus <cr>
map <Leader>GS :Git status -u <cr>
map <Leader>Gb :Gblame<cr>
map <Leader>Gl :Glog<cr>:botright cw<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 1

map <Leader>Cp :CtrlP<cr>
map <Leader>Cm :CtrlPMRUFiles<cr>
map <Leader>CB :CtrlPMixed<cr>
map <Leader>Cb :CtrlPBookmarkDir<cr>
map <Leader>Cl :CtrlPLine<cr>
map <Leader>Cd :CtrlPDir<cr>
map <Leader>Cf :CtrlPFunky<cr>
map <Leader>CF :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

map <c-a>p :CtrlP<cr>
map <c-a>f :CtrlPFunky<cr>
map <c-a>F :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
map <c-a>m :CtrlPMRUFiles<cr>
map <c-a>l :CtrlPLine<cr>
map <c-a>d :CtrlPDir<cr>
map <c-a>b :CtrlPBookmarkDir<cr>
map <c-a>B :CtrlPMixed<cr>

let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_after_jump = 'zxzt'

" let R_in_buffer = 0
" let R_notmuxconf = 1
" let R_esc_term = 0
" let R_close_term = 0
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
