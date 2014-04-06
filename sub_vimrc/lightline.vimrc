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
	\   'filename_tab': 'MyFilenameTab',
	\ },
	\ 'separator': { 'left': ''},
	\ 'subseparator': { 'left': '', 'right': '' },
	\ }

function! s:TinyCondition()
	return winwidth(0) < 66
endfunction

function! s:SpecialFileType()
	if &filetype == "nerdtree"
		return "NERDTree"
	elseif &filetype == "vundle"
		return "Vundle"
	elseif &filetype == "help"
		return "Help"
	else
		return ""
	endif
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

function! MyFilenameTab(count)
	let s = s:SpecialFileType()
	let _ = s == "" ? lightline#tab#filename(a:count) : s
	return (lightline#tab#readonly(a:count) != "" || s != "" ? " " : "") .
		\ ('' != _ ? _ : "[No Name]") .
		\ (lightline#tab#modified(a:count) != "" && s == "" ? " +" : "")
endfunction
