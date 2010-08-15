set noerrorbells
set visualbell
set t_vb=

set foldmethod=indent

set shiftwidth=4
set ts=4
set sw=4
set smartcase
set ignorecase
set incsearch
set langmap=Ж:,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,б\,,ю.,ё`
set langmap=ё`йqцwуeкrеtнyгuшiщoзpх[ъ]фaыsвdаfпgрhоjлkдlж\\;э'яzчxсcмvиbтnьmб\\,ю.Ё~ЙQЦWУEКRЕTНYГUШIЩOЗPХ{Ъ}ФAЫSВDАFПGРHОJЛKДLЖ:Э\\"ЯZЧXСCМVИBТNЬMЮ>Б<
set nowrap
set autoindent
colorscheme dusk
set sidescroll=5
set sidescrolloff=5
set showmatch " проверка скобок
set history=500 " увеличение истории команд
filetype plugin on
filetype indent on
set undolevels=100
set ttyfast
let mapleader = ","
"let loaded_netrw = 1
set guioptions-=T
set guioptions-=r
set guioptions-=m
syntax enable

set tabstop=4
set softtabstop=4 
set shiftwidth=4 
set expandtab
set backspace=indent,eol,start

" список буферов
imap <S-F4> <Esc>:buffers<CR>
nmap <S-F4> :buffers<CR>

" закрыть буфер
imap <C-F4> <Esc>:bd<CR>a
nmap <C-F4> :bd<CR>

" следующий буфер
imap <F6> <Esc>:bn!<CR>a
nmap <F6> :bn!<CR>

" предыдущий буфер
imap <F5> <Esc>:bp!<CR>a
nmap <F5> :bp!<CR>

" вкл/выкл отображения номеров строк
imap <F1> <Esc>:set<Space>nu!<CR>a
nmap <F1> :set<Space>nu!<CR>

"imap <Tab> <C-N>

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBuffs = 1
"let g:miniBufExplModSelTarget = 1

set encoding=utf-8
set termencoding=utf-8

"map <F8> :execute RotateEnc()<CR>
map <F7> :let &fileencoding=&encoding<CR>

set wildmenu 
set wcm=<Tab> 
menu Encoding.koi8-r :e ++enc=koi8-r<CR> 
menu Encoding.windows-1251 :e ++enc=cp1251<CR> 
menu Encoding.ibm-866 :e ++enc=ibm866<CR> 
menu Encoding.utf-8 :e ++enc=utf-8<CR> 
map <F8> :emenu Encoding.<TAB>

set statusline=%<%f%h%m%r%=%b\ \ 0x%B\ \ %l,%c%V\ %P

let g:wokmarks_do_maps=1
