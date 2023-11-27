-- Organization/Productivity
return {
  -- Neorg
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
