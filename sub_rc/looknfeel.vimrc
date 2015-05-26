syntax enable
set background=dark

" Show trailing white space.
set listchars=tab:▸\ ,trail:~
set list

function! MyFoldText()
	let foldchar = matchstr(&fillchars, 'fold:\zs.')
	let wtext = cwahbong#layout_width(0)

	let fold_title_text = matchstr(foldtext(), ':\ \zs.*')

	let foldtextend = ''
	if wtext != 'narrow'
		let fill_end = repeat(foldchar, wtext == 'wide' ? 4 + (winwidth(0) - 80) / 4 : 4)
		let lines_count = v:foldend - v:foldstart + 1
		let fold_linecount_text = '| # ' . cwahbong#num_4w(lines_count) . ' |'
		let foldtextend = fold_linecount_text . fill_end
	endif

	let nonstart_len = strlen(foldtextend) + &foldcolumn + &numberwidth
	let foldtextstart = strpart(fold_title_text, 0, winwidth(0) - nonstart_len - 2) . ' ' . foldchar
	let foldtextlength = strlen(foldtextstart) + nonstart_len
	return foldtextstart . repeat(foldchar, winwidth(0) - foldtextlength) . foldtextend
endfunction
set foldtext=MyFoldText()

" Do not highlight the cursor line number even specified by the color scheme.
autocmd ColorScheme * highlight! link CursorLineNr LineNr

" Do not use bold or underlined font even specified by the color scheme.
autocmd ColorScheme * highlight! CursorLine cterm=NONE

autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

colorscheme desertEx_spellfix
