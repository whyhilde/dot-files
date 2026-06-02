vim.lsp.config(
  "lua_ls",
  {
    filetypes = {
      "lua",
    },
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
)

vim.lsp.enable("lua_ls")
