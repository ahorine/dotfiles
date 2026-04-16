return {
  -- Avante
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
      disabled_tools = { "git_commit" },
      provider = "copilot",
      providers = {
        copilot = {
          model = "claude-opus-4.6",
        },
      },
    },
    keys = {
      { "<leader>a", "", desc = "+Avante" },
      --  { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "avante: ask" },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- Copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   opts = {
  --     suggestion = {
  --       auto_trigger = true,
  --     },
  --     filetypes = {
  --       yaml = true,
  --       markdown = true,
  --       gitcommit = true,
  --     },
  --   },
  --   cmd = { "Copilot" },
  --   event = { "InsertEnter" },
  -- },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "canary",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" },
  --     { "nvim-lua/plenary.nvim" },
  --   },
  --   build = "make tiktoken",
  --   event = "VeryLazy",
  --   config = function()
  --     require("CopilotChat.integrations.cmp").setup()
  --     require("CopilotChat").setup({
  --       mappings = {
  --         complete = {
  --           insert = "",
  --         },
  --         reset = {
  --           normal = "<C-n>",
  --           insert = "",
  --         },
  --       },
  --     })
  --   end,
  -- },
}
