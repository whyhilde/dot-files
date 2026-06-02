require("mini.bracketed").setup({
  buffer = {
    suffix = "b",
  },
  comment = {
    suffix = "c",
  },
  conflict = {
    suffix = "x",
  },
  diagnostic = {
    suffix = "d",
    options = {
      severity = vim.diagnostic.severity.ERROR,
      float = true,
    },
  },
  file = {
    suffix = "f",
  },
  indent = {
    suffix = "",
  },
  jump = {
    suffix = "j",
  },
  location = {
    suffix = "l",
  },
  oldfile = {
    suffix = "",
  },
  quickfix = {
    suffix = "q",
  },
  treesitter = {
    suffix = "t",
  },
  undo = {
    suffix = "u",
  },
  window = {
    suffix = "w",
  },
  yank = {
    suffix = "y",
  },
})
