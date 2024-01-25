-- Colorscheme config
require("tokyonight").setup({
  style = "night",
  lualine_bold = true,
})
vim.cmd [[colorscheme tokyonight]]

-- Add borders
local borderStyle = 'rounded'
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = borderStyle })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = borderStyle })
vim.diagnostic.config({
  float = {
    border = borderStyle,
  },
})

-- Notify
vim.notify = require("notify")

-- Lualine
require('lualine').setup({
  options = {
    theme = 'tokyonight'
  },
})

-- Bufferline
require("bufferline").setup({
  options = {
    indicator = {
      style = 'icon',
    },
    separator_style = 'slant',
    diagnostics = 'nvim_lsp',
  },
  highlights = {
    buffer_selected = {
      bold = true,
      italic = true,
    },
  },
})

-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "python", "go", "bash" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  }
}

-- Winshift
require('winshift').setup()

-- ZenMode
require('zen-mode').setup({
  window = {
    width = .85,
    height = .85,
  },
  plugins = {
    alacritty = {
      enabled = true,
      font = "20",
    },
  },
})

-- Which Key
require('which-key').setup()
