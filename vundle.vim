set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'DavidEGx/ctrlp-smarttabs'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/a.vim'
Plugin 'simeji/winresizer'
Plugin 'tpope/vim-repeat'
Plugin 'Yggdroot/indentLine'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Colors
Plugin 'sainnhe/sonokai'
Plugin 'RRethy/vim-hexokinase'


call vundle#end()
filetype plugin indent on
