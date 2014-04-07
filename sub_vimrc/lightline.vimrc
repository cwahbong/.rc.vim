let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'fugitive'] ],
	\   'right': [ ['lineinfo'], ['percent'],
	\              ['fileformat', 'fileencoding', 'filetype'] ],
	\ },
	\ 'inactive': {
	\   'left': [],
	\ },
	\ 'tab': {
	\   'active': ['filename_tab'],
	\   'inactive': ['filename_tab'],
	\ },
	\ 'component_function': {
	\   'mode': 'MyMode',
	\   'fugitive': 'MyFugitive',
	\   'fileencoding': 'MyFileencoding',
	\   'fileformat': 'MyFileformat',
	\   'filename': 'MyFilename',
	\   'filetype': 'MyFiletype',
	\ },
	\ 'tab_component_function': {
	\   'filename_tab': 'MyTabFilename',
	\ },
	\ 'separator': { 'left': ''},
	\ 'subseparator': { 'left': '', 'right': '' },
	\ }

function! s:TinyCondition()
	return winwidth(0) < 66
endfunction

function s:SpecialFileTypeByString(s)
	if a:s == "nerdtree"
		return "NERDTree"
	elseif a:s == "vundle"
		return "Vundle"
	elseif a:s == "help"
		return "Help"
	else
		return ""
	endif
endfunction

function! s:SpecialTabFileType(n)
	let winnr = tabpagewinnr(a:n)
	let ft = gettabwinvar(a:n, winnr, "&ft")
	return s:SpecialFileTypeByString(ft)
endfunction

function! s:SpecialFileType()
	return s:SpecialFileTypeByString(&ft)
endfunction

function! MyFileencoding()
	return s:TinyCondition() ? "" : (strlen(&fenc) ? &fenc : &enc)
endfunction

function! MyFileformat()
	return s:TinyCondition() ? "" : &fileformat
endfunction

function! MyFiletype()
	return s:TinyCondition() ? "" : (strlen(&filetype) ? &filetype : '---')
endfunction

function! MyMode()
	let _ = s:SpecialFileType()
	return _ == "" ? lightline#mode() : _
endfunction

function! MyFugitive()
	if !exists("*fugitive#head") || &filetype == "vundle" || s:TinyCondition()
		return ""
	endif
	let _ = fugitive#head()
	return strlen(_) ? " " . _ : ""
endfunction

function! MyTabFilename(n)
	let s = s:SpecialTabFileType(a:n)
	let _ = lightline#tab#filename(a:n)
	return (lightline#tab#readonly(a:n) != "" ? " " : "") .
		\ lightline#tab#filename(a:n) .
		\ (lightline#tab#modified(a:n) != "" && s == "" ? " +" : "")
endfunction
