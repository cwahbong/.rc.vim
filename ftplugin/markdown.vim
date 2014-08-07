if exists("b:did_ftplugin") || &filetype != "markdown"
	finish
endif

setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=80
