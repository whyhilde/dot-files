local miniclue = require("mini.clue")
require("mini.clue").setup({
  triggers = {
    {
      mode = {
        "n",
        "x",
      },
      keys = "<leader>",
    },
    {
      mode = "n",
      keys = "[",
    },
    {
      mode = "n",
      keys = "]",
    },
  },
  clues = {
    miniclue.gen_clues.square_brackets(),
  },
  window = {
    config = {
      width = "auto",
      title = " keys ",
    },
    delay = 750,
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
})
