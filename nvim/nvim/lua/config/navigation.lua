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
