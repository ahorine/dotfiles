return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "BurntSushi/ripgrep",
    },
  },
  -- Leap
  {
    "ggandor/leap.nvim",
  },
  -- Leap-Spooky
  {
    "ggandor/leap-spooky.nvim",
    dependencies = {
      "ggandor/leap.nvim",
    },
  },
  -- Registers
  {
    "tversteeg/registers.nvim",
    name = "registers",
    keys = {
      { '"', mode = { "n", "v" } },
      { "<C-R>", mode = "i" },
    },
    cmd = "Registers",
  },
  -- Marks
  {
    "chentoast/marks.nvim",
  },
  -- Buffer Manager
  {
    "j-morano/buffer_manager.nvim",
  },
  -- Better Quickfix
  {
    "kevinhwang91/nvim-bqf",
  },
}
