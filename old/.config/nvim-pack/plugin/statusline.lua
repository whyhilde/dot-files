-- local gruvbox = {
--   normal = {
--     a = { bg = "#928374", fg = "#282828", gui = "bold" },
--     b = { bg = "#504945", fg = "#ebdbb2" },
--     c = { bg = "#3c3836", fg = "#a89984" },
--   },
--   insert = {
--     a = { bg = "#7daea3", fg = "#282828", gui = "bold" },
--     b = { bg = "#504945", fg = "#ebdbb2" },
--     c = { bg = "#3c3836", fg = "#a89984" },
--   },
--   visual = {
--     a = { bg = "#d8a657", fg = "#282828", gui = "bold" },
--     b = { bg = "#504945", fg = "#ebdbb2" },
--     c = { bg = "#3c3836", fg = "#a89984" },
--   },
--   replace = {
--     a = { bg = "#ea6962", fg = "#282828", gui = "bold" },
--     b = { bg = "#504945", fg = "#ebdbb2" },
--     c = { bg = "#3c3836", fg = "#a89984" },
--   },
--   command = {
--     a = { bg = "#a9b665", fg = "#282828", gui = "bold" },
--     b = { bg = "#504945", fg = "#ebdbb2" },
--     c = { bg = "#3c3836", fg = "#a89984" },
--   },
-- }


local theme = {
  normal = {
    a = { bg = "#7daea3", fg = "#7daea3" },
    b = { bg = "#3c3836", fg = "#ebdbb2" },
    c = { bg = "#3c3836", fg = "#ebdbb2" },
  },
  insert = {
    a = { bg = "#d3869b", fg = "#d3869b" },
  },
  visual = {
    a = { bg = "#d8a657", fg = "#d8a657" },
  },
  replace = {
    a = { bg = "#ea6962", fg = "#ea6962" },
  },
  command = {
    a = { bg = "#a9b665", fg = "#a9b665" },
  },
}


require("lualine").setup({
  options = {
    component_separators = "",
    section_separators = "",
    theme = theme,
    globalstatus = true,
    disabled_filetypes = {
      winbar = {
        "checkhealth",
        "ministarter",
        "dapui_console",
        "dapui_stacks",
        "dapui_watches",
        "dapui_scopes",
        "dap-repl",
        "toggleterm",
        -- "trouble",
        -- "neo-tree",
        "vim",
        "help",
      },
    },
  },
  sections = {
    lualine_a = {
      {
        function()
          return " "
        end,
        padding = {
          left = 0,
          right = 0,
        },
      },
    },
    lualine_b = {
      {
        "branch",
        icon = "󰘬",
        padding = {
          left = 2,
          right = 1,
        },
      },
      {
        "diff",
        colored = true,
        symbols = {
          added = "N ",
          modified = "M ",
          removed = "D ",
        },
        padding = {
          left = 1,
          right = 1,
        },
      },
      {
        "%l:%c",
        padding = {
          left = 1,
          right = 1,
        },
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
      {
        "diagnostics",
        sources = {
          "nvim_diagnostic",
        },
        symbols = {
          error = "E:",
          warn = "W:",
          hint = "H:",
          info = "I:",
        },
        padding = {
          left = 1,
          right = 1,
        },
      },
      {
        function()
          local msg = "no lsp"
          local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
          local clients = vim.lsp.get_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        padding = {
          left = 1,
          right = 2,
        },
      },
    },
    lualine_z = {
      {
        function()
          return " "
        end,
        padding = {
          left = 0,
          right = 0,
        },
      },
    },
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        path = 3,
        file_status = true,
        color = "Normal",
        symbols = {
          unnamed = "Empty",
          newfile = "Empty",
        },
        padding = {
          left = 0,
          right = 0,
        },
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        path = 3,
        file_status = true,
        color = "Normal",
        symbols = {
          unnamed = "Empty",
          newfile = "Empty",
        },
        padding = {
          left = 0,
          right = 0,
        },
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
