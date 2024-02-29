-- Preconfig
require("config.options")

-- Setup Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins", {
  defaults = {
    lazy = false,
  },
  checker = {
    enabled = true,
  },
})
-- Postconfig
require("config.mappings")
require("config.style")
require("config.vcs")
require("config.lang")
require("config.editing")
require("config.debug")
