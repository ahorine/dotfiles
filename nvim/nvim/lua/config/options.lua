local undodir = vim.fn.stdpath('data') .. '/undo'

-- General options
vim.opt.mouse = ''
vim.opt.syntax = 'on'
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.updatetime = 250
vim.opt.hidden = true
vim.opt.scrolloff = 5
-- vim.opt.sidescrolloff = 5
vim.opt.backspace = 'indent,eol,start'
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.history = 1000
vim.opt.undolevels = 1000
vim.opt.undofile = true
vim.opt.undodir = undodir
vim.opt.wildmenu = true
vim.opt.wildignore = '*.o,*~,*.pyc,*.swp,*.class,*.DS_Store,*.git,node_modules'
vim.opt.title = true
vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Global options
vim.g.mapleader = ','
