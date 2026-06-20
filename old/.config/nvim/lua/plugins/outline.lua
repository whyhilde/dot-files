return {
  "stevearc/aerial.nvim",
  version = "*",
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufNew",
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    backends = {
      "lsp",
      "treesitter",
    },
    filter_kind = {
      "Class",
      "Function",
      "Method",
      "Interface",
      "Struct",
      "Array",
      "Constructor",
      "Enum",
      "Module",
    },
    close_behavior = "global",
    show_guides = true,
    guides = {
      mid_item = "│ ",
      last_item = "└ ",
      nested_top = "│ ",
      whitespace = "  ",
    },
    icons = require("util.icons").outline,
    layout = {
      default_direction = "right",
      max_width = {
        40,
        0.3,
      },
      min_width = 30,
    },
  },
  keys = {
    {
      mode = "n",
      "<leader>a",
      "<cmd>AerialToggle!<cr>",
    },
    {
      mode = "n",
      "[[",
      "<cmd>AerialPrev<cr>",
    },
    {
      mode = "n",
      "]]",
      "<cmd>AerialNext<cr>",
    },
  },
}
