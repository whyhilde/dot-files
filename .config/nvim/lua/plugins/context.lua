return {
  "nvim-treesitter/nvim-treesitter-context",
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufNew",
  },
  opts = {
    enable = true,
    multiwindow = false,
    max_lines = 3,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = "outer",
    mode = "cursor",
    separator = "─",
    zindex = 20,
  },
}
