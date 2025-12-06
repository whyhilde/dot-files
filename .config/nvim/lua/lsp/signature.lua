return {
  "ray-x/lsp_signature.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
    "BufNew",
  },
  opts = {
    bind = true,
    hint_enable = false,
    floating_window = true,
    floating_window_above_cur_line = true,
    handler_opts = {
      border = "rounded",
    },
  },
}
