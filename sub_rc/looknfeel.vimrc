syntax enable
set background=dark

" Show trailing white space.
set listchars=tab:▸\ ,trail:~
set list

function! FoldTextLineCount()
	let lines_count = v:foldend - v:foldstart + 1
	if lines_count >= 100000
		return '| # ***** |'
	elseif lines_count >= 10000
		return '| # ' . printf("%s k", lines_count / 1000) . ' |'
	else
		return '| # ' . printf("%4s", lines_count) . ' |'
	endif
endfunction

function! MyFoldText()
	let fold_title_text = matchstr(foldtext(), ':\ \zs.*')
	let fold_level_text = '+' . (v:foldlevel > 2 ? '<' . v:foldlevel . '>' : printf('%-3s', repeat('-', v:foldlevel)))

	let foldchar = matchstr(&fillchars, 'fold:\zs.')
	let foldtextend = (winwidth(0) > 20 ? FoldTextLineCount() . repeat(foldchar, 4) : '')
	let foldtextstart = strpart(fold_title_text, 0,
		\ min([(winwidth(0) * 2) / 3, winwidth(0) - strlen(foldtextend) - &foldcolumn - &numberwidth]) - 1) . ' '
	let foldtextlength = strlen(foldtextstart) + strlen(foldtextend) + &foldcolumn + &numberwidth
	return foldtextstart . repeat(foldchar, winwidth(0) - foldtextlength) . foldtextend
endfunction
set foldtext=MyFoldText()

" Do not highlight the cursor line number even specified by the color scheme.
autocmd ColorScheme * highlight! link CursorLineNr LineNr

" Do not use bold or underlined font even specified by the color scheme.
autocmd ColorScheme * highlight! CursorLine cterm=NONE

autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

colorscheme grb256_spellfix
