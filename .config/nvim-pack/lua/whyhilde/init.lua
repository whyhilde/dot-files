require("whyhilde.plugins")
require("whyhilde.configs.mappings")
require("whyhilde.configs.options")
require("whyhilde.configs.neovide")


vim.cmd.colorscheme("everforest")


require("langmapper").automapping({
  global = true,
  buffer = true,
})
