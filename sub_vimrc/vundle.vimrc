filetype off

" Init vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" REQUIRED
Bundle 'gmarik/vundle'

" My own bundles
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'itchyny/lightline.vim'

" Color themes
Bundle 'flazz/vim-colorschemes'

" Language support
Bundle 'jnwhiteh/vim-golang'
Bundle 'vlaadbrain/gnuplot.vim'

filetype plugin indent on

