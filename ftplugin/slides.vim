" vim: fdm=indent
" digraphs are
" ‹ = 1<
" › = 1>

let $PATH = join(
\ [ $PATH
\ , expand('<sfile>:p:h:h')."/bin"
\ , expand('%:p:h')."/bin"
\ ]
\ , ":" )
command -nargs=1 -range=% FixTitles <line1>,<line2>! slides.vim.fixtitles <args>

set conceallevel=3 concealcursor=n
command -nargs=0 Mod  set conceallevel=0 nofen spell
command -nargs=0 Prez set conceallevel=3 fen nospell

command -nargs=0 Record redir @a
\| exe "normal \<c-l>"
\| redraw
\| silent call system("sh ./next")
\| redir END

nnoremap ,x :Record<cr>
" edition commands:
    inoremap <buffer> (' <space>›<c-o>i
    inoremap <buffer> (* ▶<space>
    inoremap <buffer> (- <space>
    inoremap <buffer> (" ›<space>
    inoremap <buffer> (5  <cr> <cr> <cr> <cr> <cr><esc>5kA

" presentation command
    nnoremap <buffer> <PageUp> zkzt
    nnoremap <buffer> <PageDown> zjzt:Hook<cr>

command Hook exec matchstr(getline("."),"^\\v^[^›]+")

" Theme:
    highlight Slidetitle cterm=bold ctermfg=white   ctermbg=blue
    highlight Emphasize  cterm=bold ctermfg=darkred ctermbg=none
    highlight Hook  ctermfg=darkred ctermbg=none
    highlight Folded cterm=none ctermbg=none ctermfg=white
    setlocal fcs=fold:\ ,diff:\
    setlocal noshowmode noruler noshowcmd nolist nonu
    setlocal so=0 laststatus=0 statusline=0
    " use nbsp to emphasize something
    " see emphasize.slides demo

setlocal fdm=expr fdo=all fcl=all foldexpr=getline(v:lnum)=~'^›\ '?'>1':1

let b:show_agenda=v:true

if !exists('*AgendaToggle')
    command -nargs=0 AgendaShow
        \  let b:show_agenda=v:true
        \| setlocal foldtext=getline(v:foldstart)
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

command -nargs=0 LoadTheme
\| set nofen
\| silent /^" *<vim\>/;/^" *vim>/w! /tmp/vimslidestheme
\| so /tmp/vimslidestheme
\| silent exec "!rm /tmp/vimslidestheme"

if search("^\" *<vim\\>","n") | LoadTheme
endif
set fen " should be a toggle in LoadTheme
1
