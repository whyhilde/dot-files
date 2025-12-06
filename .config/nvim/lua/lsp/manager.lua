return {
  "williamboman/mason.nvim",
  event = {
    "UIEnter",
  },
  opts = {
    automatic_installation = false,
    ensure_installed = {
      "gopls",
      "gofumpt",
      "golines",
      "codelldb",
      "lua-language-server",
    },
    ui = {
      check_outdated_packages_on_open = true,
      border = "rounded",
      height = 0.75,
      width = 0.75,
      icons = require("icons").manager,
    },
  },
}
