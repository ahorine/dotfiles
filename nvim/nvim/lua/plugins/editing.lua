return {
  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      local surround = require("nvim-surround")
      local config = require("nvim-surround.config")
      -- Reverse the default left/right grouping symbol behavior
      surround.setup({
        surrounds = {
          [")"] = {
            add = { "( ", " )" },
            find = function()
              return config.get_selection({ motion = "a(" })
            end,
            delete = "^(. ?)().-( ?.)()$",
          },
          ["("] = {
            add = { "(", ")" },
            find = function()
              return config.get_selection({ motion = "a)" })
            end,
            delete = "^(.)().-(.)()$",
          },
          ["}"] = {
            add = { "{ ", " }" },
            find = function()
              return config.get_selection({ motion = "a{" })
            end,
            delete = "^(. ?)().-( ?.)()$",
          },
          ["{"] = {
            add = { "{", "}" },
            find = function()
              return config.get_selection({ motion = "a}" })
            end,
            delete = "^(.)().-(.)()$",
          },
          [">"] = {
            add = { "< ", " >" },
            find = function()
              return config.get_selection({ motion = "a<" })
            end,
            delete = "^(. ?)().-( ?.)()$",
          },
          ["<"] = {
            add = { "<", ">" },
            find = function()
              return config.get_selection({ motion = "a>" })
            end,
            delete = "^(.)().-(.)()$",
          },
          ["]"] = {
            add = { "[ ", " ]" },
            find = function()
              return config.get_selection({ motion = "a[" })
            end,
            delete = "^(. ?)().-( ?.)()$",
          },
          ["["] = {
            add = { "[", "]" },
            find = function()
              return config.get_selection({ motion = "a]" })
            end,
            delete = "^(.)().-(.)()$",
          },
        },
      })
    end,
  },
  -- Surround UI
  {
    "roobert/surround-ui.nvim",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    config = function()
      require("surround-ui").setup({
        root_key = "S",
      })
    end,
    event = "VeryLazy",
  },
  -- Remote
  {
    "inhesrom/remote-ssh.nvim",
    branch = "master",
    dependencies = {
      "inhesrom/telescope-remote-buffer",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("telescope-remote-buffer").setup()
      require("remote-ssh").setup({
        async_write_opts = {
          autosave = false,
        },
      })
    end,
  },
}
