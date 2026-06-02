return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    require("notify").setup {
      background_colour = "#00000000",
      render = "wrapped-compact",
      stages = "slide",
      max_width = 30,
      minimum_width = 30,
      timeout = 2000,
      fps = 120,
      level = 0,
      icons = {
        TRACE = "TRACE",
        DEBUG = "DEBUG",
        INFO = "INFO",
        WARN = "WARN",
        ERROR = "ERROR",
      },
    }


    vim.notify = require("notify")
  end,
}
