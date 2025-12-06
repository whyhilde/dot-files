return {
  "folke/todo-comments.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
    "BufNew",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    signs = true,
    sign_priority = 8,
    keywords = {
      FIX = { icon = " ", color = "#f38ba8", alt = { "BUG", "ISSUE", }, },
      TODO = { icon = " ", color = "#89b4fa", },
      WARN = { icon = " ", color = "#f9e2af", },
      PERF = { icon = "󰥔 ", color = "#fab387", alt = { "OPTIM", }, },
      NOTE = { icon = " ", color = "#a6e3a1", alt = { "INFO", }, },
      TEST = { icon = " ", color = "#bac2de", },
    },
    gui_style = {
      fg = "NONE",
      bg = "BOLD",
    },
    merge_keywords = true,
    highlight = {
      multiline = true,
      multiline_context = 10,
      before = "",
      keyword = "wide",
      after = "fg",
      comments_only = true,
      max_line_len = 400,
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[\b(KEYWORDS):]],
    },
  },
}
