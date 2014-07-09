if exists("g:loaded_cwahbong_autoload")
	finish
endif
let g:loaded_cwahbong_autoload = 1

function! cwahbong#layout_width(nr)
	let w = winwidth(a:nr)
	if w > 80
		return 'wide'
	elseif w >= 60
		return 'normal'
	else
		return 'narrow'
	endif
endfunction
