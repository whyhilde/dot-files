local colors = require("util.colors")


local function modeColor()
  local color = {
    n = colors.blue,
    i = colors.green,
    v = colors.red,
    ["\22"] = colors.red,
    V = colors.red,
    c = colors.yellow,
    no = colors.red,
    s = colors.orange,
    S = colors.orange,
    ic = colors.lavender,
    R = colors.mauve,
    Rv = colors.lavender,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ["r?"] = colors.cyan,
    ["!"] = colors.red,
    t = colors.sky,
  }
  return {
    fg = colors.mantle,
    bg = color[vim.fn.mode()],
    gui = "bold",
  }
end


return {
  "nvim-lualine/lualine.nvim",
  event = "UIEnter",
  opts = {
    options = {
      component_separators = "",
      section_separators = "",
      theme = {
        normal = {
          a = {
            fg = colors.text,
          },
          b = {
            fg = colors.text,
            bg = colors.surface0,
          },
          c = {
            fg = colors.overlay2,
            bg = colors.base,
          },
        },
      },
      globalstatus = true,
      disabled_filetypes = {
        winbar = require("util.filetypes"),
      },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          color = modeColor,
          padding = {
            left = 2,
            right = 2,
          },
        },
      },
      lualine_b = {
        {
          "branch",
          icon = "󰘬",
          padding = {
            left = 2,
            right = 2,
          },
        },
      },
      lualine_c = {
        {
          "diff",
          colored = true,
          diff_color = {
            added = "StatuslineDiff",
            modified = "StatuslineDiff",
            removed = "StatuslineDiff",
          },
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
          padding = {
            left = 2,
            right = 1,
          },
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = {
            "nvim_diagnostic",
          },
          symbols = {
            error = " ",
            warn = " ",
            hint = " ",
            info = " ",
          },
          diagnostics_color = {
            error = {
              fg = colors.overlay2,
            },
            warn = {
              fg = colors.overlay2,
            },
            info = {
              fg = colors.overlay2,
            },
            hint = {
              fg = colors.overlay2,
            },
          },
        },
        {
          function()
            local msg = "No Active"
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
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
          icon = "LSP:",
          padding = {
            left = 1,
            right = 2,
          },
        },
      },
      lualine_y = {
        {
          function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          end,
          icon = "",
          padding = {
            left = 2,
            right = 2,
          },
        },
      },
      lualine_z = {
        {
          "%l:%c",
          color = modeColor,
          padding = {
            left = 2,
            right = 2,
          },
        },
      },
    },
  },
}
