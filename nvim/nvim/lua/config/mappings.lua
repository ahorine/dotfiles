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
-- - Winshift
vim.keymap.set("n", "<C-w><C-m>", "<cmd>WinShift<cr>", { noremap = true })
-- - LuaSnip
vim.keymap.set("i", "<C-K>", "<cmd>lua require('luasnip').expand()<cr>", { silent = true })
vim.keymap.set("i", "<C-L>", "<cmd>lua require('luasnip').jump(1)<cr>", { silent = true })
vim.keymap.set("i", "<C-H>", "<cmd>lua require('luasnip').jump(-1)<cr>", { silent = true })
-- - Venn
function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
