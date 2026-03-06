return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    require("notify").setup {
      background_colour = "#181825",
      render = "wrapped-compact",
      stages = "fade_in_slide_out",
      max_width = 30,
      minimum_width = 30,
      timeout = 2000,
      fps = 60,
      level = 0,
      icons = require("util.icons").notifications,
    }


    vim.notify = require("notify")
  end,
}
