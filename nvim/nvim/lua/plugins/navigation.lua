return {
  -- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
      'BurntSushi/ripgrep',
    }
  },
  -- Leap
  {
    'ggandor/leap.nvim',
  },
}
