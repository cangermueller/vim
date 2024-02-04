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

set undofile
set undodir=~/.vim/undo

set directory=~/tmp,/tmp,. " directories for swap files
set noswapfile

set list " show whitespaces as a character
set listchars=tab:▸-,trail:·,extends:»,precedes:«,nbsp:⍽

runtime ftplugin/man.vim " Enable Man pages with :Man
let g:ft_man_open_mode = 'tab' " Show Man pages as tab instead of :split


" ==============================================================================
" Shortcuts
" ==============================================================================
command Q qa!
command S xa!
command W wa!


" ==============================================================================
" Appearance
" ==============================================================================
syntax on
filetype indent on
filetype plugin on

set background=dark
set termguicolors

let g:sonokai_style = 'default'
let g:sonokai_better_performance = 1
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'underline'

colorscheme sonokai


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
" autocmd / filetype
" ==============================================================================
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.gin set filetype=gin

autocmd FileType make setlocal noexpandtab
autocmd FileType gitconfig setl noexpandtab tabstop=4 shiftwidth=4
" Do not break/wrap lines automatically
autocmd FileType * setlocal formatoptions-=tc
" Do not continue comments when hitting o (use -=r or insert mode)
autocmd FileType * setlocal formatoptions-=o


" ==============================================================================
" Key bindings
" ==============================================================================
let maplocalleader=','
set timeoutlen=500 " time to wait after leader key

" ------------------------------------------------------------------------------
" Misc
" ------------------------------------------------------------------------------
" filename
map <Leader>Fp :echo "<c-r>=expand("%:p")<cr>"<cr>
" directory name
map <Leader>FP :echo "<c-r>=expand("%:p:h")<cr>"<cr>

" Join/wrap lines without space
map <Leader>J Jx

" Change indentation
map <Leader>T2 :set tabstop=8 softtabstop=2 shiftwidth=2<CR>
map <Leader>T4 :set tabstop=8 softtabstop=4 shiftwidth=4<CR>

" Emacs like
imap <C-a>a <C-o>^
imap <C-a>e <C-o>$
nmap <C-a>a ^
nmap <C-a>e $

" use `u` to undo, use `U` to redo, mind = blown
nnoremap U <C-r>

" prevent replace mode
" nnoremap <S-r> <Nop>

" Disable recording mode
map q <Nop>

" Disable command history shortcuts
nnoremap q: <nop>
nnoremap Q <nop>

" ==============================================================================
" Substitution / replacements
" ==============================================================================
" Substitution, replacement
" replace word under cursor
:map <leader>Vs :.,$s/\<<C-r><C-w>\>/
:map <leader>VS :%s/\<<C-r><C-w>\>/
:map <leader>Vr :.,$s/<C-r><C-w>/
:map <leader>VR :%s/<C-r><C-w>/
:map <leader>Va :bufdo %s/
:map <leader>VA :bufdo %s/<C-r><C-w>/
:map <leader>Vt :tabdo %s/
:map <leader>VT :tabdo %s/<C-r><C-w>/
" replace windows ^M newline (encoding, line wrap)
:map <Leader>Vn mmHmt:%s/<C-V><cr>/\r/ge<cr>'tzt'm
" replace tabs by spaces
:map <Leader>Vp :%s/\t/  /g
" Remove comments
:map <Leader>Vc :g/^\s*#/d<cr>

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
map gj :tabprev <cr>
map gk :tabnext <cr>
map gh :tabfirst <cr>
map gl :tablast <cr>
map g, :tabm -1 <cr>
map g. :tabm +1 <cr>
map g? :tab help 
map g" :vert help 

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
nmap <c-w>O :vsplit<cr>:e <c-r>=expand("%:p:r")<cr>
nmap <c-w>H :vsplit<cr>:wincmd h<cr>
nmap <c-w>J :split<cr>
nmap <c-w>K :split<cr>:wincmd k<cr>
nmap <c-w><up> :resize +5<cr>
nmap <c-w><down> :resize -5<cr>
nmap <c-w><right> :vertical resize +5<cr>
nmap <c-w><left> :vertical resize -5<cr>
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
map <c-w>! <c-w>T



" ------------------------------------------------------------------------------
" Settings
" ------------------------------------------------------------------------------
map <Leader>St :setl textwidth=0 <cr>
map <Leader>ST :setl textwidth=80 <cr>
map <Leader>Sw :setl wrap!<cr>
map <Leader>So :setl nonumber<cr>:set norelativenumber<cr>
map <Leader>Sn :setl number<cr>:set relativenumber!<cr>
map <Leader>Se :set expandtab! <cr>
map <Leader>Si :setlocal ignorecase!<cr>l
map <Leader>Sm :set mouse=a<CR>
map <Leader>SM :set mouse=<CR>
map <Leader>Sc :vsplit<cr>:wincmd T<cr>:setl nonumber<cr>:setl norelativenumber<cr>:IndentLinesDisable<cr>
map <Leader>Sr :tabdo redraw!<cr>
au FocusGained * :redraw! " Redraw buffer when it gains focus


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
set spell
set spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline

" toggle spell
map <LocalLeader>st :setlocal spell!<cr>
" previous error
map <LocalLeader>sk ]s
" next error
map <LocalLeader>sj [s
" list corrections
map <LocalLeader>ss z=


" ==============================================================================
" Persistent undo
" ==============================================================================
if has('persistent_undo')
  let target_path = expand('~/.config/vim-persisted-undo/')

  if !isdirectory(target_path)
    call system('mkdir -p ' . target_path)
  endif

  let &undodir = target_path
  set undofile
endif


" ------------------------------------------------------------------------------
" winresizer
" ------------------------------------------------------------------------------
" let g:winresizer_start_key="<c-w>w"
" r // resize mode
" m // move mode
" f // focus mode
let g:winresizer_start_key="<c-w>w"


" ==============================================================================
" NERDTree (files)
" ==============================================================================
let NERDSpaceDelims=1
let g:NERDTreeShowBookmarks=1

map <Leader>fF :NERDTree<cr>
map <Leader>ff :NERDTree %:p:h<cr>


" ==============================================================================
" Tagbar
" ==============================================================================
let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 0
let g:tagbar_autoclose = 1
let g:tagbar_sort = 1
let g:tagbar_position = "left"
let g:tagbar_width = 60
let g:tagbar_height = 15
map <Leader>t :TagbarToggle<cr>


" ==============================================================================
" NERDCommenter
" ==============================================================================
let NERDDefaultAlign='both'
let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '#'},
    \ 'borg': { 'left': '//'},
    \ 'textpb': { 'left': '#'},
    \ 'proto': { 'left': '//'},
    \ 'gin': { 'left': '#'}
  \ }


" ==============================================================================
" Airline
" ==============================================================================
let g:airline_theme='sonokai' " badwolf, powerlineish
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#tab_nr_type = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 1

let g:airline_section_b = '%{getcwd()}' " cwd in section a
let g:airline_section_c = '%f' " full filename in section b
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#branch#enabled = 1



" ==============================================================================
" Fugitive (git)
" ==============================================================================
function DiffOn()
  diffthis
  wincmd l
  diffthis
  wincmd r
endfunction

function DiffOff()
  diffoff
  wincmd l
  diffoff
  wincmd q
endfunction

" map <Leader>Gg :Gdiff<cr>:wincmd r<cr>:wincmd t<cr>gg
map <Leader>Gg :call DiffOn()<cr>
command! -nargs=0 Diff :call DiffOn()
map <Leader>Gh :call DiffOff()<cr>
map <Leader>Gs :Gstatus <cr>
map <Leader>GS :Git status -u <cr>
map <Leader>Gb :Gblame<cr>
map <Leader>Gl :Glog<cr>:botright cw<cr>


" ==============================================================================
" Ctrlp
" ==============================================================================
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_regexp = 1

map <c-p> :CtrlPMRUFiles<cr>
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

let g:ctrlp_map = ''
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

set grepprg=rg\ --color=never
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0

" ==============================================================================
" Fuzzy Finder
" ==============================================================================
" :FZF DIRECTORY
set rtp+=~/opt/stow/fzf

let g:fzf_command_prefix = 'FZF'
map <c-a>I :FZF <c-r>=expand("%:p:h")<cr><cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-l': 'vsplit'
  \}

let g:fzf_layout = { 'down': '40%' }

command! -bang -nargs=* FZFRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always 
  \   --colors "path:fg:190,220,255" --colors "line:fg:128,128,128" 
  \   --smart-case '.shellescape(<q-args>), 1, 
  \ { 'options': '--color hl:123,hl+:222' }, 0)

function! FZFGrep()
  let l:cur_dir = getcwd()
  execute 'cd' expand('%:p:h')
  execute 'FZFRg'
  execute 'cd' l:cur_dir
endfunction

map <c-a>o :call FZFGrep()<cr>


" ==============================================================================
" indentLine
" ==============================================================================
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:vim_json_syntax_conceal = 0
map <Leader>Si :IndentLinesToggle<cr>
let g:vim_json_conceal=0


" ==============================================================================
" sideways
" ==============================================================================
map <localleader>a, :SidewaysLeft<cr>
map <localleader>a. :SidewaysRight<cr>
map <localleader>a< :SidewaysJumpLeft<cr>
map <localleader>a> :SidewaysJumpRight<cr>


" ==============================================================================
" Alternate
" ==============================================================================
map <LocalLeader>A :A<cr>


" ==============================================================================
" Custom file switching
" ==============================================================================
function! s:alt_name(name) abort
    if a:name =~ '_test\.cc$'
        return substitute(a:name, '\v_test\.cc$', '.cc', '')
    elseif a:name =~ '\.cc$'
        return substitute(a:name, '\v(.+)\.cc', '\1_test.cc', '')
    elseif a:name =~ '\.h$'
        return substitute(a:name, '\v(.+)\.h', '\1.cc', '')
    elseif a:name =~ '_test\.py$'
        return substitute(a:name, '\v_test\.py$', '.py', '')
    elseif a:name =~ '\.py$'
        return substitute(a:name, '\v(.+)\.py', '\1_test.py', '')
    else
        return a:name
    endif
endfunction

command! -nargs=0 AltName :exe ':drop '.s:alt_name(expand('%'))

map <localleader>ww :AltName<cr>
map <localleader>we :vsplit<cr>:AltName<cr>

" Open main file
command! -nargs=1 EM :exe ':e <args>/*main.*'


" ==============================================================================
" COC
" ==============================================================================
source ~/.vim/coc.vim

" ==============================================================================
" Source post local configs
" ==============================================================================
if filereadable($HOME . '/.vim/local_post.vim')
  source ~/.vim/local_post.vim
endif
