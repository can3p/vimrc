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
let maplocalleader = '.' " tab key

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

" Avoid command-line redraw on every entered character by turning off Arabic
" shaping (which is implemented poorly).
if has('arabic')
    set noarabicshape
endif


" File type settings
" ==================

" Hot Keys
" ========

" buffer movement
nmap <leader>- :Bdelete<CR>
nmap + :CtrlPBuffer<CR>

" open a file in the same folder
nnoremap <leader>e :e <C-R>=fnamemodify(@%, ':p:h')<CR>/

"replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" use gg=G to indent html file
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let g:vundle_default_git_proto = 'git' " use https for githubrepos

Plugin 'gmarik/Vundle.vim'

" lvimrc
Plugin 'embear/vim-localvimrc'
let g:localvimrc_persistent = 1

"Languages and libraries support

" Go
" Do: curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.24.0
" Do: go get golang.org/x/tools/cmd/goimports golang.org/x/tools/gopls
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 0
let g:ale_linters_explicit = 1
let g:ale_fixers = {
      \   'go': ['goimports', 'gofmt'],
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ }
let g:ale_linters = {
      \   'go': ['gopls', 'golangci-lint'],
      \ }
let g:ale_type_map = {
      \   'golangci-lint': {'ES': 'WS', 'E': 'W'},
      \ }
let g:ale_go_gofmt_options = '-s'
let g:ale_lsp_show_message_severity = 'warning'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_sign_info = 'I'
let g:ale_set_highlights = 0
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
set completeopt=menu,menuone,noinsert,noselect
Plugin 'dense-analysis/ale'

autocmd FileType go nnoremap <silent> <buffer> <C-]> :ALEGoToDefinition<CR>
autocmd FileType go nnoremap <silent> <buffer> K :ALEHover<CR>
autocmd Filetype go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4


" HTML/Markup
Plugin 'othree/html5-syntax.vim'
Plugin 'mattn/emmet-vim'
let g:user_zen_settings = {
    \ 'indentation' : '    '
    \ }

Plugin 'tpope/vim-haml'
Plugin 'godlygeek/tabular'
" disable annoying markdown folding - https://github.com/plasticboy/vim-markdown/issues/53
let g:vim_markdown_folding_disabled=1
Plugin 'plasticboy/vim-markdown'

" CSS
Plugin 'Better-CSS-Syntax-for-Vim'
let g:cssColorVimDoNotMessMyUpdatetime = 1

" Javascript
Plugin 'maksimr/vim-jsbeautify'
map <leader>ffj :call JsBeautify()<cr>
map <leader>ffh :call HtmlBeautify()<cr>
Plugin 'jshint.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Python
let g:python_highlight_all = 1
Plugin 'hdima/python-syntax'

" Other Languages
Plugin 'rust-lang/rust.vim'

" Utility plugins

" Editorconfig support
Plugin 'editorconfig/editorconfig-vim'

" helps to repeat custom commands in vim
Plugin 'repeat.vim'
" change surround pair symbols - quotes/brakets etc
Plugin 'surround.vim'

Plugin 'scrooloose/nerdcommenter'
" highlight indent levels
let g:indent_guides_enable_on_vim_startup=1
Plugin 'nathanaelkane/vim-indent-guides'

" Navigation
Plugin 'gmarik/vim-visual-star-search.git'
" move selection up/down
Plugin 'matze/vim-move'

" Keep cwd to the root of the repo
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1
Plugin 'airblade/vim-rooter'

" Visual

" Colorschemes
Plugin 'junegunn/seoul256.vim'

"Misc
Plugin 'L9'
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"let g:ctrlp_cmd = 'CtrlPBuffer'
" close buffer while leaving windows in place
Plugin 'moll/vim-bbye'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-speeddating'
Plugin 'DataWraith/auto_mkdir'
Plugin 'jceb/vim-orgmode'
"grep integration
"without this option plugin fails on Max OS X
let g:Grep_Xargs_Options = '-0'
" trying ack
Plugin 'mileszs/ack.vim'
Plugin 'can3p/incbool.vim'
Plugin 'junegunn/vim-easy-align'
"internal functions to do fs work, Unlink, Move, Chmod, W etc.
Plugin 'tpope/vim-eunuch'

" indent code properly
Plugin 'sickill/vim-pasta'

" highlight syntax errors
" disable jshint checker for syntastic
let g:loaded_syntastic_javascript_jshint_checker = 1
" vim hangs on save otherwise, see https://stackoverflow.com/questions/29220361/writing-java-files-from-vim-hangs
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['java', 'rust'] }
" check syntax for python 3 https://stackoverflow.com/questions/23177561/switch-python-version-for-vim-syntastic
let g:syntastic_python_checkers = ['python3']
Plugin 'scrooloose/syntastic'

Plugin 'thinca/vim-quickrun'

Plugin 'AndrewRadev/linediff.vim'

" pretty statusbar
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

set background=dark
colorscheme seoul256

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"show todo items
command Todo Ggrep! 'TODO'
