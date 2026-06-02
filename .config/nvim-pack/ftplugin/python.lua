vim.lsp.config(
  "pyright",
  {
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
)

vim.lsp.enable("pyright")
