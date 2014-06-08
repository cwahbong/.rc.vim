set nocompatible " We are vim!

" Filetype is set in sub_vimrc/vundle.vimrc

set autoindent   " always set autoindenting on

" Show trailing white space.
set listchars=tab:▸\ ,trail:~
set list

set laststatus=2
set showtabline=2

" Load vimrc for each plugin.
runtime! sub_vimrc/*.vimrc

set timeoutlen=20

" Fast escaping
map df <Esc>
map! df <Esc>
map fd <Esc>
map! fd <Esc>
map jk <Esc>
map! jk <Esc>
map kj <Esc>
map! kj <Esc>
map fj <Esc>
map! fj <Esc>
map jf <Esc>
map! jf <Esc>

" Look and feel
set t_Co=256
set nu
set ruler
set noshowmode

let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

autocmd VimEnter,WinEnter * setlocal cursorline cursorcolumn

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
    " set foldmethod=syntax
    set foldmethod=marker
    set foldlevel=1
"   set foldtext=/^/=>
    set encoding=utf-8
    " set fileencoding=big5
    " set termencoding=big5
    " set encoding=big5
    " set fileencodings=latin,big5,ucs-bom,utf-8,sjis,big5
    set fileencodings=ucs-bom,utf-8,sjis,big5,latin1
else
    set fileencoding=taiwan
endif

if version >= 700
  highlight TabLineSel term=bold,underline cterm=bold,underline ctermfg=7 ctermbg=0
  highlight TabLine    term=bold cterm=bold
  highlight clear TabLineFill
end

set secure

