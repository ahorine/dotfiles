-- Version control plugins
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = true,
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
