local function setup_lsp()
  vim.lsp.config(
    "rust_analyzer",
    {
      filetypes = {
        "rust",
      },
      root = {
        "Cargo.toml",
      },
      settings = {
        ["rust-analyzer"] = {
          inlayHints = {
            enable = false,
            parameterHints = {
              enable = false,
            },
            typeHints = {
              enable = false,
              hideNamedConstructor = false,
            },
            chainingHints = {
              enable = false,
            },
            closureReturnTypeHints = {
              enable = "always",
            },
          },
        },
      },
    }
  )

  vim.lsp.enable("rust_analyzer")
end


require("conform").setup({
  formatters_by_ft = {
    rust = {
      "rustfmt",
    },
  },
})


setup_lsp()
