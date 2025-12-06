vim.lsp.enable(
  "pyright",
  {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    cmd = {
      vim.fn.stdpath("data") .. "/mason/packages/pyright/node_modules/pyright/langserver.index.js",
    },
    filetypes = {
      "python",
    },
  }
)
