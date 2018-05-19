" vim: fdm=indent
" digraphs
" ‹ = 1<
" › = 1>

" edition commands:
    inoremap <buffer> (* ▶<space>
    inoremap <buffer> (- <space>
    inoremap <buffer> (" ›<space>
    inoremap <buffer> (5  <cr> <cr> <cr> <cr> <cr><esc>5kA

" presentation command
    nnoremap <buffer> <PageUp> zkzt
    nnoremap <buffer> <PageDown> zjzt

" Theme:
    set fcs=fold:\ ,diff:\ 
    highlight CursorLine cterm=bold ctermbg=blue ctermfg=white
    highlight Folded cterm=none ctermbg=none ctermfg=white
    set statusline=0 noshowmode noruler noshowcmd
    setlocal nonu cursorline so=0 laststatus=0
    " use nbsp to emphasize something
    " see emphasize.slides demo
    highlight emphasize ctermfg=red cterm=bold

" every slide starts with a ›
set fdm=expr foldexpr=getline(v:lnum)=~'^\ *›'?'>1':1

let b:show_agenda=v:true
command -nargs=0 AgendaShow
    \  let b:show_agenda=v:true
    \| set foldtext=substitute(getline(v:foldstart),'.\\v(.*)','\\1\ \ \','')
command -nargs=0 AgendaHide
    \  let b:show_agenda=v:false
    \| set foldtext=substitute(getline(v:foldstart),'.\\v(.*)','','')

fun AgendaToggle ()
    if b:show_agenda | AgendaHide
    else             | AgendaShow
    endif
endfun

command -nargs=0 AgendaToggle call AgendaToggle()

" " Presentation mode open and close folders automatically
command -nargs=0 Presentation set fdo=all fcl=all
Presentation
AgendaToggle




" Dead code ? ( just toggle foldenable? )
    " Edition mode reset default folding behavior
    " command -nargs=0 Edition set fcl= fdo=block,hor,mark,percent,quickfix,search,tag,undo
