return {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  opts = {
    window = {
      backdrop = 0.95,
      width = 120,
      height = 1,
      options = {
        signcolumn = "yes",
        number = true,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = "0",
        list = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 3,
      },
      gitsigns = {
        enabled = false,
      },
      todo = {
        enabled = true,
      },
    },
  },
  keys = {
    {
      mode = "n",
      "<leader>z",
      "<cmd>ZenMode<cr>",
    },
  },
}
