return {
  "Bekaboo/dropbar.nvim",
  event = {
    "UIEnter",
  },
  opts = {
    icons = {
      ui = {
        bar = {
          separator = "  ",
          extends = "..",
        },
      },
      kinds = {
        symbols = require("icons").breadcrumbs,
      },
    },
  },
}
