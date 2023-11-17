-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
  end
}

  use 'neovim/nvim-lspconfig'
  use 'towolf/vim-helm'
  use 'ggandor/leap.nvim'
  use 'rcarriga/nvim-notify'
  use 'fatih/vim-go'
  use 'nvim-treesitter/nvim-treesitter'
  use 'folke/tokyonight.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup()
  end,
}

  use {
  'gorbit99/codewindow.nvim',
  config = function()
    local codewindow = require('codewindow')
    codewindow.setup({
      --auto_enable = true,
    })
    codewindow.apply_default_keybinds()
  end,
}

  --use 'cocopon/iceberg.vim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  requires = { {'nvim-lua/plenary.nvim'}, {'nvim-treesitter/nvim-treesitter'}, {'nvim-tree/nvim-web-devicons'}, {'BurntSushi/ripgrep'} }
}

  use {
    'github/copilot.vim',
  }

  use {
    'lervag/vimtex',
  }

  use 'norcalli/nvim-colorizer.lua'

end)
