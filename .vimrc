"## VI configuration file #####################################################

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'klen/python-mode'
Bundle 'ivanov/vim-ipython'
Bundle 'tpope/vim-fugitive'
filetype plugin indent on

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 0
let g:pymode_lint_checker = 'pychecker'
let g:pymode_lint_onfly = 0
" Auto check on save
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0



"-- General settings ----------------------------------------------------------

set nocompatible
set number
set hlsearch
set incsearch
set mouse=r
set wrap
set ignorecase
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
colorscheme default
syntax on
filetype indent on
filetype plugin on
"set textwidth=80
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=t
set cinoptions+=(0,N-s "(0: additional spaces in case of line wrap; N-s: no indent for namespaces
"let g:tex_fold_enabled=1
let g:Tex_PromptedEnvironments='equation,align,equation*,align*,eqnarray*,eqnarray,column,columns,center'
let g:Tex_PromptedCommands='footnote,cite,pageref,label'


" -- pathogen plugin manager
"execute pathogen#infect()


" -- syntastic syntax checker
"let g:syntastic_enable_highlighting = 1
"let g:syntastic_auto_jump = 1
"let g:syntastic_auto_loc_list = 1



"-- Key mappings ---------------------------------------------------------------


hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
map <Leader>1 :let @/='\<<C-R>=expand("<cWORD>")<CR>\>'<CR>:set hls<CR>
map <Leader>2 :nohls<CR>
map <Leader>3 :set cursorline!<CR>
map <Leader>4 ml:execute 'match Search /\%'.line('.').'l/'<CR>
map <Leader>5 ml:execute 'match Search //'<CR>
map <Leader>6 ml:execute 'match ErrorMsg "\%>80v.\+"'<CR>
map <Leader>cw :botright cw <CR>
map <Leader>cc :ccl <CR>
map <Leader>cn :cn <CR>
map <Leader>cp :cp <CR>
map <Leader>qq :NERDTree <CR>
map <Leader>qe :TagbarToggle <CR>
map <Leader>qw :GundoToggle <CR>
map <Leader>m :make <CR>
" change keymapping for r-plugin argument completion
imap <buffer><silent> <C-X><C-U> <C-R>=RCompleteArgs()<CR>
" block comments
map <Leader>,# :s/^/# /<CR>:nohlsearch<CR>
map <Leader>.# :s/^#\s\?//<CR>:nohlsearch<CR>
map <Leader>,/ :s/^/\/\/ /<CR>:nohlsearch<CR>
map <Leader>./ :s/^\/\/\s\?//<CR>:nohlsearch<CR>


"-- Commands -------------------------------------------------------------------


:com -nargs=1 Width set tabstop=<args> | set shiftwidth=<args>
:com -nargs=1 Make make! -f MakefileC <args>


"-- OmniCppComplete ------------------------------------------------------------


set tags+=~/.vim/tags/cpp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
map <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-j> :exec("tag ".expand("<cword>"))<CR>
map <C-k> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-l> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set completeopt=menuone,menu,longest,preview
"ruby
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1


"-- Screen plugin --------------------------------------------------------------


let g:ScreenImpl = 'Tmux'
:function! s:ScreenShellListener()
if g:ScreenShellActive
  map <C-c><C-c> :ScreenSend<cr>
  nmap <C-c>q :ScreenQuit<cr>
else
  nmap <C-c><C-c> :ScreenShell<cr>
endif
endfunction

nmap <C-c><C-c> :ScreenShell<cr>
augroup ScreenShellEnter
  autocmd User * call <SID>ScreenShellListener()
augroup END
augroup ScreenShellExit
  autocmd User * call <SID>ScreenShellListener()
augroup END


"-- EasyGrep plugin ------------------------------------------------------------


let EasyGrepMode=2
let EasyGrepWindowPosition='botright'
let EasyGrepReplaceWindowMode=0


"-- R plugin ----------------------------------------------------------------


let vimrplugin_notmuxconf = 0
let vimrplugin_assign = 0
let vimrplugin_vimpager="tabnew"
let vimrplugin_insert_mode_cmds=1 "allow commands in insert mode -> see .vim/r-plugin/common_global.vim: function RCreateMaps
let rrst_syn_hl_chunk = 1 "syntax highlight chunck options
let rmd_syn_hl_chunk = 1 "syntax highlight chunck options
let vimrplugin_openpdf = 0 "automatically open pdf. \kop to open pdf
let vimrplugin_openpdf_quietly = 1
