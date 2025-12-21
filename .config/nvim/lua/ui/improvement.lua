return {
  "folke/noice.nvim",
  event = {
    "UIEnter",
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      signature = {
        enabled = false,
      },
      progress = {
        enabled = false,
      },
      override = {
        ["cmp.entry.get_documentation"] = false,
      },
    },
    presets = {
      command_palette = true,
      bottom_search = false,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
    cmdline = {
      format = {
        cmdline = {
          icon = "",
          title = "",
        },
        search_down = {
          icon = "",
          title = "",
        },
        search_up = {
          icon = "",
          title = "",
        },
        filter = {
          icon = "",
          title = "",
        },
        lua = {
          icon = "",
          title = "",
        },
        help = {
          icon = "",
          title = "",
        },
      },
    },
  },
}
