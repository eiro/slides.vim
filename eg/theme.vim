syn keyword Concept my ass
highlight Concept ctermfg=red ctermbg=none
set list lcs=tab:\ \ │ ts=5
syn region Shell matchgroup=ShellConceal start="┬" end="┴" concealends
syn match Shell      "▐ .*"
syn match Selection  "\v[^\t]+ "
highlight Selection ctermfg=black ctermbg=220
highlight Shell     ctermfg=black ctermbg=220
set vts=5,8
highlight Terminal ctermfg=black ctermbg=220
" highlight Terminal link Shell




