local M = {}


M.lsp = function()
  vim.lsp.enable(
    "gopls",
    {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      cmd = {
        vim.fn.stdpath("data") .. "/mason/bin/gopls",
      },
      filetypes = {
        "go",
      },
    }
  )
end


M.formatter = {
  go = {
    "gofumpt",
    "golines",
  },
  gofumpt = {
    command = vim.fn.stdpath("data") .. "/mason/bin/gofumpt",
  },
  golines = {
    command = vim.fn.stdpath("data") .. "/mason/bin/golines",
    args = {
      "--max-len=100",
      "--base-formatter=gofumpt",
      "--shorten-comments",
    },
  },
}


M.debug = function()
  require("dap").adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
      command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
      args = {
        "dap",
        "-l",
        "127.0.0.1:${port}",
      },
    },
  }


  require("dap").configurations.go = {
    {
      type = "delve",
      name = "debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "delve",
      name = "debug package",
      request = "launch",
      program = "${workspaceFolder}",
    },
  }
end


return M
