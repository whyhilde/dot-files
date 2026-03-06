return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
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
    }
  end,
  keys = {
    {
      mode = "n",
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
    },
    {
      mode = "n",
      "<leader>fo",
      "<cmd>Telescope oldfiles<cr>",
    },
    {
      mode = "n",
      "<leader>fb",
      "<cmd>Telescope buffers<cr>",
    },
    {
      mode = "n",
      "<leader>ft",
      "<cmd>Telescope live_grep<cr>",
    },
    {
      mode = "n",
      "<leader>tt",
      "<cmd>TodoTelescope<cr>",
    },
    {
      mode = "n",
      "<leader>gb",
      "<cmd>Telescope git_branches<cr>",
    },
    {
      mode = "n",
      "<leader>gf",
      "<cmd>Telescope git_files<cr>",
    },
    {
      mode = "n",
      "<leader>gs",
      "<cmd>Telescope git_status<cr>",
    },
  },
}
