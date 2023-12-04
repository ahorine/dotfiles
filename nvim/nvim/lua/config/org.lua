-- Organization/Productivity

-- Neorg
require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    ['core.concealer'] = {
      config = {
        icon_preset = 'diamond',
      },
    },
    ['core.export'] = {},
    ['core.export.markdown'] = {
      config = {
        extensions = "all",
        metadata = {
          start = "``` document.meta",
          ["end"] = "```",
        },
      },
    },
    ['core.summary'] = {},
    ['core.dirman'] = {
      config = {
        workspaces = {
          home = '~/notes/home',
          work = '~/notes/work',
        },
      },
    },
    ['core.completion'] = {
      config = {
        engine = 'nvim-cmp',
        name = '[Norg]',
      },
    },
    ['core.integrations.nvim-cmp'] = {},
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
      },
    },
    ['core.ui.calendar'] = {},
  },
})
-- Mask characters by default
vim.wo.conceallevel = 2
