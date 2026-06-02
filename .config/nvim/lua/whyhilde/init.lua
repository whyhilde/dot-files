local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path
  })
end
vim.opt.rtp:prepend(lazy_path)


-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"


require("whyhilde.core.autocmds")
require("whyhilde.core.keymaps")
require("whyhilde.core.options")
require("whyhilde.plugins")


vim.cmd.colorscheme("gruvbox")
