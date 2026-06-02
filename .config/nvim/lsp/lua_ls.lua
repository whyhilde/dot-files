return {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  cmd = {
    vim.fn.stdpath("data") .. "/mason/bin/lua-language-server",
  },
  filetypes = {
    "lua",
  },
--  root_markers = {
--    ".luacheckrc",
--    ".stylua.toml",
--    "stylua.toml",
--    ".git"
--  }
  settings = {
    Lua = {
      hint = {
        enable = true,
        semicolon = "Disable",
        arrayIndex = "Disable",
      },
      codeLens = {
        enable = true,
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.stdpath("config") .. "/lua",
        },
        checkThirdParty = false,
      },
    },
  },
}
