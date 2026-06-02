require("mini.files").setup({
  mappings = {
    close = "q",
    go_in = "",
    go_in_plus = "l",
    go_out = "",
    go_out_plus = "h",
    mark_goto = "'",
    mark_set = "m",
    reset = "<bs>",
    reveal_cwd = "@",
    show_help = "?",
    synchronize = "<cr>",
    trim_left = "<",
    trim_right = ">",
  },
  options = {
    permanent_delete = false,
    use_as_default_explorer = true,
  },
  windows = {
    max_number = 3,
    preview = true,
    width_focus = 30,
    width_nofocus = 20,
    width_preview = 50,
  },
})


vim.keymap.set("n", "<leader>e", function() if not MiniFiles.close() then MiniFiles.open() end end)
