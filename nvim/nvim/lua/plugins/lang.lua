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
        "yaml-language-server",
        "yamlfix",
        "yamlfmt",
        "yamllint",
        "helm-ls",
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
  -- LSP Code Action Preview
  {
    "aznhe21/actions-preview.nvim",
    opts = {
      telescope = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = "top",
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    },
    keys = {
      {
        "<space>cp",
        function()
          require("actions-preview").code_actions()
        end,
        mode = { "n", "v" },
        desc = "Preview Code Actions",
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
    event = "VeryLazy",
    opts = {
      mason = true,
      border = "single",
      icons = {
        code_action_icon = "",
        code_lens_action_icon = "",
        diagnostic_head = "",
        diagnostic_err = "",
        diagnostic_warn = "",
        diagnostic_info = [[]],
        diagnostic_hint = [[]],
        diagnostic_head_severity_3 = "",
        diagnostic_head_description = "",
        diagnostic_virtual_text = "󰙩",
        diagnostic_file = "",
        value_definition = "󰎔󱇧",
        value_changed = "󱇧",
        match_kinds = {
          associated = "",
          namespace = "",
          field = "",
          module = "",
          flag = "",
        },
        treesitter_defult = "",
      },
      keymaps = {
        { key = "<space>k", func = vim.lsp.buf.signature_help, desc = "signature_help" },
      },
      -- TODO: Hook on_attach and update descriptions via which-key for all the mappings
      -- on_attach = function(client, bufnr)
      -- end,
      lsp = {
        gopls = function()
          local cfg = require("go.lsp").config()
          return cfg
        end,
        -- Register additional servers
        servers = { "marksman" },
        format_on_save = false, -- Handled by __formatter__ autocmd
      },
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
  -- Otter
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    enabled = false,
    lazy = true,
    config = true,
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
      -- "jmbuhr/otter.nvim",
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
