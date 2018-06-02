" vim: fdm=indent
" digraphs are
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
    highlight CursorLine cterm=bold ctermbg=blue ctermfg=white
    highlight emphasize cterm=bold ctermfg=darkred ctermbg=none
    highlight Folded cterm=none ctermbg=none ctermfg=white
    setlocal fcs=fold:\ ,diff:\  cursorline
    setlocal noshowmode noruler noshowcmd nolist nonu
    setlocal so=0 laststatus=0 statusline=0
    " use nbsp to emphasize something
    " see emphasize.slides demo

" every slide starts with a ›
setlocal fdm=expr fdo=all fcl=all foldexpr=getline(v:lnum)=~'^\ *›'?'>1':1
let b:show_agenda=v:true

if !exists('*AgendaToggle')
    command -nargs=0 AgendaShow
        \  let b:show_agenda=v:true
        \| setlocal foldtext=substitute(getline(v:foldstart),'.\\v(.*)','\\1\ \ \','')
    command -nargs=0 AgendaHide
        \  let b:show_agenda=v:false
        \| setlocal foldtext=substitute(getline(v:foldstart),'.\\v(.*)','','')
    fun AgendaToggle ()
        if b:show_agenda | AgendaHide
        else             | AgendaShow
        endif
    endfun
    command -nargs=0 AgendaToggle call AgendaToggle()
endif

AgendaToggle
