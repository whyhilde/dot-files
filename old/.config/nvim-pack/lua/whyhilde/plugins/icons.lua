return {
  "nvim-mini/mini.icons",
  version = "*",
  event = "VeryLazy",
  opts = {
    style = "glyph",
    default = require("configs.icons").icons.default,
    directory = require("configs.icons").icons.directory,
    extension = require("configs.icons").icons.extension,
    file = require("configs.icons").icons.file,
    filetype = require("configs.icons").icons.filetype,
    lsp = require("configs.icons").icons.lsp,
    os = require("configs.icons").icons.os,
  },
  init = function()
    require("mini.icons").mock_nvim_web_devicons()
  end,
}
