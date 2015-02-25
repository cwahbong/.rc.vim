filetype off

" Init vundle
set rtp+=~/.vim/bundle/vundle/

call vundle#begin()

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
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'majutsushi/tagbar'

" Color themes
Bundle 'flazz/vim-colorschemes'

" Language support
Bundle 'cwahbong/LaTeX-Box'
Bundle 'jnwhiteh/vim-golang'
Bundle 'vlaadbrain/gnuplot.vim'

call vundle#end()

filetype plugin indent on

