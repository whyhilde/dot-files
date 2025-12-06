return {
  "nvim-mini/mini.files",
  version = "*",
  event = {
    "UIEnter",
  },
  opts = {
    options = {
      permanent_delete = false,
      use_as_default_explorer = true,
    },
    mappings = {
      close = "q",
      go_in = "",
      go_in_plus = "l",
      go_out = "",
      go_out_plus = "h",
      mark_goto = "'",
      mark_set = "m",
      reset = "<BS>",
      reveal_cwd = "@",
      synchronize = "=",
      trim_left = "<",
      trim_right = ">",
    },
    windows = {
      preview = true,
      width_nofocus = 25,
      width_focus = 30,
      width_preview = 50,
    },
  },
}
