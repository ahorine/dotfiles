-- Mason - KEEP AT TOP
require('mason').setup()
require('mason-lspconfig').setup({
  automatic_installation = true,
})
require('mason-lspconfig').setup_handlers({
  function(server_name)
    if server_name ~= "gopls" then
      require('lspconfig')[server_name].setup({})
    end
  end,
})
-- START CONFIG

-- Copilot
-- require('copilot').setup({
--   suggestion = {
--     auto_trigger = true,
--     keymap = {
--       accept = '<leader><Tab>'
--     }
--   },
--   filetypes = {
--     ['*'] = false,
--   },
-- })

-- Codeium
require('codeium').setup({})

-- Linting
local lint = require('lint')
-- - Configure linters -- Mason to handle this
lint.linters_by_ft = {
  -- lua = { 'luacheck' },
  -- python = { 'flake8' },
  -- sh = { 'shellcheck' },
  -- vim = { 'vint' },
  -- zsh = { 'shellcheck' },
  -- markdown = { 'markdownlint' },
}
-- - Create autocommand to lint on save
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    lint.try_lint()
  end,
})
-- Stop Lua from complaining about 'vim' global.
-- lint.linters.luacheck.args = { -- This seems to be obsoleted by Mason, which relies on a .luarc.json file for rules
--   '--formatter', 'plain',
--   '--globals', 'vim',
--   '--codes',
--   '--ranges',
--   '-',
-- }
-- Add '-x' to shellcheck
lint.linters.shellcheck.args = { -- Unsure if this does anything currently
  '-x',
  '--format', 'json',
  '-',
}

-- Todo Comments
require('todo-comments').setup()

-- Scissors
local snipDir = vim.fn.stdpath('config') .. '/snippets'
require('scissors').setup({
  snippetDir = snipDir,
  jsonFormatter = 'jq',
  editSnippetPopup = {
    keymaps = {
      deleteSnippet = '<leader>sd',
    },
  },
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
    ["<CR>"] = cmp.mapping.confirm(),
  }),
  sources = {
    { name = 'nvim_lsp', keyword_length = 1 },
    { name = 'nvim_lua', keyword_length = 2 },
    { name = 'luasnip',  keyword_length = 2 },
    { name = 'neorg',    keyword_length = 2 },
    { name = 'codeium',  keyword_length = 1 },
  },
  {
    { name = 'buffer', keyword_length = 2 },
    { name = 'path' },
  },
  formatting = {
    format = require('lspkind').cmp_format({
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = '...',
      symbol_map = { Codeium = "", }
    })
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
  end,
})
cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
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
require('luasnip').setup()
require('luasnip.loaders.from_vscode').lazy_load({
  paths = {
    snipDir,
  },
})

-- LSP

-- Golang
-- - Load
require('go').setup({
  lsp_config = false,
  trouble = true,
  run_in_floaterm = true,
  floaterm = {
    title_colors = 'tokyo',
  },
  luasnip = true,
})
-- - Format on save
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
-- - Start LSP server
local cfg = require('go.lsp').config()
require('lspconfig').gopls.setup(cfg)

-- END CONFIG
-- Mason lint
require('mason-nvim-lint').setup()
