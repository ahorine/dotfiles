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
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  -- - Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
  },
  -- - Traces
  {
    'markonm/traces.vim',
  },
  -- - Trouble
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  -- - Noice
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  -- - Winshift
  {
    'sindrets/winshift.nvim',
  },
  -- - ZenMode
  {
    'folke/zen-mode.nvim',
  },
  -- - numbertoggle
  {
    'sitiom/nvim-numbertoggle',
  },
  -- - Which-Key
  {
    'folke/which-key.nvim',
  },
}
