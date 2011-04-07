
augroup SESSIONS
au! 
cd /home/can3p/code/pm
badd pm.c
au BufReadPost pm.c setlocal fenc=utf-8 | au! SESSIONS BufReadPost pm.c
augroup END
edit pm.c
let v:this_session = "/home/can3p/.vim/sessions/pm.vim"