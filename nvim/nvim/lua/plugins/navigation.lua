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
    opts = {
      pickers = {
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "vendor",
          ".git",
        },
      },
    },
  },
  -- Flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  -- Registers
  {
    "tversteeg/registers.nvim",
    name = "registers",
    lazy = true,
    opts = {
      window = {
        border = "rounded",
      },
    },
    keys = {
      { '"', mode = { "n", "v" } },
      { "<C-R>", mode = "i" },
    },
    cmd = "Registers",
  },
  -- Marks
  {
    "chentoast/marks.nvim",
    config = true,
    event = "VeryLazy",
  },
  -- Buffer Manager
  {
    "j-morano/buffer_manager.nvim",
    lazy = true,
    config = function()
      vim.api.nvim_set_hl(0, "BufferManagerModified", { fg = "#af0000" })
    end,
    keys = {
      {
        "<leader>b",
        function()
          require("buffer_manager.ui").toggle_quick_menu()
        end,
        desc = "Buffer Manager",
      },
    },
  },
  -- Better Quickfix
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    config = true,
  },
}
