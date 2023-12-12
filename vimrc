vim9script
# General settings
# ================

set nocompatible # vim mode
set cursorline # highlight current line
set ttyfast
set encoding=utf-8
set termencoding=utf-8
var loaded_netrw = 1 #fuck netrw
g:netrw_dirhistmax = 0 # for real

language C #use C locale to avoid localized warnings

set langmap=ё`йqцwуeкrеtнyгuшiщoзpх[ъ]фaыsвdаfпgрhоjлkдlж\\;э'яzчxсcмvиbтnьmб\\,ю.Ё~ЙQЦWУEКRЕTНYГUШIЩOЗPХ{Ъ}ФAЫSВDАFПGРHОJЛKДLЖ:Э\\"ЯZЧXСCМVИBТNЬMЮ>Б<

#syntax highlight shell scripts as per POSIX,
#not the original Bourne shell which very few use
g:is_posix = 1


# leader keys
g:mapleader = ","

# history/undo settings
set history=500
set timeoutlen=250
set undolevels=100

# respect modeline
set modeline
set modelines=5   # default numbers of lines to read for modeline instructions

# backups and swap files
set nobackup
set nowritebackup
set directory=/tmp//           # prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set noswapfile
set hidden

# search settings
set smartcase
set ignorecase
set incsearch
set nohlsearch

# Text editing options
# ====================

# swap settings
set nowrap
set textwidth=0
set sidescroll=5
set sidescrolloff=5
set listchars=extends:>,precedes:<

# tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smarttab

set backspace=indent,eol,start

# indent settings
set autoindent
#set foldmethod=indent


# Visual settings
# ===============

syntax on
set mouse=a
set mousehide
set showmatch # show brackets matches
set number # show line numbers
set wildmode=longest,list     # At command line, complete longest common string, then list alternatives.

set completeopt+=preview

# disable window flashing
set noerrorbells
set visualbell
set t_vb=
set hid

# status line
set laststatus=2              # always show status line.
set shortmess=atI             # shortens messages
set showcmd                   # display an incomplete command in statusline

set statusline=%<%f\          # custom statusline
set stl+=[%{&ff}]             # show fileformat
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P

# show tabs
set list
set listchars=tab:>-
set listchars+=trail:·
set listchars+=extends:»,precedes:«

#highlight unnecessary spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

if has('gui_running')
    set guioptions=cMg #console dialogs, do not show menu or toolbar

    if has('mac')
        set guifont=Anonymous\ Pro\:h17
    elseif has('win32')
        set guifont=Consolas:h14:cRUSSIAN
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
endif

# Avoid command-line redraw on every entered character by turning off Arabic
# shaping (which is implemented poorly).
if has('arabic')
    set noarabicshape
endif


# File type settings
# ==================

# Hot Keys
# ========

# buffer movement
nmap <leader>- :Bdelete<CR>

# open a file in the same folder
nnoremap <leader>e :e <C-R>=fnamemodify(@%, ':p:h')<CR>/

#replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

# use gg=G to indent html file
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

var plug_path = '~/.vim/autoload/plug.vim'
if empty(glob(plug_path))
  silent execute '!curl -fLo ' .. plug_path .. ' --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

plug#begin('~/.vim/bundle')

#Languages and libraries support

# Go
# Do: curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.54.1
# commands below should be run separately, otherwise you can get obscure
# output and now binaries
# Do: go install golang.org/x/tools/cmd/goimports@latest
# Do: go install golang.org/x/tools/gopls@latest

#
# Rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# rustup component add rustfmt rls rust-analysis rust-src rust-analyzer
# curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
# chmod +x ~/.local/bin/rust-analyzer

# Cpp:
# Do: sudo apt install llvm ccls
# In the project root: touch .ccls-root
g:ale_fix_on_save = 1
g:ale_lint_on_save = 1
g:ale_lint_on_insert_leave = 0
g:ale_lint_on_text_changed = 0
g:ale_linter_aliases = {'typescript.tsx': 'typescript'}
g:ale_fixers = {
         'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'],
         'go': ['goimports', 'gofmt'],
         '*': ['remove_trailing_lines', 'trim_whitespace'],
       }
g:ale_type_map = {
         'golangci-lint': {'ES': 'WS', 'E': 'W'},
       }
g:ale_go_gofmt_options = '-s'
g:ale_go_golangci_lint_package = 1
g:ale_lsp_show_message_severity = 'warning'
g:ale_sign_error = 'E'
g:ale_sign_warning = 'W'
g:ale_sign_info = 'I'
g:ale_set_highlights = 0
g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
set completeopt=menu,menuone,noinsert,noselect
Plug 'dense-analysis/ale'

nmap <C-\> :ALEFindReferences<CR>
nmap <C-]> :ALEGoToDefinition<CR>
nmap K :ALEHover<CR>
nmap <C-n> :ALEPrevious<CR>
nmap <C-m> :ALENext<CR>

autocmd Filetype go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype svelte setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

# defence against vim-svelte which enforces a different set of linters
# otherwise
autocmd BufNewFile,BufRead *.svelte b:ale_linter_aliases = ['svelte']
autocmd BufNewFile,BufRead *.svelte b:ale_linters = ['svelteserver']

# Quick search
# brew install fzf
Plug 'junegunn/fzf'
# brew install the_silver_searcher
Plug 'junegunn/fzf.vim'

map <leader>, :Ag<cr>
map <leader>t :Files<cr>
nmap + :Buffers<CR>

# disable annoying markdown folding - https://github.com/plasticboy/vim-markdown/issues/53
g:vim_markdown_folding_disabled = 1
Plug 'plasticboy/vim-markdown'

# Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


# Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
# set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

# svelte
Plug 'othree/html5.vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

g:svelte_preprocessors = ['typescript']

# Other Languages
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

# Utility plugins

# helps to repeat custom commands in vim
Plug 'tpope/vim-repeat'
# change surround pair symbols - quotes/brakets etc
Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdcommenter'
# highlight indent levels
g:indent_guides_enable_on_vim_startup = 1
Plug 'nathanaelkane/vim-indent-guides'

# Keep cwd to the root of the repo
g:rooter_silent_chdir = 1
g:rooter_cd_cmd = "lcd"
g:rooter_patterns = ['.git']
Plug 'airblade/vim-rooter'

# Visual

# Colorschemes
Plug 'junegunn/seoul256.vim'

#Misc
# close buffer while leaving windows in place
Plug 'moll/vim-bbye'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'DataWraith/auto_mkdir'
#grep integration
#without this option plugin fails on Max OS X
g:Grep_Xargs_Options = '-0'

Plug 'can3p/incbool.vim'
#internal functions to do fs work, Unlink, Move, Chmod, W etc.
Plug 'tpope/vim-eunuch'

# search and replace that keeps the register and can do other wonders
Plug 'tpope/vim-abolish'

# pretty statusbar
# https://github.com/powerline/fonts
# sudo dnf install powerline-fonts
g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline'

Plug 'junegunn/goyo.vim'

def GoyoEnter()
  nnoremap j gj
  nnoremap k gk
  set wrap linebreak nolist
enddef

def GoyoLeave()
  nnoremap gj j
  nnoremap gk k
  set nowrap
enddef

autocmd! User GoyoEnter call GoyoEnter()
autocmd! User GoyoLeave call GoyoLeave()

map <leader>g :Goyo<cr>

plug#end()

# set background= dark
colorscheme seoul256
