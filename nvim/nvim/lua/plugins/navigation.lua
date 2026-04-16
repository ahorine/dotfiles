return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    -- tag = '*',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "BurntSushi/ripgrep",
      "rcarriga/nvim-notify",
      "folke/which-key.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    lazy = false,
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
          "%.git",
        },
      },
    },
    keys = {
      { "<leader>f", "", desc = "+Telescope" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
      { "<leader>fa", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find File (+hidden)" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>fn", "<cmd>Telescope notify<cr>", desc = "Notifications" },
    },
  },
  -- Flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
    },
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
  -- Precognition
  {
    "tris203/precognition.nvim",
    enabled = false,
    opts = {},
    event = "BufReadPre",
  },
  -- Registers
  {
    "tversteeg/registers.nvim",
    name = "registers",
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
    opts = {},
    event = "VeryLazy",
  },
  -- Buffer List
  {
    "EL-MASTOR/bufferlist.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
    cmd = "BufferList",
    keys = { { "<Leader>b", ":BufferList<CR>", desc = "Open bufferlist" } },
  },
  -- Buffer Manager
  -- {
  --   "j-morano/buffer_manager.nvim",
  --   config = function()
  --     vim.api.nvim_set_hl(0, "BufferManagerModified", { fg = "#af0000" })
  --   end,
  --   keys = {
  --     {
  --       "<leader>b",
  --       function()
  --         require("buffer_manager.ui").toggle_quick_menu()
  --       end,
  --       desc = "Buffer Manager",
  --     },
  --   },
  -- },
  -- Better Quickfix
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    opts = {},
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<leader>or"] = "actions.refresh",
        ["<leader>os"] = "actions.select_split",
      },
    },
    keys = {
      {
        "-",
        "<CMD>Oil<CR>",
        desc = "[Oil] Open parent directory",
      },
    },
  },
}
