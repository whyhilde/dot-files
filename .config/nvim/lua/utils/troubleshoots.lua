return {
  "folke/trouble.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufNew",
  },
  opts = {
    position = "bottom",
    height = 10,
    focus = true,
    auto_jump = false,
    keys = {
      q = "close",
      ["<esc>"] = "cancel",
      ["<cr>"] = "jump",
      o = "jump_close",
      j = "next",
      k = "prev",
      dd = "delete",
      r = "refresh",
      R = "toggle_refresh",
    },
    icons = {
      indent = {
        top = " ",
        middle = " ",
        last = " ",
        fold_open = " ",
        fold_closed = " ",
        ws = " ",
      },
      folder_closed = " ",
      folder_open = " ",
    },
  },
  keys = {
    {
      mode = "n",
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
    },
    {
      mode = "n",
      "<leader>xt",
      "<cmd>Trouble todo toggle<cr>",
    },
    {
      mode = "n",
      "<leader>xb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    },
  },
}
