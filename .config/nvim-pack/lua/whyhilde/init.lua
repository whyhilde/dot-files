require("whyhilde.plugins")
require("whyhilde.configs.keymaps")
require("whyhilde.configs.options")
require("whyhilde.configs.neovide")


vim.cmd.colorscheme("gruvbox")


require("langmapper").automapping({
  global = true,
  buffer = true,
})
