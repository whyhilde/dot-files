vim.lsp.enable(
  "gopls",
  {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    cmd = {
      vim.fn.stdpath("data") .. "/mason/packages/gopls/gopls",
    },
    filetypes = {
      "go",
    },
  }
)
