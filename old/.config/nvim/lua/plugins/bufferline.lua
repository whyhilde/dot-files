return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    options = {
      name_formatter = function(buf)
        return buf.name:match("(.+)%..+$")
      end,
      truncate_names = false,
      tab_size = 16,
      indicator = {
        style = "icon",
        icon = " ",
      },
      separator_style = "bold",
      left_trunc_marker = "",
      right_trunc_marker = "",
      modified_icon = "●",
      buffer_close_icon = "󰅖",
      close_icon = "󰅖",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
}
