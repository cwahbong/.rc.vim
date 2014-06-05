set nocompatible " We are vim!

" Filetype is set in sub_vimrc/vundle.vimrc
syntax on

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

" Tab key binding
map <C-t>c :tabnew<CR>
map <C-t>q :tabclose<CR>
map <C-t>h :tabprev<CR>
map <C-t>l :tabnext<CR>
map <C-t>p :tabprev<CR>
map <C-t>n :tabnext<CR>

" Look and feel
set t_Co=256
set nu
set ruler
set noshowmode
colorscheme ir_black_p

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
  map g1 :tabn 1<CR>
  map g2 :tabn 2<CR>
  map g3 :tabn 3<CR>
  map g4 :tabn 4<CR>
  map g5 :tabn 5<CR>
  map g6 :tabn 6<CR>
  map g7 :tabn 7<CR>
  map g8 :tabn 8<CR>
  map g9 :tabn 9<CR>
  map g0 :tabn 10<CR>

  highlight TabLineSel term=bold,underline cterm=bold,underline ctermfg=7 ctermbg=0
  highlight TabLine    term=bold cterm=bold
  highlight clear TabLineFill
end

set secure

