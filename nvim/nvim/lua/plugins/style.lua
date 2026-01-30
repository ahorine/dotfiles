-- UI/Styling plugins
return {
  -- Colors
  -- - Tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        lualine_bold = true,
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- UI
  -- - Lualine
  -- Better strategy for config:
  -- https://github.com/folke/trouble.nvim?tab=readme-ov-file#statusline-component
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local ll = require("lualine")
      local lazyStatus = require("lazy.status")
      local lint = require("lint")
      local cfg = ll.get_config()
      local ll_y = cfg.sections.lualine_y
      local ll_x = cfg.sections.lualine_x
      local lazyUpdates = {
        lazyStatus.updates,
        cond = lazyStatus.has_updates,
        color = { fg = "#ff9e64" },
      }
      table.insert(ll_y, 1, lazyUpdates)
      local lint_progress = function()
        local running = lint.get_running()
        if not lint.linters_by_ft[vim.bo.filetype] or #lint.linters_by_ft[vim.bo.filetype] == 0 then
          return ""
        end
        if #running == 0 then
          return "󰦕"
        end
        return "󱉶 " .. table.concat(running, ", ")
      end
      local lint_color = function()
        local running = lint.get_running()
        if #running == 0 then
          return { fg = "#3ad11f" }
        end
        return { fg = "#ff9e64" }
      end
      local lint_status = {
        lint_progress,
        color = lint_color,
      }
      table.insert(ll_x, 1, lint_status)
      table.insert(ll_x, 1, "lsp_status")
      ll.setup({
        options = {
          theme = "auto",
        },
        sections = {
          lualine_x = ll_x,
          lualine_y = ll_y,
        },
      })
    end,
  },
  -- - notify
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      vim.notify = require("notify")
    end,
  },
  -- - bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
      options = {
        indicator = {
          style = "icon",
        },
        separator_style = "slant",
        diagnostics = "nvim_lsp",
      },
      highlights = {
        buffer_selected = {
          bold = true,
          italic = true,
        },
      },
    },
  },
  -- - Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "go", "bash" },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
      })
    end,
  },
  -- - Traces
  {
    "markonm/traces.vim",
    event = "CmdlineEnter",
  },
  -- - Trouble
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    cmd = { "Trouble" },
    keys = {
      { "<leader>t", "", desc = "+Trouble" },
      {
        "<leader>tt",
        "<cmd>Trouble todo toggle<cr>",
        desc = "Todo (Trouble)",
      },
      {
        "<leader>td",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tD",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  -- - Winshift
  {
    "sindrets/winshift.nvim",
    keys = {
      { "<C-w><C-m>", "<cmd>WinShift<cr>", desc = "WinShift" },
    },
  },
  -- - ZenMode
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 0.9,
        height = 0.9,
      },
      plugins = {
        alacritty = {
          enabled = true,
          font = "20",
        },
      },
    },
    cmd = "ZenMode",
  },
  -- - numbertoggle
  {
    "sitiom/nvim-numbertoggle",
  },
}
