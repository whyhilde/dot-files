require("gitsigns").setup({
  signs = {
    add = {
      text = "▒",
    },
    change = {
      text = "▒",
    },
    delete = {
      text = "▒",
    },
    topdelete = {
      text = "▒",
    },
    changedelete = {
      text = "▒",
    },
    untracked = {
      text = "",
    },
  },
  signs_staged_enable = true,
  signs_staged = {
    add = {
      text = "▒",
    },
    change = {
      text = "▒",
    },
    delete = {
      text = "▒",
    },
    topdelete = {
      text = "▒",
    },
    changedelete = {
      text = "▒",
    },
    untracked = {
      text = "",
    },
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  diff_opts = {
    algorithm = "histogram",
    ignore_whitespace_change = true,
  },
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 0,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = "<author>, <author_time:%d-%m-%y>: <summary>",
  attach_to_untracked = true,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
})


vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<cr>")
vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<cr>")
vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>")
vim.keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>")
vim.keymap.set("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>")
vim.keymap.set("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<cr>")
vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>")
vim.keymap.set("n", "<leader>hb", "<cmd>Gitsigns blame_line<cr>")
vim.keymap.set("n", "<leader>hB", "<cmd>Gitsigns toggle_current_line_blame<cr>")
vim.keymap.set("n", "<leader>hd", "<cmd>Gitsigns diffthis<cr>")
vim.keymap.set("v", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>")
vim.keymap.set("v", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>")
