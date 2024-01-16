local map = vim.keymap.set
local wk = require('which-key')
-- General mappings
map("n", ";", ":", { noremap = true })
map("i", "jk", "<ESC>", { noremap = true })
-- Changing panes
map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-j>", "<C-w>j", { noremap = true })
map("n", "<C-k>", "<C-w>k", { noremap = true })
map("n", "<C-l>", "<C-w>l", { noremap = true })
-- Clear search highlights
wk.register({
  ['<space><space>'] = { ':nohlsearch<CR>', 'Clear highlights' },
})
-- OS clipboard macros
-- Normal
wk.register({
  y = { '"+y', 'Yank to OS clipboard' },
  yy = { '"+yy', 'Yank line to OS clipboard' },
  Y = { '"+yg_', 'Yank to end of line to OS clipboard' },
  p = { '"+p', 'Paste from OS clipboard' },
  P = { '"+P', 'Paste from OS clipboard behind cursor' },
}, { prefix = '<leader>' })
-- Visual
wk.register({
  y = { '"+y', 'Yank selection to OS clipboard' },
  p = { '"+p', 'Paste to selection from OS clipboard' },
  P = { '"+P', 'Paste to selection from OS clipboard' }, -- ??
}, {
  mode = 'v',
  prefix = '<leader>',
})

-- Plugins
-- - Telescope
wk.register({
  f = {
    name = '+Telescope',
    f = { '<cmd>Telescope find_files<cr>', 'Find file' },
    a = { '<cmd>Telescope find_files hidden=true<cr>', 'Find file (+hidden)' },
    g = { '<cmd>Telescope live_grep<cr>', 'Live grep' },
    b = { '<cmd>Telescope buffers<cr>', 'Find buffer' },
    h = { '<cmd>Telescope help_tags<cr>', 'Help tags' },
    n = { '<cmd>Telescope notify<cr>', 'Notifications' },
  },
}, { prefix = '<leader>' })
-- - Winshift
map("n", "<C-w><C-m>", "<cmd>WinShift<cr>", { noremap = true })
-- - LuaSnip
map("i", "<C-K>", "<cmd>lua require('luasnip').expand()<cr>", { silent = true })
map("i", "<C-L>", "<cmd>lua require('luasnip').jump(1)<cr>", { silent = true })
map("i", "<C-H>", "<cmd>lua require('luasnip').jump(-1)<cr>", { silent = true })
-- - Scissors
wk.register({
  s = {
    name = 'Scissors',
    e = { function() require('scissors').editSnippet() end, 'Edit snippet', },
    a = { function() require('scissors').addNewSnippet() end, 'Add snippet', mode = { 'n', 'x' }, },
  },
}, { prefix = '<leader>' })
-- - Venn
function _G.Toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == "nil" then
    vim.b.venn_enabled = true
    vim.cmd [[setlocal ve=all]]
    -- draw a line on HJKL keystokes
    vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
    -- draw a box by pressing "f" with visual selection
    vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
  else
    vim.cmd [[setlocal ve=]]
    vim.cmd [[mapclear <buffer>]]
    vim.b.venn_enabled = nil
  end
end

-- toggle keymappings for venn using <leader>v
wk.register({
  ['<leader>v'] = { '<cmd>lua Toggle_venn()<cr>', 'Toggle Venn mode' },
})
-- Buffer manager
wk.register({
  ['<leader>b'] = { require('buffer_manager.ui').toggle_quick_menu, 'Buffer manager' },
})

-- - LSP
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
wk.register({
  d = {
    name = '+Diagnostics',
    e = { vim.diagnostic.open_float, "Open diagnostics in a float" },
    q = { vim.diagnostic.setloclist, "Open diagnostics in quickfix list" },
    n = { vim.diagnostic.goto_next, "Jump to next diagnostic" },
    N = { vim.diagnostic.goto_prev, "Jump to previous diagnostic" },
  },
}, { prefix = '<leader>' })
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    wk.register({
      g = {
        name = '+Goto...',
        d = { vim.lsp.buf.definition, 'Goto definition' },
        D = { vim.lsp.buf.declaration, 'Goto declaration' },
        i = { vim.lsp.buf.implementation, 'Goto implementation' },
        t = { vim.lsp.buf.type_definition, 'Goto type definition' },
        r = { vim.lsp.buf.references, 'Goto references' },
      },
      l = {
        name = '+LSP actions',
        r = { vim.lsp.buf.rename, 'Rename' },
        a = { vim.lsp.buf.code_action, 'Code action' },
        h = { vim.lsp.buf.hover, 'Hover' },
        f = { function() vim.lsp.buf.format { async = true } end, 'Format' },
      },
    }, {
      prefix = '<leader>',
      buffer = ev.buf,
    })
  end,
})
