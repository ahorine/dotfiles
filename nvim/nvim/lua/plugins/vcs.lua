-- Version control plugins
return {
  {
    'lewis6991/gitsigns.nvim',
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
  -- {
  --   'tpope/vim-fugitive',
  -- },
}
