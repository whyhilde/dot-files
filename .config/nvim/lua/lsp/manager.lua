require("mason").setup {
  automatic_installation = false,
  ensure_installed = {
    "rust-analyzer",
    "rustfmt",
    "codelldb",
    "clangd"
  },
  ui = {
    check_outdated_packages_on_open = true,
    border = "rounded",
    height = 0.75,
    width = 0.75,
    icons = require("icons").manager,
  },
}
