local actions = require("telescope.actions")
local builtin = require("telescope.builtin")


require("telescope").setup {
  defaults = {
    preview = true,
    initial_mode = "insert",
    path_display = { "smart" },
    prompt_prefix = "  ",
    selection_caret = "  ",
    results_title = false,
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
      preview_width = 0.6,
      horizontal = {
        height = 0.9,
        width = 0.9,
      },
	  },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["jj"] = actions.close,
      },
    },
    file_ignore_patterns = {
      "%.bin", "%.o", "%.a", "%.so", "%.dll",
      "%.zip", "%.tar", "%.gz",
      "%.png", "%.jpg", "%.jpeg", "%.gif", "%.pdf",
      "%.mp3", "%.mp4",
    },
  },
  pickers = {
    find_files = {
    },
    command_history = {
    },
    live_grep = {
    },
    git_branches = {
    },
    git_commits = {
    },
    git_status = {
    },
  },
}


vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fc", builtin.command_history)
vim.keymap.set("n", "<leader>fw", builtin.live_grep)
vim.keymap.set("n", "<leader>tc", "<cmd>TodoTelescope<cr>")
vim.keymap.set("n", "<leader>gb", builtin.git_branches)
vim.keymap.set("n", "<leader>gc", builtin.git_commits)
vim.keymap.set("n", "<leader>gs", builtin.git_status)
