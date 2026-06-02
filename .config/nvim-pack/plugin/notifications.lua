require("mini.notify").setup({
  content = {
    format = function(notif)
      return notif.msg
    end,
    sort = nil,
  },
  lsp_progress = {
    enable = false,
  },
  window = {
    config = {
      border = "bold",
      width = 30,
    },
    winblend = 0,
  },
})
