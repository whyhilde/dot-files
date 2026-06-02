require("mini.pick").setup({
  delay = {
    async = 10,
    busy = 50,
  },
  mappings = {
    caret_left  = "<left>",
    caret_right = "<right>",
    choose = "<cr>",
    choose_in_split = "<c-s>",
    choose_in_tabpage = "<c-t>",
    choose_in_vsplit = "<c-v>",
    choose_marked = "<m-cr>",
    delete_char = "<bs>",
    delete_char_right = "<del>",
    delete_left = "<c-u>",
    delete_word = "<c-w>",
    mark = "<c-x>",
    mark_all = "<c-a>",
    move_down = "<c-j>",
    move_start = "<C-g>",
    move_up = "<c-k>",
    paste = "<c-r>",
    refine = "<c-space>",
    refine_marked = "<m-space>",
    scroll_down = "<c-f>",
    scroll_left = "<c-h>",
    scroll_right = "<c-l>",
    scroll_up = "<c-b>",
    stop = "<esc>",
    toggle_info = "<s-tab>",
    toggle_preview = "<tab>",
  },
  options = {
    content_from_bottom = false,
    use_cache = false,
  },
  source = {
    items = nil,
    name = nil,
    cwd = nil,
    match = nil,
    show = nil,
    preview = nil,
    choose = nil,
    choose_marked = nil,
  },
  window = {
    config = function()
      local height = math.floor(0.618 * vim.o.lines)
      local width = math.floor(0.618 * vim.o.columns)
      return {
        anchor = "NW",
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
        border = "bold",
      }
    end,
    prompt_caret = " ",
    prompt_prefix = " ",
  },
})


require("mini.extra").setup()


vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>")
vim.keymap.set("n", "<leader>ft", "<cmd>Pick grep_live<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Pick help<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>Pick diagnostic<cr>")
vim.keymap.set("n", "<leader>fp", "<cmd>Pick hipatterns<cr>")
