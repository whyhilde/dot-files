return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    close_if_last_window = false,
    popup_border_style = "rounded",
    clipboard = {
      sync = "none",
    },
    enable_git_status = true,
    enable_diagnostics = false,
    open_files_using_relative_paths = false,
    sort_case_insensitive = false,
    default_component_configs = {
      container = {
        enable_character_fade = true,
      },
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = false,
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default = "",
        highlight = "NeoTreeFileIcon",
        use_filtered_colors = true,
      },
      modified = {
        symbol = "",
      },
      name = {
        trailing_slash = false,
        use_filtered_colors = false,
        use_git_status_colors = false,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          added = "N",
          modified = "M",
          deleted = "D",
          renamed = "R",
          untracked = "U",
          ignored = "I",
          unstaged = "",
          staged = "M",
          conflict = "C",
        },
      },
      file_size = {
        enabled = false,
      },
      type = {
        enabled = false,
      },
      last_modified = {
        enabled = false,
      },
      created = {
        enabled = false,
      },
      symlink_target = {
        enabled = false,
      },
    },
    window = {
      position = "left",
      width = 30,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<cr>"] = "open",
        ["<esc>"] = "cancel",
        ["P"] = "toggle_preview",
        ["t"] = "open_tabnew",
        ["C"] = "close_all_nodes",
        ["Z"] = "expand_all_nodes",
        ["a"] = "add",
        ["A"] = "add_directory",
        ["d"] = "delete",
        ["r"] = "rename",
        ["b"] = "rename_basename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy",
        ["m"] = "move",
        ["q"] = "close_window",
        ["?"] = "show_help",
        ["i"] = {
          "show_file_details",
          config = {
            created_format = "%d %b %Y",
            modified_format = "relative",
          },
        },
      },
    },
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_ignored = false,
        hide_hidden = false,
      },
      follow_current_file = {
        enabled = false,
        leave_dirs_open = false,
      },
      group_empty_dirs = false,
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = false,
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["/"] = "fuzzy_finder",
          ["D"] = "fuzzy_finder_directory",
          ["#"] = "fuzzy_sorter",
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
        },
        fuzzy_finder_mappings = {
          ["<down>"] = "move_cursor_down",
          ["<c-n>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<c-p>"] = "move_cursor_up",
          ["<esc>"] = "close",
          ["<s-cr>"] = "close_keep_filter",
          ["<c-cr>"] = "close_clear_filter",
          ["<c-w>"] = { "<c-s-w>", raw = true },
          {
            n = {
              ["j"] = "move_cursor_down",
              ["k"] = "move_cursor_up",
              ["<S-CR>"] = "close_keep_filter",
              ["<C-CR>"] = "close_clear_filter",
              ["<esc>"] = "close",
            },
          },
        },
      },
    },
  },
  keys = {
    {
      mode = "n",
      "<leader>e",
      "<cmd>Neotree toggle<cr>",
    },
  },
}
