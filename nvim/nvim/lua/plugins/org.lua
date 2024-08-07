-- Organization/Productivity
return {
  -- luarocks (for neorg)
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  -- Neorg
  {
    "nvim-neorg/neorg",
    ft = "norg",
    --build = ":Neorg sync-parsers",
    dependencies = {
      "vhyrro/luarocks.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "hrsh7th/nvim-cmp",
      "folke/zen-mode.nvim",
      -- "jmbuhr/otter.nvim",
    },
    cmd = "Neorg",
    config = function()
      -- Keymap overrides
      vim.keymap.set("i", "<leader><CR>", "<Plug>(neorg.itero.next-iteration)", {})

      -- setup
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
          -- ["core.integrations.otter"] = {}, -- Doesn't appear to be fully functional yet.
          ["core.keybinds"] = {
            config = {
              default_keybinds = true,
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
  -- CodeSnap (sharing)
  {
    "mistricky/codesnap.nvim",
    build = "make",
    cmd = "CodeSnap",
    opts = {
      code_font_family = "",
      mac_window_bar = false,
      bg_padding = 0,
      watermark = "SauceCodePro Nerd Font Mono",
    },
  },
}
