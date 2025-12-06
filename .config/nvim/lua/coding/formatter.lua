return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufNew",
  },
  opts = {
    formatters_by_ft = {
      go = {
        "gofumpt",
        "golines",
      },
    },
    format_on_save = false,
    formatters = {
      gofumpt = {
        command = vim.fn.stdpath("data") .. "/mason/packages/gofumpt/gofumpt",
      },
      golines = {
        command = vim.fn.stdpath("data") .. "/mason/packages/golines/golines",
        args = {
          "--max-len=100",
          "--base-formatter=gofumpt",
          "--shorten-comments",
        },
      },
      clang_format = {
        prepend_args = {
          "--style={ BasedOnStyle: LLVM, BreakBeforeBraces: Attach, SpaceBeforeParens: ControlStatements, IndentWidth: 2, ColumnLimit: 80, }"
        },
      },
    },
  },
  keys = {
    {
      mode = { "n", "v" },
      "<leader>fc",
      function() require("conform").format { async = true, lsp_fallback = true } end,
    },
  },
}
