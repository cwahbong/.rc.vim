runtime colors/desertEx.vim

let g:colors_name="desertEx_spellfix"

" spell patch
hi SpellBad term=reverse ctermfg=9 ctermbg=235 cterm=UNDERLINE
hi SpellCap term=reverse ctermfg=12 ctermbg=235 cterm=UNDERLINE

" diff patch
hi DiffAdd    cterm=bold ctermfg=34 ctermbg=236
hi DiffDelete cterm=bold ctermfg=88 ctermbg=236
hi DiffChange cterm=bold ctermfg=250 ctermbg=236
hi DiffText   cterm=bold ctermfg=142 ctermbg=236
