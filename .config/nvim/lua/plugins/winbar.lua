return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.winbar = {
      lualine_a = {
        {
          "filetype",
          icon_only = true,
          colored = true,
          cond = function()
            return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
          end,
          padding = {
            left = 1,
            right = 0,
          },
        },
        {
          "filename",
          path = 3,
          file_status = false,
          symbols = {
            unnamed = " 󰈚 Empty",
            newfile = " 󰈚 Empty",
          },
          padding = {
            left = 0,
            right = 0,
          },
        },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }
    opts.inactive_winbar = {
      lualine_a = {
        {
          "filetype",
          icon_only = true,
          colored = true,
          cond = function()
            return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
          end,
          padding = {
            left = 1,
            right = 0,
          },
        },
        {
          "filename",
          path = 3,
          file_status = false,
          symbols = {
            unnamed = " 󰈚 Empty",
            newfile = " 󰈚 Empty",
          },
          padding = {
            left = 0,
            right = 0,
          },
        },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }
  end,
}
