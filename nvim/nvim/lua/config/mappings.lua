-- General mappings
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
-- Changing panes
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
-- Clear search highlights
vim.keymap.set("n", "<space>", ":nohlsearch<CR>", { noremap = true })
