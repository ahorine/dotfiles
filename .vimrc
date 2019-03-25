set nocompatible

call pathogen#helptags()
call pathogen#infect()

colorscheme molokai
let g:rehash256 = 1
"colorscheme gruvbox
"set background=dark
"let g:gruvbox_termcolors=16
"let g:gruvbox_contrast_dark='hard'

syntax enable

"Plugins

"AIRLINE
set laststatus=2
"AIRLINE THEMES
"let g:airline_theme='deus'
let g:airline_theme='base16_monokai'
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
set ignorecase
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
nmap <F8> :TagbarToggle<CR>
let mapleader = ","

nnoremap <leader>. :CtrlPTag<cr>

"CTRLP mappings
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
