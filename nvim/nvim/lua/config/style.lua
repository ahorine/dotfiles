-- Colorscheme config
require("tokyonight").setup({
  style = "night",
  lualine_bold = true,
})
vim.cmd [[colorscheme tokyonight]]

-- Lualine
require('lualine').setup({
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
    },
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

-- Noice
require('noice').setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    long_message_to_split = true,
    lsp_doc_border = true,
  },
  cmdline = {
    view = "cmdline",
  },
})

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
