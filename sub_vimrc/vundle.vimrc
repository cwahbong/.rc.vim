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

" Language support
Bundle 'jnwhiteh/vim-golang'

filetype plugin indent on

