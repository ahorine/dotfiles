return {
  -- Avante
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "copilot",
    },
    config = function(_, opts)
      require("avante").setup(opts)
      -- Avante now force-disables using Copilot as the auto_suggestions_provider.
      -- We can re-enable it after loading the config by just manually setting the key.
      require("avante.config").auto_suggestions_provider = "copilot"
    end,
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
