local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Configura neovim para usar rbenv
username = vim.fn.expand('$USER')
vim.env.PATH = '/home/' .. username .. '/.rbenv/shims:' .. vim.env.PATH

require("settings")
require("keymaps")
require("lazy").setup("plugins")

