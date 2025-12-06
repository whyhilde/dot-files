vim.lsp.enable(
  "qmlls",
  {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    cmd = {
      vim.fn.stdpath("data") .. "/mason/packages/qmlls/qmlls",
    },
    root_dir = function(fname)
      return vim.fn.getcwd()
    end,
    filetypes = {
      "qml",
    },
  }
)
