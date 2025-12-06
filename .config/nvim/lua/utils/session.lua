return {
  "folke/persistence.nvim",
  event = {
    "UIEnter",
  },
  opts = {
    dir = vim.fn.stdpath("state") .. "/sessions/",
  },
}
