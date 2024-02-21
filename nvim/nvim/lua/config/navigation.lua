-- Telescope
require("telescope").setup({
  pickers = {
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end,
    },
  },
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "vendor",
      ".git",
    },
  },
})

-- Leap + Spooky
require("leap").add_default_mappings()
require("leap-spooky").setup()

-- Registers
require("registers").setup({
  window = {
    border = "rounded",
  },
})

-- Marks
require("marks").setup()

-- Buffers
require("buffer_manager").setup()
vim.api.nvim_set_hl(0, "BufferManagerModified", { fg = "#af0000" })
