-- Organization/Productivity
return {
  -- Neorg
  {
    'nvim-neorg/neorg',
    ft = 'norg',
    build = ':Neorg sync-parsers',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-cmp',
    },
    cmd = 'Neorg',
  },
}
