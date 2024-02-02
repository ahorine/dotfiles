-- Language Plugins
return {
  -- Mason
  {
    'williamboman/mason.nvim'
  },
  -- Mason LSP Config
  {
    'williamboman/mason-lspconfig.nvim',
  },
  -- Mason Lint Config
  {
    'rshkarin/mason-nvim-lint',
  },
  -- LSP Config
  {
    'neovim/nvim-lspconfig',
  },
  -- LSP Kind
  {
    'onsails/lspkind.nvim',
  },
  -- LSP Signature
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
  },
  -- Linting
  {
    'mfussenegger/nvim-lint',
  },
  -- Todo Comments
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  -- Copilot
  -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = 'Copilot',
  --   event = 'InsertEnter',
  -- },
  -- Codeium
  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
  },
  -- Golang
  {
    'ray-x/go.nvim',
    dependencies = {
      {
        'ray-x/guihua.lua',
        build = 'cd lua/fzy && make',
      },
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
  -- Navigator
  {
    'ray-x/navigator.lua',
    dependencies = {
      {
        'ray-x/guihua.lua',
        build = 'cd lua/fzy && make',
      },
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
      'ray-x/lsp_signature.nvim',
    },
  },
  -- LuaSnips
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
  },
  -- Scissors
  {
    'chrisgrieser/nvim-scissors',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },
  -- cmp
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },
  },
  -- Markdown Previewing
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
