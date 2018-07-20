set nocompatible

call pathogen#helptags()
call pathogen#infect()

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

syntax enable

"Plugins

"AIRLINE
set laststatus=2
"AIRLINE THEMES
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enables=1
let g:airline#extensions#tabline#fnamemod=':t'

"General settings
set updatetime=1000
set hidden
set scrolloff=5
set backspace=indent,eol,start
set copyindent
set number
set showmatch
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildmenu
set wildignore=*.swp,*.bak.*.pyc,*.class
set title
set visualbell
set noerrorbells
set mouse=a

"mappings
nnoremap ; :
inoremap jk <Esc>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <Space> :noh<cr>
let mapleader = ","
