local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local snipDir = vim.fn.stdpath("config") .. "/snippets"
local formatIgnore = ".formatignore"

-- Auto Commands
-- - Format on save
local format_sync_grp = augroup("GoFormat", {})
autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = format_sync_grp,
})
autocmd("FileType", {
  pattern = "guihua",
  callback = function()
    require("cmp").setup.buffer({ enabled = false })
  end,
})
autocmd("FileType", {
  pattern = "guihua_rust",
  callback = function()
    require("cmp").setup.buffer({ enabled = false })
  end,
})

local function shouldFormat(filename)
  local root = vim.fs.root(0, formatIgnore)
  if not root then
    return true
  end
  local file = io.open(vim.fs.joinpath(root, formatIgnore), "r")
  if not file then
    return true
  end

  for line in file:lines() do
    if string.match(filename, line) then
      vim.notify("Formatting disabled for " .. filename, vim.log.levels.WARN)
      return false
    end
  end
  return true
end

-- Language Plugins
return {
  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {},
    event = "VeryLazy",
  },
  -- Mason LSP Config
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {},
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
    -- config = function()
    --   vim.lsp.config()
    --   -- require("lspconfig.ui.windows").default_options = {
    --   --   border = "rounded",
    --   -- }
    -- end,
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
    config = function()
      local lint = require("lint")
      -- - Configure linters
      lint.linters_by_ft = {
        lua = { "luacheck" },
        go = { "staticcheck" },
        make = { "checkmake" },
        python = { "flake8" },
        -- sh = { "shellcheck" },
        zsh = { "shellcheck" },
        markdown = { "markdownlint" },
        yaml = { "yamllint" },
      }
      -- - Create autocommand to lint
      autocmd("InsertLeave", {
        callback = function()
          lint.try_lint()
        end,
      })
      -- Add '-x' to shellcheck
      lint.linters.shellcheck.args = {
        "-x",
        "--format",
        "json",
        "-",
      }
    end,
  },
  -- Formatter
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    config = function()
      local ft_formatters = {
        lua = { require("formatter.filetypes.lua").stylua },
        sh = {
          require("formatter.filetypes.sh").shfmt,
          {
            exe = "shellharden",
            args = { "--replace" },
          },
        },
        markdown = { require("formatter.filetypes.markdown").denofmt },
        proto = { require("formatter.filetypes.proto").buf_format },
        yaml = { require("formatter.filetypes.yaml").yamlfmt },
        zsh = { require("formatter.filetypes.zsh").beautysh },
        ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
      }
      require("formatter").setup({
        filetype = ft_formatters,
      })
      local afg = augroup("__formatter__", { clear = false })
      autocmd("BufWritePost", {
        group = afg,
        callback = function()
          local ft = vim.bo.filetype
          -- If it's a go file or formatting is disabled, skip it
          if ft == "go" or not shouldFormat(vim.api.nvim_buf_get_name(0)) then
            return
          end
          -- If a formatter is configured, use it, otherwise run lsp format.
          if ft_formatters[ft] then
            vim.cmd("FormatWriteLock")
          else
            -- Run the LSP formatter (if a supporting LS is running)
            local clients = vim.lsp.get_clients({
              bufnr = vim.api.nvim_get_current_buf(),
              method = "textDocument/formatting",
            })
            if #clients ~= 0 then
              vim.lsp.buf.format()
            end
          end
        end,
      })
    end,
  },
  -- Todo Comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "VeryLazy",
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
    build = ':lua require("go.install").update_all()',
    opts = {
      lsp_config = false,
      lsp_keymaps = false,
      lsp_gofumpt = true,
      test_runner = "ginkgo",
      trouble = true,
      luasnip = true,
    },
  },
  -- gotmpl grammer
  {
    "kmoschcau/tree-sitter-go-template",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "gotmpl", "yaml", "tpl" },
    config = function()
      vim.filetype.add({
        extension = {
          gotmpl = "gotmpl",
        },
        pattern = {
          [".*/templates/.*%.tpl"] = "helm",
          [".*/templates/.*%.ya?ml"] = "helm",
          ["helmfile.*%.ya?ml"] = "helm",
        },
      })
    end,
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
        servers = { "marksman", "helm_ls", "ltex" },
        format_on_save = false, -- Handled by __formatter__ autocmd
      },
    },
    keys = {
      { "<leader>g", "", desc = "+Get (Navigator)" },
      { "<space>c", "", desc = "+Code Actions (Navigator)" },
      { "<space>l", "", desc = "+Code Lens (Navigator)" },
      { "<space>r", "", desc = "+Refactor (Navigator)" },
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
    event = "VeryLazy",
    opts = {
      snippetDir = snipDir,
      jsonFormatter = "jq",
      editSnippetPopup = {
        keymaps = {
          deleteSnippet = "<leader>sd",
        },
      },
    },
  },
  -- Scissors
  {
    "chrisgrieser/nvim-scissors",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("luasnip").setup()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = {
          snipDir,
        },
      })
    end,
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
    opts = {},
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
    event = "VeryLazy",
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<tab>"] = cmp.mapping.select_next_item(),
          ["<s-tab>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-u>"] = cmp.mapping.scroll_docs(4),
          ["<C-c>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm(),
        }),
        sources = {
          { name = "nvim_lsp", keyword_length = 1 },
          { name = "nvim_lua", keyword_length = 2 },
          { name = "luasnip", keyword_length = 2 },
          { name = "neorg", keyword_length = 2 },
        },
        {
          { name = "buffer", keyword_length = 2 },
          { name = "path" },
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        window = {
          documentation = cmp.config.window.bordered(),
          completion = cmp.config.window.bordered(),
        },
        enabled = function()
          return vim.api.nvim_get_option_value("buftype", { buf = 0 }) ~= "prompt" or require("cmp_dap").is_dap_buffer()
        end,
      })
      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap", keyword_length = 1 },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
    end,
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
