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
-- Copy to OS clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>Y", '"+yg_', { noremap = true })
vim.keymap.set("n", "<leader>yy", '"+yy', { noremap = true })
-- Paste from OS clipboard
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true })
vim.keymap.set("n", "<leader>P", '"+P', { noremap = true })
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true })
vim.keymap.set("v", "<leader>P", '"+P', { noremap = true })

-- Plugins
-- - Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fa", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>", {
  noremap = true,
})
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope persisted<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify<cr>", { noremap = true })
