filetype off

" Init vundle
set rtp+=~/.vim/bundle/vundle/

call vundle#begin()

" let Vundle manage Vundle
" REQUIRED
Plugin 'gmarik/vundle'

" My own bundles
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'

" Color themes
Plugin 'flazz/vim-colorschemes'

" Language support
Plugin 'cwahbong/LaTeX-Box'
Plugin 'fatih/vim-go'
Plugin 'vlaadbrain/gnuplot.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'

call vundle#end()

filetype plugin indent on

