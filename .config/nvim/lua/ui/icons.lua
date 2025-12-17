-- return {
--   "nvim-tree/nvim-web-devicons",
--   version = "*",
--   event = {
--     "UIEnter",
--   },
--   opts = {
--     default = true,
--     color_icons = true,
--   },
-- }


return {
  "nvim-mini/mini.icons",
  version = "*",
  event = {
    "UIEnter",
  },
  opts = {
    style = "glyph",
    default = require("icons").icons.default,
    directory = require("icons").icons.directory,
    extension = require("icons").icons.extension,
    file = require("icons").icons.file,
    filetype = require("icons").icons.filetype,
    lsp = require("icons").icons.lsp,
    os = require("icons").icons.os,
  },
  init = function()
    require("mini.icons").mock_nvim_web_devicons()
  end,
}
