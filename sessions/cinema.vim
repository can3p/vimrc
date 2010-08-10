
augroup SESSIONS
au! 
cd /var/www/cinema
badd profile.class.php
au BufReadPost profile.class.php setlocal fenc=utf-8 | au! SESSIONS BufReadPost profile.class.php
badd header.php
au BufReadPost header.php setlocal fenc=utf-8 | au! SESSIONS BufReadPost header.php
badd functions.php
au BufReadPost functions.php setlocal fenc=utf-8 | au! SESSIONS BufReadPost functions.php
badd user.class.php
au BufReadPost user.class.php setlocal fenc=utf-8 | au! SESSIONS BufReadPost user.class.php
augroup END
edit profile.class.php
let v:this_session = "/home/can3p/.vim/sessions/cinema.vim"