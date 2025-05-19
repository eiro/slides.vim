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

set conceallevel=3 concealcursor=n

command -nargs=0 Mod  set conceallevel=0 nofen spell
command -nargs=0 Prez set conceallevel=3 fen nospell

" TODO: not required (maybe plugin or eg/ ?)
command -nargs=1 -range=% FixTitles <line1>,<line2>! slides.vim.fixtitles <args>
" TODO: ctrl+l + redraw ?
" TODO: still hacking on PDF generation! shame!
command -nargs=0 Record redir @a
\| exe "normal \<c-l>"
\| redraw
\| silent call system("sh ./next")
\| redir END

nnoremap ,r :Record<cr>
" edition commands:
    inoremap <buffer> (' <space>›<c-o>i
    inoremap <buffer> (* ▶<space>
    inoremap <buffer> (- <space>
    inoremap <buffer> (" ›<space>
    inoremap <buffer> (5  <cr> <cr> <cr> <cr> <cr><esc>5kA

" presentation command
    nnoremap <buffer> <PageUp> zkzt
    nnoremap <buffer> <PageDown> zjzt:Hook<cr>:redraw!<cr>

command ExecTitleCode exec matchstr(getline("."),"^\\v^[^›]+")
command Hook ExecTitleCode

" Theme:
    highlight Slidetitle cterm=bold ctermfg=blue
    highlight Emphasize  cterm=bold ctermfg=darkred  ctermbg=none
    highlight Folded     cterm=none ctermfg=white    ctermbg=none
    highlight Hook                  ctermfg=darkred  ctermbg=none
    setlocal fcs=eob:\ ,fold:\ ,diff:\
    setlocal noshowmode noruler noshowcmd nolist nonu
    setlocal so=0 laststatus=0 statusline=0
    " use nbsp to emphasize something
    " see emphasize.slides demo

setlocal fdm=expr fdo=all fcl=all foldexpr=getline(v:lnum)=~'›'?'>1':1

let b:show_agenda=v:true

if !exists('*AgendaToggle')
    command -nargs=0 Agenda
        \  let b:show_agenda=v:true
        \| setlocal foldtext=substitute(getline(v:foldstart),\".*›\",\"\",\"\")
    command -nargs=0 NoAgenda
        \  let b:show_agenda=v:false
        \| setlocal foldtext='\ '
        " \| setlocal foldtext=substitute(getline(v:foldstart),'.\\v(.*)','','')
    fun AgendaToggle ()
        if b:show_agenda | NoAgenda
        else             | Agenda
        endif
    endfun
    command -nargs=0 AgendaToggle call AgendaToggle()
    command -nargs=0 -bang A <bang>?AgendaShow:AgendaHide
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
