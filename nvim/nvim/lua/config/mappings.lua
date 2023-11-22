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

-- Plugins
-- - Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fa", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true })
