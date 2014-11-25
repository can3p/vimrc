" General settings
" ================

set nocompatible " vim mode
set cursorline " highlight current line
set ttyfast
set encoding=utf-8
set termencoding=utf-8
let loaded_netrw = 1 "fuck netrw
language C "use C locale to avoid localized warnings

set langmap=ё`йqцwуeкrеtнyгuшiщoзpх[ъ]фaыsвdаfпgрhоjлkдlж\\;э'яzчxсcмvиbтnьmб\\,ю.Ё~ЙQЦWУEКRЕTНYГUШIЩOЗPХ{Ъ}ФAЫSВDАFПGРHОJЛKДLЖ:Э\\"ЯZЧXСCМVИBТNЬMЮ>Б<

"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1


" leader keys
let mapleader = ','
let maplocalleader = '  ' " tab key

if has('mac')
  set macmeta "command and alt keys should mean the same
endif

" history/undo settings
set history=500
set timeoutlen=250
set undolevels=100

" respect modeline
set modeline
set modelines=5   " default numbers of lines to read for modeline instructions

" backups and swap files
set nobackup
set nowritebackup
set directory=/tmp//           " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set noswapfile
set hidden

" search settings
set smartcase
set ignorecase
set incsearch
set nohlsearch

" Text editing options
" ====================

" swap settings
set nowrap
set textwidth=0
set sidescroll=5
set sidescrolloff=5
set listchars=extends:>,precedes:<

" tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smarttab

set backspace=indent,eol,start

" indent settings
set autoindent
"set foldmethod=indent


" Visual settings
" ===============

syntax on
set mouse=a
set mousehide
set showmatch " show brackets matches
set number " show line numbers
set wildmode=longest,list     " At command line, complete longest common string, then list alternatives.

set completeopt+=preview

" disable window flashing
set noerrorbells
set visualbell
set t_vb=
set hid

" status line
set laststatus=2              " always show status line.
set shortmess=atI             " shortens messages
set showcmd                   " display an incomplete command in statusline

set statusline=%<%f\          " custom statusline
set stl+=[%{&ff}]             " show fileformat
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P

" show tabs
set list
set listchars=tab:>-
set listchars+=trail:·
set listchars+=extends:»,precedes:«

"highlight unnecessary spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

if has('gui_running')
    set guioptions=cMg "console dialogs, do not show menu or toolbar

    if has('mac')
        set guifont=Anonymous\ Pro\:h17
    elseif has('win32')
        set guifont=Consolas:h14:cRUSSIAN
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
endif

" File type settings
" ==================

au BufRead,BufNewFile *.bml set filetype=perl
autocmd BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *Cakefile set filetype=coffee

" Enable comment strings
let vala_comment_strings = 1

" Highlight space errors
let vala_space_errors = 1
" Disable space-tab-space errors
let vala_no_tab_space_error = 1

" Hot Keys
" ========

" buffer movement
nmap <M-k> :bn!<CR>
nmap <M-j> :bp!<CR>
nmap <leader>k :bn!<CR>
nmap <leader>j :bp!<CR>
nmap <leader>- :Bdelete<CR>
nmap <leader>e :NERDTree<CR>
nmap + :CtrlPBuffer<CR>

"replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" use gg=G to indent html file
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

set runtimepath+=~/.vim/vundle/
call vundle#rc()

filetype off
let g:vundle_default_git_proto = 'git' " use https for githubrepos

"Languages and libraries support

" HTML/Markup
Bundle "othree/html5-syntax.vim"
Bundle "mattn/emmet-vim"
let g:user_zen_settings = {
    \ 'indentation' : '    '
    \ }

Bundle "tpope/vim-haml"
Bundle "digitaltoad/vim-jade"
Bundle "Markdown"
Bundle "edsono/vim-matchit"
Bundle "artjock/vim-tmpl"

" CSS
Bundle "Better-CSS-Syntax-for-Vim"
let g:cssColorVimDoNotMessMyUpdatetime = 1
Bundle "wavded/vim-stylus"

" Javascript
Bundle "maksimr/vim-jsbeautify"
map <leader>ffj :call JsBeautify()<cr>
map <leader>ffh :call HtmlBeautify()<cr>
Bundle "jshint.vim"
Bundle "pangloss/vim-javascript"
Bundle "mxw/vim-jsx"

" Clojure
Bundle "guns/vim-clojure-static"
Bundle "tpope/vim-fireplace"


" Other Languages
Bundle "kchmck/vim-coffee-script"
let g:coffeeCheckHighlightErrorLine = 1
Bundle "othree/coffee-check.vim"

" Utility plugins

" Easy way to set marks on the page
Bundle "wokmarks.vim"
let g:wokmarks_do_maps=1

" helps to repeat custom commands in vim
Bundle "repeat.vim"
" change surround pair symbols - quotes/brakets etc
Bundle "surround.vim"

Bundle "scrooloose/nerdcommenter"
" highlight indent levels
Bundle "nathanaelkane/vim-indent-guides"

if has('gui_running')
  let g:indent_guides_enable_on_vim_startup=1
endif

" Navigation
Bundle "gmarik/vim-visual-star-search.git"
" move selection up/down
let g:move_key_modifier = 'C-S'
Bundle "matze/vim-move"

" Visual

" Colorschemes
Bundle "altercation/vim-colors-solarized.git"

"Misc
Bundle "L9"
Bundle "kien/ctrlp.vim"
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 0
"let g:ctrlp_cmd = 'CtrlPBuffer'
" close buffer while leaving windows in place
Bundle "moll/vim-bbye"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-speeddating"
Bundle "DataWraith/auto_mkdir"
Bundle "jceb/vim-orgmode"
" configs per directory
Bundle "embear/vim-localvimrc"
"grep integration
"without this option plugin fails on Max OS X
let g:Grep_Xargs_Options = '-0'
" trying ack
Bundle "mileszs/ack.vim"
Bundle "can3p/incbool.vim"
Bundle "junegunn/vim-easy-align"
"internal functions to do fs work, Unlink, Move, Chmod, W etc.
Bundle "tpope/vim-eunuch"

" indent code properly
Bundle "sickill/vim-pasta"

" highlight syntax errors
" disable jshint checker for syntastic
let g:loaded_syntastic_javascript_jshint_checker = 1
Bundle "scrooloose/syntastic"

"run files fast
let g:quickrun_config = {
\  'coffee': {
\    'command': 'coffee',
\    'cmdopt': '-cbp',
\    'tempfile': '%{tempname()}.coffee',
\    'exec': '%c %a %o %s'
\  },
\  'coffee/run': {
\    'command': 'coffee'
\  }
\}

Bundle "thinca/vim-quickrun"
Bundle "AndrewRadev/splitjoin.vim"

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

Bundle "AndrewRadev/linediff.vim"

" pretty statusbar
Bundle "bling/vim-airline"
Bundle "tommcdo/vim-exchange"
" select text on enter
Bundle "gcmt/wildfire.vim"
Bundle "tpope/vim-unimpaired"
Bundle "machakann/vim-textobj-delimited"

filetype plugin indent on

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme emacs
endif

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"show todo items
command Todo Ggrep! 'TODO'

function! Log()
  let stamp = system("date +%Y-%m-%d")
  let time = system("date +%H:%M:%S")

  let stamp = substitute(stamp, '\n$', '', '')
  if !exists("g:log_dir")
    let g:log_dir = "~/.log"
  endif

  let fname = g:log_dir . "/" . stamp . ".md"

  let stars  = "*************************************"
  let header = "Time: " . time
  execute "edit " . fname
  execute "normal! Go\r". stars . "\r"
  execute "normal! i". header
  execute "normal! i". stars . "\r\r"
endfunction

command Log call Log()

let g:log_dir = "~/Dropbox/.log"
