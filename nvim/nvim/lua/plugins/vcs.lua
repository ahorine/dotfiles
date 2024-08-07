-- Version control plugins
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local wk = require("which-key")
        -- Normal
        wk.add({
          buffer = bufnr,
          {
            "]c",
            function()
              if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
              else
                gs.nav_hunk("next")
              end
            end,
            desc = "Next Hunk",
          },
          {
            "[c",
            function()
              if vim.wo.diff then
                vim.cmd.normal({ "[c", bang = true })
              else
                gs.nav_hunk("prev")
              end
            end,
            desc = "Prev Hunk",
          },
          {
            "<leader>h",
            group = "+Gitsigns",
            { "<leader>hs", gs.stage_hunk, desc = "Stage Hunk" },
            { "<leader>hr", gs.reset_hunk, desc = "Reset Hunk" },
            { "<leader>hS", gs.stage_buffer, desc = "Stage Buffer" },
            { "<leader>hu", gs.undo_stage_hunk, desc = "Undo Stage Hunk" },
            { "<leader>hR", gs.reset_buffer, desc = "Reset Buffer" },
            { "<leader>hp", gs.preview_hunk, desc = "Preview Hunk" },
            {
              "<leader>hb",
              function()
                gs.blame_line({ full = true })
              end,
              desc = "Blame Line",
            },
            {
              "<leader>hD",
              function()
                gs.diffthis("~")
              end,
              desc = "Diff This",
            },
            {
              "<leader>ht",
              group = "+Toggles",
              { "<leader>htb", gs.toggle_current_line_blame, desc = "Toggle Line Blame" },
              { "<leader>htd", gs.toggle_deleted, desc = "Toggle Deleted" },
            },
          },
        })
        -- Visual
        wk.add({
          {
            "<leader>h",
            group = "+Gitsigns",
            buffer = bufnr,
            mode = "v",
            {
              "<leader>hs",
              function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
              end,
              desc = "Stage Hunk",
            },
            {
              "<leader>hr",
              function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
              end,
              desc = "Reset Hunk",
            },
          },
        })
      end,
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    config = true,
  },
}
