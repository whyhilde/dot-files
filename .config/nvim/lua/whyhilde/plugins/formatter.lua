return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufNew",
  },
  opts = {
    formatters_by_ft = {
      rust = {
        "rustfmt",
      },
      go = {
        "gofumpt",
        "golines",
      },
    },
    format_on_save = false,
    formatters = {
      gofumpt = {
        command = vim.fn.stdpath("data") .. "/mason/bin/gofumpt",
      },
      golines = {
        command = vim.fn.stdpath("data") .. "/mason/bin/golines",
        args = {
          "--max-len=80",
          "--base-formatter=gofumpt",
          "--shorten-comments",
        },
      },
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
