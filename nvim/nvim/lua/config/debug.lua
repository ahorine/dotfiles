-- DAP-UI with Neodev
require('neodev').setup({
  library = { plugins = { 'nvim-dap-ui' }, types = true },
})

local dap, dapui = require('dap'), require('dapui')

-- Bash
dap.adapters.bashdb = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/packages/bash-debug-adapter/bash-debug-adapter',
}

dap.configurations.sh = {
  {
    type = 'bashdb',
    request = 'launch',
    name = "Launch Bash debugger",
    pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
    pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
    program = "${file}",
    cwd = '${fileDirname}',
    pathCat = "cat",
    pathBash = "bash",
    pathMkfifo = "mkfifo",
    pathPkill = "pkill",
    args = {},
    env = {},
    terminalKind = "integrated",
    repl_lang = "bash",
    -- showDebugOutput = true,
    -- trace = true,
  },
}

dapui.setup()
require('nvim-dap-virtual-text').setup()
require('nvim-dap-repl-highlights').setup()
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
