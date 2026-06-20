return {
  "mcauley-penney/visual-whitespace.nvim",
  event = {
    "ModeChanged *:[vV\22]",
  },
  opts = {
    enabled = true,
    highlight = { link = "VisualWhitespace" },
    match_types = {
      space = true,
      tab = true,
      nbsp = true,
      lead = false,
      trail = false,
    },
    list_chars = {
      space = "·",
      tab = "↦",
      nbsp = "␣",
      lead = "‹",
      trail = "›",
    },
    fileformat_chars = {
      unix = "",
      mac = "",
      dos = "",
    },
    ignore = { filetypes = require("util.filetypes"), buftypes = {} },
  },
}
