-- UI/Styling plugins
return {
  -- Colors
  -- - Tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        lualine_bold = true,
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- UI
  -- - Lualine
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  -- - notify
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      vim.notify = require("notify")
    end,
  },
  -- - bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
      options = {
        indicator = {
          style = "icon",
        },
        separator_style = "slant",
        diagnostics = "nvim_lsp",
      },
      highlights = {
        buffer_selected = {
          bold = true,
          italic = true,
        },
      },
    },
  },
  -- - Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "go", "bash" },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
      })
    end,
  },
  -- - Traces
  {
    "markonm/traces.vim",
    event = "CmdlineEnter",
  },
  -- - Trouble
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
    keys = {
      { "<leader>t", desc = "+Trouble" },
      { "<leader>tt", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
      { "<leader>to", "<cmd>Trouble<cr>", desc = "Open Trouble" },
      { "<leader>tc", "<cmd>TroubleClose<cr>", desc = "Close Trouble" },
      { "<leader>tr", "<cmd>TroubleRefresh<cr>", desc = "Refresh Trouble" },
    },
  },
  -- - Winshift
  {
    "sindrets/winshift.nvim",
    --config = true,
    keys = {
      { "<C-w><C-m>", "<cmd>WinShift<cr>", desc = "WinShift" },
    },
  },
  -- - ZenMode
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 0.9,
        height = 0.9,
      },
      plugins = {
        alacritty = {
          enabled = true,
          font = "20",
        },
      },
    },
    cmd = "ZenMode",
  },
  -- - numbertoggle
  {
    "sitiom/nvim-numbertoggle",
  },
}
