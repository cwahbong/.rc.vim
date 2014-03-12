let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'fugitive', 'filename' ] ]
	\ },
	\ 'component_function': {
	\   'mode': 'MyMode',
	\   'fugitive': 'MyFugitive',
	\   'filename': 'MyFilename'
	\ },
	\ 'separator': { 'left': ''},
	\ 'subseparator': { 'left': '', 'right': '' }
	\ }

function! MyMode()
	return &filetype == "nerdtree" ? "NERDTree" :
		\ &filetype == "vundle" ? "Vundle" :
		\ winwidth(0) > 60 ? lightline#mode() : ""
endfunction

function! MyModified()
	if &filetype == "help"
		return ""
	elseif &modified
		return "+"
	elseif &modifiable
		return ""
	else
		return ""
	endif
endfunction

function! MyReadonly()
	if &filetype == "help"
		return ""
	elseif &readonly
		return ""
	else
		return ""
	endif
endfunction

function! MyFugitive()
	if !exists("*fugitive#head") || &filetype == "vundle"
		return ""
	endif
	let _ = fugitive#head()
	return strlen(_) ? " " . _ : ''
endfunction

function! MyFilename()
	if &filetype == "nerdtree" || &filetype == "vundle"
		return ""
	endif
	return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
		\ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
		\ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
