syntax enable
set background=dark

" Show trailing white space.
set listchars=tab:▸\ ,trail:~
set list

" Do not highlight the cursor line number even specified by the color scheme.
autocmd ColorScheme * highlight! link CursorLineNr LineNr

" Do not use bold or underlined font even specified by the color scheme.
autocmd ColorScheme * highlight! CursorLine cterm=NONE

autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

colorscheme grb256_spellfix
