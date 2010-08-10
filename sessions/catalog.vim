
augroup SESSIONS
au! 
cd /var/www/catalog
badd include/config.php
badd admin/admin_functions.php
badd include/functions.php
badd login.php
au BufReadPost login.php setlocal fenc=utf-8 | au! SESSIONS BufReadPost login.php
badd index_page.php
badd admin/index.php
badd admin/users.php
augroup END
edit login.php
let v:this_session = "/home/demon/.vim/sessions/catalog.vim"