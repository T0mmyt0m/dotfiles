set nocompatible
filetype off

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Color scheme
Plugin 'nanotech/jellybeans.vim'

" Vim improvement plugins
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

colorscheme jellybeans
