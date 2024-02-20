-- Mason - KEEP AT TOP
require("mason").setup()
require("mason-lspconfig").setup({})
require("mason-tool-installer").setup({
  ensure_installed = {
    "luacheck",
    "nilaway",
    "staticcheck",
    "checkmake",
    "flake8",
    "shellcheck",
    "markdownlint",
    "bash-language-server",
    "bash-debug-adapter",
    "beautysh",
    "shellharden",
    "jq",
  },
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Codeium
require("codeium").setup({})

-- Linting
local lint = require("lint")
-- - Configure linters
lint.linters_by_ft = {
  lua = { "luacheck" },
  go = { "staticcheck" },
  make = { "checkmake" },
  python = { "flake8" },
  sh = { "shellcheck" },
  zsh = { "shellcheck" },
  markdown = { "markdownlint" },
}
-- - Create autocommand to lint on CursorHold
autocmd("CursorHold", {
  callback = function()
    lint.try_lint()
  end,
})
-- Add '-x' to shellcheck
lint.linters.shellcheck.args = {
  "-x",
  "--format",
  "json",
  "-",
}

-- Formatting
local ft_formatters = {
  lua = { require("formatter.filetypes.lua").stylua },
  sh = {
    require("formatter.filetypes.sh").shfmt,
    {
      exe = "shellharden",
      args = { "--replace" },
    },
  },
  zsh = { require("formatter.filetypes.zsh").beautysh },
  ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
}
require("formatter").setup({
  filetype = ft_formatters,
})
local afg = augroup("__formatter__", { clear = false })
autocmd("BufWritePost", {
  group = afg,
  callback = function()
    local ft = vim.bo.filetype
    -- If it's a go file, skip it
    if ft == "go" then
      return
    end
    -- If a formatter is configured, use it, otherwise run lsp format.
    if ft_formatters[ft] then
      vim.cmd("FormatWriteLock")
    else
      -- Run the LSP formatter (if an LS is running)
      if #vim.lsp.buf_get_clients() ~= 0 then
        vim.lsp.buf.format()
      end
    end
  end,
})

-- Todo Comments
require("todo-comments").setup()

-- Scissors
local snipDir = vim.fn.stdpath("config") .. "/snippets"
require("scissors").setup({
  snippetDir = snipDir,
  jsonFormatter = "jq",
  editSnippetPopup = {
    keymaps = {
      deleteSnippet = "<leader>sd",
    },
  },
})
-- cmp + LuaSnips
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
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
    { name = "nvim_lsp", keyword_length = 1 },
    { name = "nvim_lua", keyword_length = 2 },
    { name = "luasnip", keyword_length = 2 },
    { name = "neorg", keyword_length = 2 },
    { name = "codeium", keyword_length = 1 },
  },
  {
    { name = "buffer", keyword_length = 2 },
    { name = "path" },
  },
  formatting = {
    format = require("lspkind").cmp_format({
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = "...",
      symbol_map = { Codeium = "" },
    }),
  },
  window = {
    documentation = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered(),
  },
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
  end,
})
cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap", keyword_length = 1 },
  },
})
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})
require("luasnip").setup()
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
  paths = {
    snipDir,
  },
})

-- LSP
require("lspconfig.ui.windows").default_options = {
  border = "rounded",
}

-- LSP Signature
require("lsp_signature").setup({
  bind = true,
  handler_opts = {
    border = "rounded",
  },
})

-- Golang
-- - Load
require("go").setup({
  lsp_config = false,
  lsp_keymaps = false,
  lsp_gofumpt = true,
  max_line_len = 99,
  trouble = true,
  run_in_floaterm = true,
  floaterm = {
    title_colors = "tokyo",
  },
  luasnip = true,
})
-- - Format on save
local format_sync_grp = augroup("GoFormat", {})
autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = format_sync_grp,
})

-- Navigator
require("navigator").setup({
  mason = true,
  border = "single",
  -- TODO: Update all the icons to use good ones instead of emojis
  keymaps = {
    { key = "<space>k", func = vim.lsp.buf.signature_help, desc = "signature_help" },
  },
  -- TODO: Hook on_attach and update descriptions via which-key for all the mappings
  -- on_attach = function(client, bufnr)
  -- end,
  lsp = {
    gopls = function()
      local cfg = require("go.lsp").config()
      return cfg
    end,
    format_on_save = false, -- Handled by __formatter__ autocmd
  },
})
-- TODO: Switch to autocmd
vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")
