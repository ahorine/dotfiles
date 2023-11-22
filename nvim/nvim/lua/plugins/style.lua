-- UI/Styling plugins
return {
  -- Colors
  -- - Tokyonight
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- UI
  -- - Lualine
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      lazy = true
    },
  },
  -- - notify
  {
    'rcarriga/nvim-notify',
  },
  -- - bufferline
  {
    'akinsho/bufferline.nvim', version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  -- - Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
  },
  -- - Whichkey
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
  },
}
