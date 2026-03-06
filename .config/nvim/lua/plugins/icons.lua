return {
  "nvim-mini/mini.icons",
  version = "*",
  event = "VeryLazy",
  opts = {
    style = "glyph",
    default = require("util.icons").icons.default,
    directory = require("util.icons").icons.directory,
    extension = require("util.icons").icons.extension,
    file = require("util.icons").icons.file,
    filetype = require("util.icons").icons.filetype,
    lsp = require("util.icons").icons.lsp,
    os = require("util.icons").icons.os,
  },
  init = function()
    require("mini.icons").mock_nvim_web_devicons()
  end,
}
