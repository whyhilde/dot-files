-- setup plugin manager --
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_url = "https://github.com/folke/lazy.nvim.git"
if not vim.loop.fs_stat(lazy_path) then
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazy_url, lazy_path })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazy_path)


vim.g.mapleader = " "


require("plugins")
require("settings.autocmds")
require("settings.highlights")
require("settings.keymaps")
require("settings.options")
