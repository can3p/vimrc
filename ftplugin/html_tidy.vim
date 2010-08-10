" -*- vim -*-
" FILE: "/home/tv/public_html/software/vim/html_tidy.vim"
" LAST MODIFICATION: "Fre, 12 Apr 2002 14:51:22 +0200 (tv)"
" (C) 2002 by Thorsten Vitt, <vitt@informatik.hu-berlin.de>
" $Id: html_tidy.vim,v 1.1.1.1 2002/04/19 19:34:09 tv Exp $
"
"
"

function! s:FilterThroughTidy(arguments) range
  let oldshellredir=&shellredir
  let &l:shellredir=">%s"
  silent exe ":" . a:firstline . "," . a:lastline . "!tidy " . a:arguments
  redraw!
endfunction

command! -buffer -nargs=* -range=% Tidy <line1>,<line2>:call <SID>FilterThroughTidy(<q-args>)

compiler tidy
