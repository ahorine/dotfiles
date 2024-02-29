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
      lazy = true,
    },
  },
  -- - notify
  {
    "rcarriga/nvim-notify",
  },
  -- - bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  -- - Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdateSync",
  },
  -- - Traces
  {
    "markonm/traces.vim",
  },
  -- - Trouble
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  -- - Winshift
  {
    "sindrets/winshift.nvim",
  },
  -- - ZenMode
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 0.5,
        height = 0.85,
      },
      plugins = {
        alacritty = {
          enabled = true,
          font = "30",
        },
      },
    },
    cmd = "ZenMode",
  },
  -- - numbertoggle
  {
    "sitiom/nvim-numbertoggle",
  },
  -- - Which-Key
  {
    "folke/which-key.nvim",
  },
}
