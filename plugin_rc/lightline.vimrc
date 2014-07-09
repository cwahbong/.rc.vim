let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'fugitive'],
	\             [ 'filename_active'] ],
	\   'right': [ ['lineinfo'], ['percent'],
	\              ['fileformat', 'fileencoding', 'filetype'] ],
	\ },
	\ 'inactive': {
	\   'left': [['filename_inactive']],
	\ },
	\ 'tab': {
	\   'active': ['filename_active_tab'],
	\   'inactive': ['filename_tab'],
	\ },
	\ 'component_function': {
	\   'mode': 'MyMode',
	\   'fugitive': 'MyFugitive',
	\   'fileencoding': 'MyFileencoding',
	\   'fileformat': 'MyFileformat',
	\   'filename_active': 'MyFilenameActive',
	\   'filename_inactive': 'MyFilename',
	\   'filetype': 'MyFiletype',
	\ },
	\ 'tab_component_function': {
	\   'mode_tab' : 'MyTabMode',
	\   'filename_tab': 'MyTabFilename',
	\   'filename_active_tab': 'MyActiveTabFilename',
	\ },
	\ 'separator': { 'left': ''},
	\ 'subseparator': { 'left': '', 'right': '' },
	\ }

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
	return cwahbong#layout_width(0) == "narrow" ? "" : (strlen(&fenc) ? &fenc : &enc)
endfunction

function! MyFileformat()
	return cwahbong#layout_width(0) == "narrow" ? "" : &fileformat
endfunction

function! MyFilename()
	let filename = expand('%:t')
	return (&readonly ? " " : "") .
		\ filename .
		\ (&modified ? " +" : "")
endfunction

function! MyFilenameActive()
	return cwahbong#layout_width(0) == "wide" ? MyFilename() : ""
endfunction

function! MyFiletype()
	return cwahbong#layout_width(0) == "narrow" ? "" : (strlen(&filetype) ? &filetype : '---')
endfunction

function! MyMode()
	let _ = s:SpecialFileType()
	return _ == "" ? lightline#mode() : _
endfunction

function! MyFugitive()
	if !exists("*fugitive#head") || &filetype == "vundle" || cwahbong#layout_width(0) == "narrow"
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

function! MyActiveTabFilename(n)
	return "@ " . MyTabFilename(a:n)
endfunction
