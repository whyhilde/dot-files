
vim.lsp.config(
  "zls",
  {
    filetypes = {
      "zig",
    },
    -- settings = {
    --   python = {
    --     analysis = {
    --       autoSearchPaths = true,
    --       useLibraryCodeForTypes = true,
    --       diagnosticMode = "openFilesOnly",
    --     },
    --   },
    -- },
  }
)

vim.lsp.enable("zls")
