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
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'dkprice/vim-easygrep'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'DavidEGx/ctrlp-smarttabs'
Plugin 'jalvesaq/Nvim-R'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-scripts/a.vim'
Plugin 'simeji/winresizer'
Plugin 'tpope/vim-repeat'
Plugin 'Yggdroot/indentLine'
Plugin 'mhinz/vim-startify'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'junegunn/fzf.vim'


call vundle#end()
filetype plugin indent on
