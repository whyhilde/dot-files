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
    -- lspconfig.clangd.setup {
    --   capabilities = capabilities,
    --   cmd = {
    --     "clangd",
    --     "--background-index",
    --     "--clang-tidy",
    --     "--header-insertion=never",
    --     "--completion-style=detailed",
    --     "--offset-encoding=utf-16",
    --   },
    --   filetypes = {
    --     "c", "cpp",
    --   },
    -- }


    local servers = {
      "go",
      "lua",
      "python",
    }


    for _, server in ipairs(servers) do
      require("lsp.servers." .. server)
    end


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
  end,
}
