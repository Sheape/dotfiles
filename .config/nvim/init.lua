-- +++ NEOVIM CONFIG  +++ --
--
-- Maintainer: Sheape
-- Email: sheape@tutanota.com
-- Website: https://gitlab.com/Sheape/dotfiles
-- Initially created: 01-05-22

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

require("keymaps")
require("workman")
require("plugins")
require("settings/general")
