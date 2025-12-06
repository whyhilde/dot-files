-- setup plugin manager --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- setup plugins --
require("lazy").setup {   
  ui = {
    border = "rounded",
    size = {
      width = 0.75,
      height = 0.75,
    },
    icons = require("icons").plugins,
  },
  spec = {
    -- coding --
    require("coding.autopairs"),
    -- require("coding.colorcolumn"),
    require("coding.debugger"),
    require("coding.formatter"),
    require("coding.indents"),
    require("coding.outline"),
    require("coding.syntax"),
    require("coding.vcs"),

    -- lsp --
    require("lsp.autocomplete"),
    require("lsp.config"),
    require("lsp.manager"),
    require("lsp.signature"),

    -- ui --
    require("ui.bufferline"),
    require("ui.dashboard"),
    require("ui.icons"),
    require("ui.improvement"),
    require("ui.notifications"),
    require("ui.scrollbar"),
    require("ui.statusline"),
    require("ui.theme"),

    -- utils --
    require("utils.colorizer"),
    require("utils.explorer"),
    require("utils.finder"),
    require("utils.session"),
    require("utils.terminal"),
    require("utils.todocomments"),
    require("utils.troubleshoots"),
  },
}
