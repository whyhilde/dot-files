return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufNew",
  },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- vim.lsp.enable(
    --   "gopls",
    --   {
    --     capabilities = require("cmp_nvim_lsp").default_capabilities(),
    --     cmd = {
    --       vim.fn.stdpath("data") .. "/mason/bin/gopls",
    --     },
    --     filetypes = {
    --       "go",
    --     },
    --     settings = {
    --       gopls = {
    --         gofumpt = true,
    --         completeUnimported = true,
    --         usePlaceholders = false,
    --         staticcheck = true,
    --         hints = {
    --           assignVariableTypes = true,
    --           compositeLiteralFields = true,
    --           compositeLiteralTypes = true,
    --           constantValues = true,
    --           functionTypeParameters = true,
    --           parameterNames = true,
    --           rangeVariableTypes = true,
    --         },
    --       },
    --     },
    --   }
    -- )


--   vim.lsp.enable(
--     "lua_ls"
      -- {
      --   capabilities = require("cmp_nvim_lsp").default_capabilities(),
      --   cmd = {
      --     vim.fn.stdpath("data") .. "/mason/bin/lua-language-server",
      --   },
      --   filetypes = {
      --     "lua",
      --   },
      -- }
--   )


    -- vim.lsp.enable(
    --   "pyright",
    --   {
    --     capabilities = require("cmp_nvim_lsp").default_capabilities(),
    --     cmd = {
    --       vim.fn.stdpath("data") .. "/mason/bin/pyright",
    --     },
    --     filetypes = {
    --       "python",
    --     },
    --   }
    -- )


    vim.diagnostic.config {
      virtual_text = false,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        source = "always",
        border = "rounded",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.ERROR] = "",
        },
      },
    }


    vim.keymap.set(
      "n",
      "grd",
      vim.lsp.buf.definition,
      {
        desc = "go to definitions",
      }
    )

    vim.keymap.set(
      "n",
      "grD",
      vim.lsp.buf.declaration,
      {
        desc = "go to declaration",
      }
    )
  end,
  init = function()
    local servers = {
      "rust_analyzer",
      "gopls",
      "lua_ls",
      "pyright",
    }

    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
  -- keys = {
  --   {
  --     mode = "n",
  --     "<leader>lh",
  --     function()
  --       vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  --     end,
  --     desc = "toggle inlay hints",
  --   },
  -- },
}
