local disabled_ft = {
  "aerial",
}


return {
  "dstein64/nvim-scrollview",
  event = {
    "BufReadPre",
    "BufNewFile",
    "BufNew",
  },
  opts = {
    current_only = true,
    signs_overflow = "right",
    signs_hidden_for_insert = true,
    zindex = 30,
    excluded_filetypes = disabled_ft,
  },
}
