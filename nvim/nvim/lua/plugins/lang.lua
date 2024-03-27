-- Language Plugins
return {
  -- Mason
  {
    "williamboman/mason.nvim",
    config = true,
    event = "VeryLazy",
  },
  -- Mason LSP Config
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = true,
    event = "VeryLazy",
  },
  -- Mason Tool Installer
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "luacheck",
        "nilaway",
        "staticcheck",
        "checkmake",
        "flake8",
        "shellcheck",
        "markdownlint",
        "bash-language-server",
        "bash-debug-adapter",
        "beautysh",
        "shellharden",
        "jq",
      },
    },
  },
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require("lspconfig.ui.windows").default_options = {
        border = "rounded",
      }
    end,
  },
  -- LSP Kind
  {
    "onsails/lspkind.nvim",
    lazy = true,
  },
  -- LSP Signature
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded",
      },
    },
  },
  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
  },
  -- Formatter
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
  },
  -- Todo Comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- Codeium
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = true,
    event = "InsertEnter",
  },
  -- Golang
  {
    "ray-x/go.nvim",
    dependencies = {
      {
        "ray-x/guihua.lua",
        build = "cd lua/fzy && make",
      },
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
  -- gotmpl grammer
  {
    "kmoschcau/tree-sitter-go-template",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
  -- Navigator
  {
    "ray-x/navigator.lua",
    dependencies = {
      {
        "ray-x/guihua.lua",
        build = "cd lua/fzy && make",
      },
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "ray-x/lsp_signature.nvim",
    },
  },
  -- LuaSnips
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },
  -- Scissors
  {
    "chrisgrieser/nvim-scissors",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  -- cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
  },
  -- Markdown Previewing
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
