return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local map = vim.keymap.set
      local wk = require("which-key")
      -- General mappings
      map("n", ";", ":", { noremap = true })
      map("i", "jk", "<ESC>", { noremap = true })
      -- Changing panes
      map("n", "<C-h>", "<C-w>h", { noremap = true })
      map("n", "<C-j>", "<C-w>j", { noremap = true })
      map("n", "<C-k>", "<C-w>k", { noremap = true })
      map("n", "<C-l>", "<C-w>l", { noremap = true })
      -- Clear search highlights
      wk.add({
        { "<space><space>", ":nohlsearch<CR>", desc = "Clear highlights" },
      })
      -- OS clipboard macros
      -- Normal
      wk.add({
        { "<leader>y", '"+y', desc = "Yank to OS clipboard" },
        { "<leader>yy", '"+yy', desc = "Yank line to OS clipboard" },
        { "<leader>Y", '"+yg_', desc = "Yank to end of line to OS clipboard" },
        { "<leader>p", '"+p', desc = "Paste from OS clipboard" },
        { "<leader>P", '"+P', desc = "Paste from OS clipboard behind cursor" },
      })
      -- Visual
      wk.add({
        { "<leader>y", '"+y', mode = "v", desc = "Yank selection to OS clipboard" },
        { "<leader>p", '"+p', mode = "v", desc = "Paste to selection from OS clipboard" },
        { "<leader>P", '"+P', mode = "v", desc = "Paste to selection from OS clipboard" }, -- ??
      })

      -- Plugins
      map("i", "<C-K>", "<cmd>lua require('luasnip').expand()<cr>", { silent = true })
      map("i", "<C-L>", "<cmd>lua require('luasnip').jump(1)<cr>", { silent = true })
      map("i", "<C-H>", "<cmd>lua require('luasnip').jump(-1)<cr>", { silent = true })
      -- - Scissors
      wk.add({
        { "<leader>s", group = "Scissors" },
        {
          "<leader>se",
          function()
            require("scissors").editSnippet()
          end,
          desc = "Edit snippet",
        },
        {
          "<leader>sa",
          function()
            require("scissors").addNewSnippet()
          end,
          desc = "Add snippet",
          mode = { "n", "x" },
        },
      })

      -- Neorg
      wk.add({
        {
          "<space>t",
          function()
            local lastMonday = os.date("%Y-%m-%d", os.time() - (math.max(os.date("%w") - 1, 0)) * 86400)
            vim.notify("Last Monday: " .. lastMonday, vim.log.levels.DEBUG, { title = "Neorg" })
            vim.cmd("Neorg journal custom " .. lastMonday)
          end,
          desc = "Open weekly task journal",
        },
      })
    end,
  },
}
