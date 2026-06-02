require("mini.jump").setup({
  mappings = {
    forward = "f",
    backward = "F",
    forward_till = "t",
    backward_till = "T",
    repeat_jump = ";",
  },
  delay = {
    highlight = 250,
    idle_stop = 10000000,
  },
  silent = true,
})


require("mini.jump2d").setup({
  spotter = nil,
  labels = "abcdefghijklmnopqrstuvwxyz",
  view = {
    dim = true,
    n_steps_ahead = 0,
  },
  allowed_lines = {
    blank = true,
    cursor_before = true,
    cursor_at = true,
    cursor_after = true,
    fold = true,
  },
  allowed_windows = {
    current = true,
    not_current = true,
  },
  hooks = {
    before_start = nil,
    after_jump = nil,
  },
  mappings = {
    start_jumping = "<cr>",
  },
  silent = true,
})
