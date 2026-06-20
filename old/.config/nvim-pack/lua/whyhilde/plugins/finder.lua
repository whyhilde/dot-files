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



-- return {
--   "ibhagwan/fzf-lua",
--   opts = {
--     winopts = {
--       height = 0.8,
--       width = 0.6,
--       border = "bold",
--       fullscreen = false,
--     },
--     preview = {
--       -- default = "bat",
--       border = "bold",       -- preview border: accepts both `nvim_open_win`
--       wrap = false,           -- preview line wrap (fzf's 'wrap|nowrap')
--       hidden = false,           -- start preview hidden
--       vertical = "down:45%",      -- up|down:size
--       horizontal = "right:60%",     -- right|left:size
--       layout = "flex",          -- horizontal|vertical|flex
--       flip_columns = 100,             -- #cols to switch to horizontal on flex
--       title = false,            -- preview border title (file/buf)?
--       title_pos      = "center",        -- left|center|right, title alignment
--       scrollbar      = false,         -- `false` or string:'float|border'
--                                         -- float:  in-window floating border
--                                         -- border: in-border "block" marker
--       scrolloff      = -1,              -- float scrollbar offset from right
--                                         -- applies only when scrollbar = 'float'
--       delay          = 20,              -- delay(ms) displaying the preview
--                                         -- prevents lag on fast scrolling
--       winopts = {                       -- builtin previewer window options
--         number            = true,
--         relativenumber    = false,
--         cursorline        = true,
--         cursorlineopt     = "both",
--         cursorcolumn      = false,
--         signcolumn        = "no",
--         list              = false,
--         foldenable        = false,
--         foldmethod        = "manual",
--       },
--     },
--     fzf_opts = {
--       ["--info"] = "hidden",
--     },
--     fzf_colors = {
--       true,
--       ["fg"]          = { "fg", "Normal", },
--       ["bg"]          = { "bg", "Normal", },
--       ["hl"]          = { "fg", "Keyword", },
--       ["fg+"]         = { "fg", "Normal",},
--       ["bg+"]         = { "bg", "CursorLine", },
--       ["hl+"]         = { "fg", "Keyword", },
--       ["info"]        = { "fg", "Normal", },
--       ["prompt"]      = { "fg", "Keyword", },
--       ["pointer"]     = { "fg", "Keyword", },
--       ["marker"]      = { "fg", "Keyword", },
--       ["spinner"]     = { "fg", "Keyword", },
--       ["header"] = { "fg", "Comment", },
--       ["gutter"] = "-1",
--   },
-- },
-- }
