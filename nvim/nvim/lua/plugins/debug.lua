-- All things debugging related
return {
  -- DAP plugins
  -- - DAP
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      local dap = require("dap")
      -- Bash
      dap.adapters.sh = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
      }

      dap.configurations.sh = {
        {
          name = "Launch Bash debugger",
          type = "sh",
          request = "launch",
          pathBashdb = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
          pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
          program = "${file}",
          cwd = "${fileDirname}",
          pathCat = "/bin/cat",
          pathBash = "/opt/homebrew/bin/bash",
          pathMkfifo = "mkfifo",
          pathPkill = "/usr/bin/pkill",
          args = {},
          env = {},
          --terminalKind = "integrated",
          --repl_lang = "bash",
          -- showDebugOutput = true,
          -- trace = true,
        },
      }
    end,
  },
  -- - DAP-UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "folke/neodev.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "liadoz/nvim-dap-repl-highlights",
      "rcarriga/cmp-dap",
      "nvim-neotest/nvim-nio",
    },
    event = "VeryLazy",
    config = function()
      -- DAP-UI with Neodev
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })

      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      require("nvim-dap-virtual-text").setup()
      require("nvim-dap-repl-highlights").setup()
      -- Automatically open/close dap-ui
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
