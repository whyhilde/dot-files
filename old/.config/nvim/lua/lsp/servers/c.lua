vim.lsp.enable(
  "clangd",
  {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    cmd = {
      vim.fn.stdpath("data") .. "/mason/packages/clangd/clangd*/bin/clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=never",
      "--completion-style=detailed",
      "--offset-encoding=utf-16",
    },
    filetypes = {
      "c",
      "cpp",
    },
  }
)
