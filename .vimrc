" ==============================================================================
" Source pre local configs
" ==============================================================================
if filereadable($HOME . '/.vim/local_pre.vim')
  source ~/.vim/local_pre.vim
endif

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
set tabstop=8 softtabstop=2 shiftwidth=2
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


runtime ftplugin/man.vim " :Man MANPAGE
let g:ft_man_open_mode = 'tab'

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


" ==============================================================================
" Spell checking
" ==============================================================================
set spell
set spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline


" ==============================================================================
" Trailing whitespaces
" ==============================================================================
func! DeleteTrailingWS()
  " Exclude certain file types
  if &ft =~ 'vim'
    return
  endif
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

function DeleteEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWrite * :call DeleteEndLines()


" ==============================================================================
" autocmd
" ==============================================================================
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType gitconfig setl noexpandtab tabstop=4 shiftwidth=4
" Do not break/wrap lines automatically
autocmd FileType * setlocal formatoptions-=t
autocmd FileType * setlocal formatoptions-=c
set filetype-=t
set filetype-=c
" change cwd to current file on insert mode
" autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
" autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)



" ==============================================================================
" Commands
" ==============================================================================
cabbr th tab help
cabbr tn tab new
cabbr lop lopen 20
cabbr Py python3
command Q qa!
command S xa!
command W wa!
" command Sh ocwd="google/src/cloud/christofa/al/google3/medical/retina" | cd %:p:h | sh | cd ocwd

function Sh_ ()
  let a:cwd = getcwd()
  exec "cd" expand("%:p:h")
  sh
  exec "cd" a:cwd
endfunction

command Sh call Sh_()
command Apwd echo expand('%:p')

" ==============================================================================
" Key bindings
" ==============================================================================
let maplocalleader=','
set timeoutlen=500 " time to wait after leader key

" ------------------------------------------------------------------------------
" Misc
" ------------------------------------------------------------------------------
map <Leader>fF :NERDTree<cr>
map <Leader>ff :NERDTree %:p:h<cr>

" Change cwd/pwd to current file
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
map <Leader>Dl ddO<esc>
" Change indentation
map <Leader>T2 :set tabstop=8 softtabstop=2 shiftwidth=2<CR>
map <Leader>T4 :set tabstop=8 softtabstop=4 shiftwidth=4<CR>
" Source .vimrc
map <Leader>Vr :source ~/.vimrc<CR>

" Exiting
map <Leader>Q :qa!<cr>
imap <Leader>Q <esc>:qa!<cr>
map <Leader>E :xa!<cr>
imap <Leader>E <esc>:xa!<cr>

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
map giI :e <c-r>=expand("%:p:h")<cr>/<cr>G
map gii :e <c-r>=expand("%:p:h")<cr>/
map gij :e <c-r>=expand("%:p:r")<cr>
map goO :tabedit <c-r>=expand("%:p:h")<cr>/<cr>G
map goo :tabedit <c-r>=expand("%:p:h")<cr>/
map goj :tabedit <c-r>=expand("%:p:r")<cr>
map gpP :-tabnew <c-r>=expand("%:p:h")<cr>/<cr>G
map gpp :-tabnew <c-r>=expand("%:p:h")<cr>/
map gpj :-tabnew <c-r>=expand("%:p:r")<cr>
map gn :tabnew 
map gN :-tabnew 
map gm :$tabnew 
map gM :0tabnew 
map ge :tabclose <cr>
map gE :tabonly <cr>
map gh :tabprev <cr>
map gl :tabnext <cr>
map gj :tabfirst <cr>
map gk :tablast <cr>
map g, :tabm -1 <cr>
map g. :tabm +1 <cr>
map g? :tab help 
cabbr ? help

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> gP :exe "tabn ".g:lasttab<cr>
vnoremap <silent> gP :exe "tabn ".g:lasttab<cr>

function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    " sp
    vert below split
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

" ------------------------------------------------------------------------------
" Windows
" ------------------------------------------------------------------------------
nmap <c-w>k :wincmd k<cr>
nmap <c-w>j :wincmd j<cr>
nmap <c-w>h :wincmd h<cr>
nmap <c-w>l :wincmd l<cr>
nmap <c-w>L :vsplit<cr>
nmap <c-w>H :vsplit<cr>:wincmd h<cr>
nmap <c-w>J :split<cr>
nmap <c-w>K :split<cr>:wincmd k<cr>
nmap <C-w><up> :resize -5<cr>
nmap <C-w><down> :resize +5<cr>
nmap <C-w><right> :vertical resize -5<cr>
nmap <c-w><left> :vertical resize +5<cr>
" zoom in / <c-w>= to zoom out
nmap <c-w>z :wincmd \|<cr>:wincmd _<cr>
" close below
nmap <LocalLeader>ne :wincmd j<cr>:wincmd q<cr>

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    " sp
    vert below split
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

" Move windows or tabs
map g< :call MoveToPrevTab()<CR>
map g> :call MoveToNextTab()<CR>
command! -nargs=1 L vsplit <args>
command! -nargs=1 H split <args>


" ------------------------------------------------------------------------------
" winresizer
" ------------------------------------------------------------------------------
" let g:winresizer_start_key="<c-w>w"
" r // resize mode
" m // move mode
" f // focus mode
let g:winresizer_start_key="<c-w>w"



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
map <Leader>So :set nonumber<cr>:set norelativenumber<cr>
map <Leader>Sn :set number<cr>:set relativenumber!<cr>
" map <Leader>Sa :set number<cr>:set relativenumber<cr>
map <Leader>Se :set expandtab! <cr>
map <Leader>Si :set ignorecase!<cr>l
map <Leader>Sm :set mouse=a<CR>
map <Leader>SM :set mouse=<CR>



" ------------------------------------------------------------------------------
" Higlighting
" ------------------------------------------------------------------------------
map <Leader>1 :let @/='\<<C-R>=expand("<cWORD>")<cr>\>'<cr>:set hls<cr>
map <Leader>2 :nohls<cr>
map <Leader>3 ml:execute 'match Search /\%'.line('.').'l/'<cr>
map <Leader># ml:execute 'match Search //'<cr>


" ------------------------------------------------------------------------------
" Yank and paste
" ------------------------------------------------------------------------------
" Toogle paste mode
set pastetoggle=<Leader>p
" Paste / put
nmap <Leader>P :set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
imap <Leader>P <esc>:set paste<cr>:r !pbpaste<cr>:set nopaste<cr>kJxi
vmap <Leader>P :!pbpaste<cr>
" Copy / yank
nmap <Leader>Y :.w !pbcopy<cr><cr>
vmap <Leader>Y :<cr>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>


" ------------------------------------------------------------------------------
" Lists
" ------------------------------------------------------------------------------
" Quickfix
command! ClearQuickfix cclose | call setqflist([])

map <LocalLeader>vv :botright cw  5<cr><cr>
map <LocalLeader>ve :cclose <cr>
map <LocalLeader>vf :cfirst <cr>
map <LocalLeader>vj :cnext <cr>
map <LocalLeader>vk :cprev <cr>
map <LocalLeader>vc :ClearQuickfix<cr>

" open selection in tab
autocmd FileType qf nnoremap <buffer> <c-i> <c-w><Enter><c-w>T 

" Location list
map <LocalLeader>cc :botright lopen 5<cr><cr>
map <LocalLeader>ce :lcl <cr>
map <LocalLeader>cf :lfirst <cr>
map <LocalLeader>cj :lnext <cr>
map <LocalLeader>ck :lprev <cr>


" ------------------------------------------------------------------------------
" Spell checking
" ------------------------------------------------------------------------------
map <LocalLeader>st :setlocal spell!<cr>
map <LocalLeader>sk ]s
map <LocalLeader>sj [s
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
let g:tagbar_autopreview = 1
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0
map <Leader>t :TagbarToggle<cr>


" ==============================================================================
" NERDCommenter
" ==============================================================================
let NERDDefaultAlign='both'
au BufRead,BufNewFile *.uni setfiletype unison
let g:NERDCustomDelimiters = {
    \ 'unison': { 'left': '#'},
    \ 'python': { 'left': '#'},
    \ 'borg': { 'left': '//'},
    \ 'textpb': { 'left': '#'},
    \ 'proto': { 'left': '//'}
  \ }
" TODO mappings
map <Leader>cd oTODO: <ESC><leader>c<space>A
map <Leader>cD OTODO: <ESC><leader>c<space>A
imap <Leader>cd TODO: <ESC><leader>c<space>A


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
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_type = 0

let g:airline_section_b = '%{getcwd()}' " cwd in section a
let g:airline_section_c = '%f' " full filename in section b
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#branch#enabled = 1


" ==============================================================================
" EasyGrep, vimgrep
" ==============================================================================
" \vv // match word
" \vV // match whole word
" \vo // option explorer
" \vr // replace word
"   * buffers (\vyb), to replace in all buffers
"   * 'User' (\vyu), to replace only in current file
" \vR // replace whole word
" Replace what by // will ask for confirmation
" Replace /num?y/numpy/
" ReplaceUndo
let EasyGrepCommand=1
let g:EasyGrepFilesToExclude=".svn,.git,*.pyc,*.swp"
let EasyGrepJumpToMatch=1
let EasyGrepMode=2
let EasyGrepEveryMatch=1
let EasyGrepWindow=1
let EasyGrepReplaceWindowMode=0

cabbr eg Grep


" ==============================================================================
" Substitution / replacements
" ==============================================================================
cabbr vg vimgrep
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
:map <Leader>VT :tabdo :%s/


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
map <Leader>Gg :GDiff<cr>:wincmd t<cr>gg
map <Leader>Gh :windo diffoff<cr>:wincmd t<cr>:wincmd o<cr>
map <Leader>Gs :Gstatus <cr>
map <Leader>GS :Git status -u <cr>
map <Leader>Gb :Gblame<cr>
map <Leader>Gl :Glog<cr>:botright cw<cr>


" ==============================================================================
" Ctrlp
" ==============================================================================
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_regexp = 1

map <c-a>p :CtrlPBuffer<cr>
map <c-a>j :CtrlPFunky<cr>
map <c-a>k :CtrlPFunkyMulti<cr>
map <c-a>u :CtrlPBufTagAll<cr>
map <c-a>i :CtrlPCurFile<cr>
map <c-a>l :CtrlPLine %<cr>
map <c-a>L :CtrlPLine<cr>
map <c-a>b :CtrlPBookmarkDir<cr>
map <c-a>m :CtrlPSmartTabs<cr>

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_after_jump = 'zxzt'
let g:ctrlp_funky_sort_by_mru = 1
" let g:ctrlp_funky_multi_buffers = 1 " does not work.
let g:ctrlp_open_multiple_files = 'v' " open multiple files vertically by default
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30'

cabbr cbb CtrlPBookmarkDirAdd

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-i>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>', '<c-l>'],
    \ 'PrtCurRight()':        ['<right>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>', '<c-h>'],
    \ 'PrtCurLeft()':         ['<left>', '<c-^>'],
    \}


" ==============================================================================
" YouCompleteMe
" ==============================================================================
let g:ycm_key_list_select_completion=['<TAB>', '<Down>']
let g:ycm_key_list_stop_completion = ['<c-y>','<CR>']


" ==============================================================================
" easy-align
" ==============================================================================
" gaip, // align paragraph by 1st ,
" gaip*, // align paragraph by all ,
" a= // align in visual mode by =
" :EasyAlign  // starts interative mode
"   c-d   // press c-d multiple times to change alignment
" :EasyAlign 1 ,  // align by 1st ,
" :EasyAlign * ,  // align by all ,
" :EasyAlign! * , // right-align all by ,
" :EasyAlign * ,ar  // right-align all by ,
" :EasyAlign * ,ac  // center-align all by ,
" Use <c-i> to open quickfix selection in new tab (see above)
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" ==============================================================================
" Fuzzy Finder
" ==============================================================================
" :FZF DIRECTORY
set rtp+=~/opt/stow/fzf
map <c-a>I :FZF <c-r>=expand("%:p:h")<cr><cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-l': 'vsplit'
  \}

let g:fzf_history_dir = '~/.local/share/fzf-history'



" ==============================================================================
" Source post local configs
" ==============================================================================
if filereadable($HOME . '/.vim/local_post.vim')
  source ~/.vim/local_post.vim
endif
