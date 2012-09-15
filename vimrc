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
set foldmethod=indent


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
        set guifont=Andale\ Mono\:h13
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
nmap <leader>- :Kwbd<CR>
nmap <leader>e :TagExplorer<CR>

" Smart way to move btw. windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Maps Ctrl-[h,j,k,l] to resizing a window split
nnoremap <C-h> <C-w><
nnoremap <C-j> <C-W>+
nnoremap <C-k> <C-W>-
nnoremap <C-l> <C-w>>

"replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

set runtimepath+=~/.vim/vundle/
call vundle#rc()

filetype off
let g:vundle_default_git_proto = 'git' " use https for githubrepos

"Languages and libraries support

" HTML/Markup
Bundle "othree/html5-syntax.vim"
Bundle "mattn/zencoding-vim"
let g:user_zen_settings = {
    \ 'indentation' : '    '
    \ }

Bundle "tpope/vim-haml"
Bundle "digitaltoad/vim-jade"
Bundle "Markdown"
Bundle "edsono/vim-matchit"

" CSS
Bundle "Better-CSS-Syntax-for-Vim"
Bundle "skammer/vim-css-color"
let g:cssColorVimDoNotMessMyUpdatetime = 1
Bundle "groenewege/vim-less"

" Javascript
Bundle "jQuery"
Bundle "jsbeautify"
Bundle "jshint.vim"
Bundle "jelera/vim-javascript-syntax"

" Other Languages
Bundle "kchmck/vim-coffee-script"
Bundle "Dart"
Bundle "rainux/vim-vala"
Bundle "actionscript.vim--Leider"

" clojure
Bundle "VimClojure"

let g:vimclojure#WantNailgun = 1
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

" Utility plugins

" Easy way to set marks on the page
Bundle "wokmarks.vim"
let g:wokmarks_do_maps=1

" helps to repeat custom commands in vim
Bundle "repeat.vim"
" change surround pair symbols - quotes/brakets etc
Bundle "surround.vim"

Bundle "scrooloose/nerdcommenter"

" Command-T
Bundle "git://git.wincent.com/command-t.git"
let g:CommandTMatchWindowAtTop=1 " show window at top

" Navigation
Bundle "gmarik/vim-visual-star-search.git"
Bundle "tagexplorer.vim"

" Visual

" Colorschemes
Bundle "nanotech/jellybeans.vim"
Bundle "altercation/vim-colors-solarized.git"

"Misc
Bundle "L9"
Bundle "FuzzyFinder"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-speeddating"
Bundle "DataWraith/auto_mkdir"
Bundle "jceb/vim-orgmode"
Bundle "carlosedp/TabBar"

" tabbar fix for mac
if has('mac')
  nmap <D-1> <M-1>
  nmap <D-2> <M-2>
  nmap <D-3> <M-3>
  nmap <D-4> <M-4>
  nmap <D-5> <M-5>
  nmap <D-6> <M-6>
  nmap <D-7> <M-7>
  nmap <D-8> <M-8>
  nmap <D-9> <M-9>

  imap <D-1> <M-1>
  imap <D-2> <M-2>
  imap <D-3> <M-3>
  imap <D-4> <M-4>
  imap <D-5> <M-5>
  imap <D-6> <M-6>
  imap <D-7> <M-7>
  imap <D-8> <M-8>
  imap <D-9> <M-9>
endif

Bundle "Lokaltog/vim-easymotion"
" indent code properly
Bundle "sickill/vim-pasta"

filetype plugin indent on

if has('gui_running')
  set background=dark
  colorscheme jellybeans
else
  colorscheme emacs
endif
