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


Bundle 'gmarik/Vundle.vim'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'altercation/vim-colors-solarized'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'dkprice/vim-easygrep'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'jalvesaq/Nvim-R'

call vundle#end()
filetype plugin indent on


