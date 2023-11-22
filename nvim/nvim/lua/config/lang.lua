-- TODO: Helm LSP

-- Copilot
require('copilot').setup({
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = '<leader><Tab>'
    }
  },
  filetypes = {
    ['*'] = true,
  },
})

-- Linting
local lint = require('lint')
-- - Configure linters
lint.linters_by_ft = {
  go = { 'golangcilint' },
  lua = { 'luacheck' },
  python = { 'flake8' },
  sh = { 'shellcheck' },
  vim = { 'vint' },
  zsh = { 'zsh', 'shellcheck' },
}
-- - Create autocommand to lint on save
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    lint.try_lint()
  end,
})

-- cmp + LuaSnips
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<tab>"] = cmp.mapping.select_next_item(),
    ["<s-tab>"] = cmp.mapping.select_prev_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
  },{
    { name = 'buffer' },
    { name = 'path' },
  },
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

-- Golang
-- - Load
require('go').setup()
-- - Format on save
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
