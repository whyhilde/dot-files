return {
  "nvim-telescope/telescope.nvim",
  event = {
    "UIEnter",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/todo-comments.nvim",
  },
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup {
      defaults = {
        preview = false,
        initial_mode = "insert",
        path_display = {
          "smart",
        },
        prompt_prefix = " ",
        selection_caret = "~> ",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
          width = 0.80,
          height = 0.80,
        },
        mappings = {
          i = {
            ["<c-k>"] = actions.move_selection_previous,
            ["<c-j>"] = actions.move_selection_next,
            ["<c-c>"] = actions.close,
          },
        },
        file_ignore_patterns = {
          "%.o", "%.so", "%.zip", "%.tar", "%.gz", "%.png", "%.jpg", "%.gif", "%.pdf", "%.mp3", "%.mp4",
        },
      },
      pickers = {
        find_files = {},
        oldfiles = {},
        live_grep = {},
        git_branches = {},
        git_commits = {},
        git_status = {},
      },
    }
  end,
}
