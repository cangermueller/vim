set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
" Bundle 'ivanov/vim-ipython'
" ipython3.X support
Bundle 'nheijermans/vim-ipython'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'jalvesaq/R-Vim-runtime'
Bundle 'vim-scripts/Vim-R-plugin'
Bundle 'majutsushi/tagbar'
" Bundle 'plasticboy/vim-markdown'
Bundle 'altercation/vim-colors-solarized'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'scrooloose/nerdcommenter'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'yegappan/mru'
Bundle 'dkprice/vim-easygrep'


call vundle#end()
filetype plugin indent on


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
