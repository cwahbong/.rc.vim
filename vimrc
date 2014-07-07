set nocompatible " We are vim!

" Filetype is set in sub_vimrc/vundle.vimrc

set autoindent   " always set autoindenting on

" Load vimrc for each plugin.
runtime! plugin_rc/*.vimrc

" Load vimrc
runtime! sub_rc/*.vimrc

" Always use 256 color terminal
set t_Co=256

set wildmenu
set backupdir=~/tmp,.,/var/tmp/vi.recover,/tmp
set directory=~/tmp,/var/tmp/vi.recover,/tmp,.
set backup " keep a backup file
set bs=2 " allow backspacing over everything in insert mode
set viminfo='20,\"50 " read/write a .viminfo file, don't store more
set showmatch

" VIM 6.0,
if version >= 600
    set nohlsearch
    " set foldcolumn=2
"   set foldtext=/^/=>
    set encoding=utf-8
    " set fileencodings=latin,big5,ucs-bom,utf-8,sjis,big5
    set fileencodings=ucs-bom,utf-8,sjis,big5,latin1
else
    set fileencoding=taiwan
endif

set secure
