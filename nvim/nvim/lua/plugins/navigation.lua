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
  -- Registers
  {
    "tversteeg/registers.nvim",
    name = "registers",
    keys = {
      { "\"",    mode = { "n", "v" } },
      { "<C-R>", mode = "i" }
    },
    cmd = "Registers",
  },
  -- Session management
  -- - autosession
  {
    'pysan3/autosession.nvim',
    event = { 'VeryLazy' },
  },
}
