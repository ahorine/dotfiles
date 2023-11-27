-- Organization/Productivity

-- Neorg
require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    ['core.concealer'] = {},
    ['core.export'] = {},
    ['core.export.markdown'] = {},
    ['core.summary'] = {},
    ['core.dirman'] = {
      config = {
        workspaces = {
          home = '~/notes/home',
          work = '~/notes/work',
          genshin = '~/notes/genshin',
        },
      },
    },
    ['core.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
  },
})
