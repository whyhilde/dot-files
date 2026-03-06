return {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  opts = {
    automatic_installation = true,
    ensure_installed = {
      "gopls",
      "gofumpt",
      "golines",
      "delve",
      "lua-language-server",
      "pyright",
    },
    ui = {
      check_outdated_packages_on_open = true,
      border = "rounded",
      height = 0.75,
      width = 0.75,
      icons = require("util.icons").manager,
    },
  },
}
