" ==============================================================================
" Source plugings
" ==============================================================================
source ~/.vim/vundle.vim


" ==============================================================================
" Settings
" ==============================================================================
set hlsearch
nnoremap * *<C-O>
set incsearch
set ignorecase
set smartcase
set encoding=utf-8

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


" ==============================================================================
" Appearance
" ==============================================================================
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized


au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction


" ==============================================================================
" Trailing whitespaces
" ==============================================================================
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.{py,R,Rmd,sh,txt,coffee,tex,rst,md} :call DeleteTrailingWS()

function DeleteEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWrite *.{py,R,Rmd,sh,txt,coffee,tex,rst,md} :call DeleteEndLines()


" ==============================================================================
" autocmd
" ==============================================================================
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType gitconfig setl noexpandtab tabstop=4 shiftwidth=4
autocmd FileType * setlocal formatoptions-=t " do not break lines automatically
autocmd FileType markdown setlocal formatoptions-=tn " do not break lines automatically
" change cwd to current file on insert mode
" autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
" autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)



" ==============================================================================
" Commands
" ==============================================================================
cabbr th tab help
cabbr tn tab new
cabbr lop lopen 20
command Q qa!
command S xa!
command W wa!


" ==============================================================================
" Key bindings
" ==============================================================================
let maplocalleader=','

" ------------------------------------------------------------------------------
" Misc
" ------------------------------------------------------------------------------
map <Leader>f :NERDTree<cr>
map <Leader>Ff :cd %:p:h<cr>
" Show absolute path of current file
map <Leader>Fp :echo "<c-r>=expand("%:p")<cr>"<cr>
map <Leader>Rx :!chmod u+x <c-r>=expand("%:p")<cr><cr><cr>
map <Leader>Rr :!clear && <c-r>=expand("%:p")<cr><cr>
" Find non-ASCII characters
map <Leader>Ru /[^\x00-\x7F]<cr>

" Join/wrap lines without space
map <Leader>J Jx
" Apply macro on every visually selected line
vmap <Leader>m :normal @
" Deleting stuff
map <Leader>Dt :call DeleteTrailingWS()<cr>
map <Leader>De :call DeleteEndLines()<cr>
map <Leader>Dw :g/^\_$\n\_^$/d<cr>:nohlsearch<cr>
map <Leader>cr :%s/\(^\s*\)\<run\>/\1# run/g<cr>
map <Leader>cR :%s/# run\>/run/g<cr>

"  Completion
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <C-l> <C-x><C-l>
inoremap <C-f> <C-x><C-f>

" Emacs like
imap <C-a>a <C-o>^
imap <C-a>e <C-o>$
nmap <C-a>a ^
nmap <C-a>e $


" ------------------------------------------------------------------------------
" Tabs
" ------------------------------------------------------------------------------
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
map ge :tabclose <cr>
map gE :tabonly <cr>
map gh :tabprev <cr>
map gl :tabnext <cr>
map gH :tabm -1 <cr>
map gL :tabm +1 <cr>
map g? :tab help 
map g, :tabfirst <cr>
map g. :tablast <cr>


" ------------------------------------------------------------------------------
" Windows
" ------------------------------------------------------------------------------
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


" ------------------------------------------------------------------------------
" Buffers
" ------------------------------------------------------------------------------
map gb :bnext <cr>
map gB :bNext <cr>
map gsb :sbnext <cr>
map gsB :sbNext <cr>
map gvb :vertical sbnext <cr>
map gvB :vertical sbNext <cr>


" ------------------------------------------------------------------------------
" Settings
" ------------------------------------------------------------------------------
map <Leader>St :set textwidth=0 <cr>
map <Leader>ST :set textwidth=80 <cr>
map <Leader>Sw :set wrap!<cr>
map <Leader>Sn :set number!<cr>:set norelativenumber!<cr> " (no) number
map <Leader>Se :set expandtab! <cr>
map <Leader>Si :set ignorecase!<cr>l
map <Leader>Sm :set mouse=a<CR>
map <Leader>SM :set mouse=<CR>



" ------------------------------------------------------------------------------
" Higlighting
" ------------------------------------------------------------------------------
map <Leader>1 :let @/='\<<C-R>=expand("<cWORD>")<cr>\>'<cr>:set hls<cr>
map <Leader>2 :nohls<cr>
map <Leader>3 :set cursorline!<cr>
map <Leader>4 ml:execute 'match Search /\%'.line('.').'l/'<cr>
map <Leader>5 ml:execute 'match Search //'<cr>


" ------------------------------------------------------------------------------
" Yank and paste
" ------------------------------------------------------------------------------
set pastetoggle=<Leader>pt
nmap <Leader>pp o<CR><CR><ESC>p
nmap <Leader>P :set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
imap <Leader>P <Esc>:set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
vmap <Leader>P :!pbpaste<cr>
nmap <Leader>Y :.w !pbcopy<cr><cr>
vmap <Leader>Y :w !pbcopy<cr><cr>
nmap "P "0p


" ------------------------------------------------------------------------------
" Lists
" ------------------------------------------------------------------------------
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


" ------------------------------------------------------------------------------
" Spell checking
" ------------------------------------------------------------------------------
map <LocalLeader>st :setlocal spell!<cr>
map <LocalLeader>sj ]s
map <LocalLeader>sk [s
map <LocalLeader>ss z=
" add word
map <LocalLeader>sa zg
" remove word
map <LocalLeader>sr zug


" ==============================================================================
" vim-markdown
" ==============================================================================
let g:vim_markdown_folding_disabled=1


" ==============================================================================
" Latex-box
" ==============================================================================
let g:LatexBox_viewer='open -a Preview'
let g:LatexBox_quickfix=2
let g:LatexBox_show_warnings=0
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_complete_inlineMath=1
let g:LatexBox_Folding=0
let g:LatexBox_fold_sections = ["section", "subsection", "subsubsection"]

" ==============================================================================
" Tagbar
" ==============================================================================
let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 0
let g:tagbar_autoclose = 1
let g:tagbar_sort = 1
map <Leader>t :w<cr>:TagbarToggle<cr>s


" ==============================================================================
" NERDCommenter
" ==============================================================================
let NERDDefaultAlign='both'
au BufRead,BufNewFile *.uni setfiletype unison
let g:NERDCustomDelimiters = {
    \ 'unison': { 'left': '#', 'leftAlt': 'FOO', 'rightAlt': 'BAR' }
  \ }


" ==============================================================================
" NERDtree
" ==============================================================================
let NERDSpaceDelims=1
let g:NERDTreeShowBookmarks=1


" ==============================================================================
" Airline
" ==============================================================================
let g:airline_theme='badwolf' " badwolf, powerlineish
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_section_b = '%{getcwd()}' " cwd in section a
let g:airline_section_c = '%f' " full filename in section b
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#branch#enabled = 1


" ==============================================================================
" EasyGrep, vimgrep
" ==============================================================================
let EasyGrepCommand=1
let g:EasyGrepFilesToExclude=".svn,.git,*.pyc,*.swp"
let EasyGrepJumpToMatch=1
let EasyGrepMode=2
let EasyGrepEveryMatch=1
let EasyGrepReplaceWindowMode=2
cabbr vg vimgrep
cabbr eg Grep -R
" Grep word under cursor and show occurrences in current file
map <Leader>Vv * :vimgrep /\<<c-r><c-w>\>/j <c-r>=expand("%:p")<cr><cr> :botright cw<cr><c-w>k

" Substitution, replacement
" replace word under cursor
:map <leader>VS :%s/\<<C-r><C-w>\>/
:map <leader>Vs :.,$s/\<<C-r><C-w>\>/
" replace windows ^M newline (encoding, line wrap)
:map <Leader>Vn mmHmt:%s/<C-V><cr>/\r/ge<cr>'tzt'm
" replace tabs by spaces
:map <Leader>Vt :%s/\t/  /g


" ==============================================================================
" Supertab
" ==============================================================================
set completeopt=menuone,longest,preview
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-p>"
let g:SuperTabMappingTabLiteral = "<Leader><tab>"
let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&omnifunc:<c-x><c-o>",
\ "&completefunc:<c-x><c-u>"
\ ]


" ==============================================================================
" Fugitive
" ==============================================================================
map <Leader>Gd :Gdiff<cr>:wincmd x<cr>:wincmd h<cr>
map <Leader>Go :windo diffoff<cr>:wincmd q<cr>
map <Leader>Gt :windo diffthis<cr>
map <Leader>Gs :Gstatus <cr>
map <Leader>GS :Git status -u <cr>
map <Leader>Gb :Gblame<cr>
map <Leader>Gl :Glog<cr>:botright cw<cr>


" ==============================================================================
" Ctrlp
" ==============================================================================
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_regexp = 1

map <c-a>p :CtrlP<cr>
map <c-a>f :CtrlPFunky<cr>
map <c-a>F :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
map <c-a>m :CtrlPMRUFiles<cr>
map <c-a>l :CtrlPLine<cr>
map <c-a>d :CtrlPDir<cr>
map <c-a>b :CtrlPBuffer<cr>
map <c-a>B :CtrlPBookmarkDir<cr>

let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_after_jump = 'zxzt'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

cabbr cbb CtrlPBookmarkDirAdd

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-i>'],
    \}

" ==============================================================================
" Source local configs
" ==============================================================================
if filereadable($HOME . '/.vim/local.vim')
  source ~/.vim/local.vim
endif
