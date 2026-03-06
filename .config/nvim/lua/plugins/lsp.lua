return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPre",
    "BufNewFile",
    "BufNew",
  },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("languages.go").lsp()
    require("languages.lua").lsp()
    require("languages.python").lsp()


    require("configs.diagnostics")
  end,
  keys = {
    {
      mode = "n",
      "<leader>lh",
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end,
    },
  },
}
