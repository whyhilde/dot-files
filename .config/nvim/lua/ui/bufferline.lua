return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = {
    "UIEnter",
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      name_formatter = function(buf)
        return buf.name:match("(.+)%..+$")
      end,
      truncate_names = false,
      tab_size = 16,
      indicator = {
        style = "icon",
        icon = "▎",
      },
      separator_style = "thin",
      left_trunc_marker = "",
      right_trunc_marker = "",
      modified_icon = "●",
      buffer_close_icon = "󰅖",
      close_icon = "󰅖",
      offsets = {
        {
          filetype = "aerial",
          text = "Outline",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
}
