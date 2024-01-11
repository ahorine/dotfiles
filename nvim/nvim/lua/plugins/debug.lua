-- All things debugging related
return {
  -- DAP plugins
  -- - DAP
  {
    'mfussenegger/nvim-dap',
  },
  -- - DAP-UI
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'folke/neodev.nvim',
      'theHamsta/nvim-dap-virtual-text',
    },
  },
}
