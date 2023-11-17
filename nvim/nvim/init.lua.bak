-- vimtex (set before the plugin loads)
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_view_method = 'skim'

-- Load VimL config
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- Colors
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true, },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})
vim.opt.termguicolors = true
vim.cmd[[colorscheme tokyonight-night]]

require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "help", "query", "python", "go", "bash" },
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
    disable = { "latex" },
  },
}

-- disable mouse
vim.opt.mouse = ""

-- Ignore files for telescope
require('telescope').setup{
  pickers = {
    live_grep = {
      additional_args = function(opts)
        return {"--hidden"}
      end
    }
  },
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "vendor",
      ".git",
    }
  }
}

-- Bufferline
require('bufferline').setup{
  options = {
    indicator = {
      style = 'icon',
    },
    separator_style = 'slant',
    diagnostics = 'nvim_lsp',
    --numbers = function(opts)
    --  return string.format('%s', opts.id)
    --end,
  },
  highlights = {
    buffer_selected = {
      bold = true,
      italic = true,
    },
  },
}

-- Use nvim-notify
vim.notify = require("notify")

-- Setup leap
require('leap').add_default_mappings()

local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

if not configs.helm_ls then
  configs.helm_ls = {
    default_config = {
      cmd = {"helm_ls", "serve"},
      filetypes = {'helm'},
      root_dir = function(fname)
        return util.root_pattern('Chart.yaml')(fname)
      end,
    },
  }
end

lspconfig.helm_ls.setup {
  filetypes = {"helm"},
  cmd = {"helm_ls", "serve"},
}

-- copilot
-- use <leader>tab to accept suggestion
vim.cmd[[imap <silent><script><expr> <leader><Tab> copilot#Accept("\<CR>")]]
-- no tab map
vim.g.copilot_no_tab_map = true
-- filetypes
vim.g.copilot_filetypes = {
  ['yaml'] = true,
}
-- styleguide
vim.g.copilot_styleguide = 1
vim.g.copilot_go_styleguide = 'googlestyleguide'
vim.g.copilot_golang_styleguide = 'googlestyleguide'

require('colorizer').setup()
