vim.lsp.enable(
  "rust_analyzer",
  {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    cmd = {
      vim.fn.stdpath("data") .. "/mason/packages/rust-analyzer/rust-analyzer-x86_64-unknown-linux-gnu",
    },
    filetypes = {
      "rust",
    },
  }
)
