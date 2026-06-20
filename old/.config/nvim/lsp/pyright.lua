return {
  -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
  cmd = {
    vim.fn.stdpath("data") .. "/mason/bin/pyright",
  },
  filetypes = {
    "python",
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
