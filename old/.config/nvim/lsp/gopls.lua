return {
  -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
  cmd = {
    vim.fn.stdpath("data") .. "/mason/bin/gopls",
  },
  filetypes = {
    "go",
    "gomod",
    "gowork",
    "gotmpl",
  },
  settings = {
    gopls = {
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = false,
      staticcheck = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
