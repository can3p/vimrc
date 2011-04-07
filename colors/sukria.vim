" Vim color file
" Maintainer:   Alexis Sukrieh <spam@sukria.net>
" Last Change:  2003 Sep 16

" this is my colorscheme, I finaly took the time to make 
" a Vim Theme file with it.
" it's for dark background (black is better) and is fine for working a long
" time in front of the screen without getting tired because of enlightened
" colors

set bg=dark
hi clear
if exists("syntax_on")
        syntax reset
endif

let colors_name = "sukria"


"------ this clears out the old colors before we begin
highlight Comment     NONE
highlight Constant    NONE
highlight Delimiter   NONE
highlight Directory   NONE
highlight Error       NONE
highlight ErrorMsg    NONE
highlight Identifier  NONE
highlight LineNr      NONE
highlight ModeMsg     NONE
highlight MoreMsg     NONE
highlight Normal      NONE
highlight NonText     NONE
highlight PreProc     NONE
highlight Question    NONE
highlight Search      NONE
highlight Special     NONE
highlight SpecialKey  NONE
highlight Statement   NONE
highlight StatusLine  NONE
highlight Title       NONE
highlight Todo        NONE
highlight Type        NONE
highlight Visual      NONE
highlight WarningMsg  NONE

"----- these are the new superior colors
highlight Normal      term=standout                                             ctermfg=7
highlight Comment     term=bold                                                         ctermfg=3                                               guifg=#FF2f8f
highlight Constant    term=underline    cterm=bold      ctermfg=3                                               guifg=#FF2f8f
highlight Delimiter   term=bold                                                         ctermfg=3                                               guifg=Red
highlight Directory   term=bold                                                         ctermfg=3                                               guifg=Blue
highlight Error       term=standout                                     ctermfg=1                                               guifg=red
highlight ErrorMsg    term=standout                                     ctermfg=1                                               guifg=red
highlight Identifier  term=underline                                    ctermfg=6                                               guifg=yellow3
highlight LineNr      term=standout                             ctermfg=8                                               guifg=Brown
highlight ModeMsg     term=bold                                                         ctermfg=6                                               guifg=yellow2
highlight MoreMsg     term=bold                                                         ctermfg=6                                               guifg=Green
highlight NonText     term=bold                                                         ctermfg=6                                               guifg=green3
highlight PreProc     term=underline                                    ctermfg=9                                               guifg=cyan
highlight Question    term=standout                                     ctermfg=5                                               guifg=Green
highlight Search      term=reverse              cterm=bold                                                                              guifg=black
highlight Special     term=bold                         cterm=bold      ctermfg=5                                               guifg=SlateBlue
highlight SpecialKey  term=bold                                                         ctermfg=2                                               guifg=Blue
highlight Statement   term=bold                         cterm=bold      ctermfg=10                                      guifg=green3
highlight StatusLine  term=reverse                                              ctermfg=0               ctermbg=7       guifg=wheat guibg=#2f4f4f
highlight StatusLineNC term=bold                                                ctermfg=7               ctermbg=2       guifg=#071f1f guibg=#5f9f9f
highlight Title       term=bold                         cterm=bold      ctermfg=1                                               gui=bold guifg=Blue
highlight Todo        term=bold                                                         ctermfg=9               ctermbg=11      guifg=red guibg=yellow1 gui=bold
highlight Type        term=underline                                    ctermfg=6                                               guifg=yellow3 gui=bold
highlight Visual      term=reverse              cterm=bold      ctermfg=6               ctermbg=5       guifg=yellow guibg=blue
highlight WarningMsg  term=standout     cterm=bold      ctermfg=1               ctermbg=4       guifg=Red
