-- DAP-UI with Neodev
require('neodev').setup({
  library = { plugins = { 'nvim-dap-ui' }, types = true },
})

require('nvim-dap-virtual-text').setup()

local dap, dapui = require('dap'), require('dapui')

-- Bash
dap.adapters.bashdb = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/packages/bash-debug-adapter/bash-debug-adapter',
  name = 'bashdb',
}

dap.configurations.sh = {
  {
    type = 'bashdb',
    request = 'launch',
    name = "Launch file",
    showDebugOutput = true,
    pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
    pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
    trace = true,
    file = "${file}",
    program = "${file}",
    cwd = '${workspaceFolder}',
    pathCat = "cat",
    pathBash = "bash",
    pathMkfifo = "mkfifo",
    pathPkill = "pkill",
    args = {},
    env = {},
    terminalKind = "integrated",
  },
}

dapui.setup()
