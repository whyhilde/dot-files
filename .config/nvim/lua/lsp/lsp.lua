local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()


lspconfig.clangd.setup {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--completion-style=detailed",
    "--offset-encoding=utf-16",
  },
  filetypes = {
    "c", "cpp",
  },
}


-- lspconfig.rust_analyzer.setup {
--   capabilities = capabilities,
--   -- on_attach = function(client)
--   --   require("completion").on_attach(client)
--   -- end,
--   settings = {
--     ["rust-analyzer"] = {
--       imports = {
--         granularity = {
--           group = "module",
--         },
--         prefix = "self",
--       },
--       cargo = {
--         buildScripts = {
--           enable = true,
--         },
--       },
--       procMacro = {
--         enable = true
--       },
--     },
--   },
-- }


vim.diagnostic.config {
  virtual_text = false,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    source = "always",
    border = "rounded",
  },
  signs = true,
  signs = {
    text = {
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.ERROR] = "",
    },
  },
}
