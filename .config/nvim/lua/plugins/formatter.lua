return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufNew",
  },
  opts = {
    formatters_by_ft = {
      go = require("languages.go").formatter.go,
    },
    format_on_save = false,
    formatters = {
      gofumpt = require("languages.go").formatter.gofumpt,
      golines = require("languages.go").formatter.golines,
      -- clang_format = {
      --   prepend_args = {
      --     "--style={ BasedOnStyle: LLVM, BreakBeforeBraces: Attach, SpaceBeforeParens: ControlStatements, IndentWidth: 2, ColumnLimit: 80, }"
      --   },
      -- },
    },
  },
  keys = {
    {
      mode = {
        "n",
        "v",
      },
      "<leader>fc",
      function()
        require("conform").format {
          async = true,
          lsp_fallback = true,
        }
      end,
    },
  },
}
