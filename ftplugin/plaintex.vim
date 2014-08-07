if exists("b:did_ftplugin") || &filetype != "plaintex"
	finish
endif

setlocal textwidth=72
