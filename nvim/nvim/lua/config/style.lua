-- Colorscheme config
require("tokyonight").setup({
  style = "night",
  lualine_bold = true,
})
vim.cmd[[colorscheme tokyonight]]

-- Set Lualine to use Tokyonight theme
require("lualine").setup({
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

-- Use nvim-notify
vim.notify = require('notify')
