set nocompatible " We are vim!

let g:tex_flavor="latex"

" Filetype is set in sub_vimrc/vundle.vimrc

set autoindent   " always set autoindenting on

" Show trailing white space.
set listchars=tab:▸\ ,trail:~
set list

set laststatus=2
set showtabline=2

" Load vimrc for each plugin.
runtime! plugin_rc/*.vimrc

set timeoutlen=20

" Fast escaping
noremap df <Esc>
noremap! df <Esc>
noremap fd <Esc>
noremap! fd <Esc>
noremap jk <Esc>
noremap! jk <Esc>
noremap kj <Esc>
noremap! kj <Esc>
noremap fj <Esc>
noremap! fj <Esc>
noremap jf <Esc>
noremap! jf <Esc>

" Look and feel
set t_Co=256
set relativenumber
set ruler
set noshowmode

autocmd ColorScheme * highlight! link CursorLineNr LineNr
autocmd ColorScheme * highlight! CursorLine cterm=NONE
autocmd ColorScheme * highlight! SpellBad ctermfg=160 ctermbg=16 cterm=UNDERLINE

syntax enable
set background=dark
colorscheme grb256

autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

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

