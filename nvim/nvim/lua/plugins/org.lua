-- - Venn
function _G.Toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == "nil" then
    vim.b.venn_enabled = true
    vim.cmd([[setlocal ve=all]])
    -- draw a line on HJKL keystokes
    vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
    -- draw a box by pressing "f" with visual selection
    vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
  else
    vim.cmd([[setlocal ve=]])
    vim.cmd([[mapclear <buffer>]])
    vim.b.venn_enabled = nil
  end
end

-- Organization/Productivity
return {
  -- luarocks (for neorg)
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1000,
  --   opts = {},
  -- },
  -- Neorg
  {
    "nvim-neorg/neorg",
    ft = "norg",
    dependencies = {
      -- "vhyrro/luarocks.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "hrsh7th/nvim-cmp",
      "folke/zen-mode.nvim",
      -- "jmbuhr/otter.nvim",
    },
    cmd = "Neorg",
    keys = {
      { "<leader>n", "", desc = "+Neorg" },
      { "<leader>nw", "<cmd>Neorg workspace work<cr>", desc = "Workspace Work" },
      { "<leader>nr", "dG<cmd>Neorg generate-workspace-summary<cr>", desc = "Reindex Workspace" },
    },
    config = function()
      -- Keymap overrides
      vim.keymap.set("i", "<leader><CR>", "<Plug>(neorg.itero.next-iteration)", {})

      -- setup
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.journal"] = {
            config = {
              workspace = "work",
              strategy = "flat",
              use_template = true,
            },
          },
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
    keys = {
      { "<leader>v", "<cmd>lua Toggle_venn()<cr>", desc = "Toggle Venn mode" },
    },
  },
  -- CodeSnap (sharing)
  {
    "mistricky/codesnap.nvim",
    cmd = "CodeSnap",
    opts = {
      show_line_number = true,
      code_config = {
        font_family = "SauceCodePro Nerd Font Mono",
        breadcumbs = {
          font_family = "SauceCodePro Nerd Font Mono",
        },
      },
      snapshot_config = {
        -- themes_folders = {
        --   "~/.config/codesnap/themes",
        -- },
        -- theme = "~/.config/codesnap/themes/tokyonight_night.tmTheme",
        -- theme = "tokyonight@https://github.com/folke/tokyonight.nvim/blob/5da1b76e64daf4c5d410f06bcb6b9cb640da7dfd/extras/sublime/tokyonight_night.tmTheme",
        -- theme = "vercel@https://raw.githubusercontent.com/Railly/one-hunter-vscode/refs/heads/main/themes/OneHunter-Vercel-color-theme.json",
        window = {
          mac_window_bar = false,
          margin = {
            x = 0,
            y = 0,
          },
        },
      },
    },
  },
}
