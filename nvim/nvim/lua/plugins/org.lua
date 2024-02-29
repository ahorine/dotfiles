-- Organization/Productivity
return {
  -- Neorg
  {
    "nvim-neorg/neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-cmp",
      "folke/zen-mode.nvim",
    },
    cmd = "Neorg",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              icon_preset = "diamond",
            },
          },
          ["core.qol.toc"] = {
            config = {
              close_after_use = true,
            },
          },
          ["core.export"] = {},
          ["core.export.markdown"] = {
            config = {
              extensions = "all",
            },
          },
          ["core.summary"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                home = "~/notes/home",
                work = "~/notes/work",
              },
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.integrations.nvim-cmp"] = {},
          ["core.keybinds"] = {
            config = {
              default_keybinds = true,
              hook = function(keybinds)
                -- "<M-CR>", "core.itero.next-iteration", "<CR>", opts = { desc = "[neorg] Continue Object" }
                keybinds.remap_key("norg", "i", "<M-CR>", "<leader><CR>")
              end,
            },
          },
          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode",
            },
          },
        },
      })
      -- Mask characters by default
      vim.wo.conceallevel = 2
    end,
  },
  -- Venn
  {
    "jbyuki/venn.nvim",
  },
}
