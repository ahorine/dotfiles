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
        wk.register({
          ["]c"] = {
            function()
              if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
              else
                gs.nav_hunk("next")
              end
            end,
            "Next Hunk",
          },
          ["[c"] = {
            function()
              if vim.wo.diff then
                vim.cmd.normal({ "[c", bang = true })
              else
                gs.nav_hunk("prev")
              end
            end,
            "Prev Hunk",
          },
          ["<leader>"] = {
            h = {
              name = "+Gitsigns",
              s = { gs.stage_hunk, "Stage Hunk" },
              r = { gs.reset_hunk, "Reset Hunk" },
              S = { gs.stage_buffer, "Stage Buffer" },
              u = { gs.undo_stage_hunk, "Undo Stage Hunk" },
              R = { gs.reset_buffer, "Reset Buffer" },
              p = { gs.preview_hunk, "Preview Hunk" },
              b = {
                function()
                  gs.blame_line({ full = true })
                end,
                "Blame Line",
              },
              D = {
                function()
                  gs.diffthis("~")
                end,
                "Diff This",
              },
              t = {
                name = "+Toggles",
                b = { gs.toggle_current_line_blame, "Toggle Line Blame" },
                d = { gs.toggle_deleted, "Toggle Deleted" },
              },
            },
          },
        }, { buffer = bufnr })
        -- Visual
        wk.register({
          ["<leader>"] = {
            h = {
              name = "+Gitsigns",
              s = {
                function()
                  gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end,
                "Stage Hunk",
              },
              r = {
                function()
                  gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end,
                "Reset Hunk",
              },
            },
          },
        }, { buffer = bufnr, mode = "v" })
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
