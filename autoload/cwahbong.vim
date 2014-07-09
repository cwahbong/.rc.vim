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

function! cwahbong#num_4w(n)
	if a:n >= 100000
		return '****'
	elseif a:n >= 10000
		return printf("%d k", a:n / 1000)
	else
		return printf("%4d", a:n)
	endif
endfunction
