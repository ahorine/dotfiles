-- Telescope
require('telescope').setup {
  pickers = {
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end
    },
  },
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "vendor",
      ".git",
    },
  },
}

-- Leap
require('leap').add_default_mappings()

-- Session management
-- - Persisted
require('persisted').setup({
  autoload = true,
  use_git_branch = true,
  ignored_dirs = {
    "/",
    "~/",
    "~/Downloads",
    "~/Documents",
  },
})
-- Load telescope extension
require('telescope').load_extension('persisted')
-- Create hooks
local group = vim.api.nvim_create_augroup('persistedHooks', {})
vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'PersistedTelescopeLoadPre',
  group = group,
  callback = function()
    -- Save the current session
    require('persisted').save({ session = vim.g.persisted_loaded_session })
    -- Clear all buffers
    vim.api.nvim_input('<ESC>:%bd!<CR>')
  end,
})
