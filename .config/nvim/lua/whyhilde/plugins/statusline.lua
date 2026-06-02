gruvbox = {
  normal = {
    a = { bg = "#928374", fg = "#282828", gui = "bold" },
    b = { bg = "#504945", fg = "#ebdbb2" },
    c = { bg = "#3c3836", fg = "#a89984" },
  },
  insert = {
    a = { bg = "#7daea3", fg = "#282828", gui = "bold" },
    b = { bg = "#504945", fg = "#ebdbb2" },
    c = { bg = "#3c3836", fg = "#a89984" },
  },
  visual = {
    a = { bg = "#d8a657", fg = "#282828", gui = "bold" },
    b = { bg = "#504945", fg = "#ebdbb2" },
    c = { bg = "#3c3836", fg = "#a89984" },
  },
  replace = {
    a = { bg = "#ea6962", fg = "#282828", gui = "bold" },
    b = { bg = "#504945", fg = "#ebdbb2" },
    c = { bg = "#3c3836", fg = "#a89984" },
  },
  command = {
    a = { bg = "#a9b665", fg = "#282828", gui = "bold" },
    b = { bg = "#504945", fg = "#ebdbb2" },
    c = { bg = "#3c3836", fg = "#a89984" },
  },
}


return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      component_separators = "",
      section_separators = "",
      theme = gruvbox,
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
          "trouble",
          "neo-tree",
          "vim",
        },
      },
    },
    sections = {
      lualine_a = {
        {
          "mode",
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
          padding = {
            left = 1,
            right = 2,
          },
        },
      },
      lualine_y = {
        {
          function()
            local msg = "no active"
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
          icon = "LSP ~",
          padding = {
            left = 2,
            right = 2,
          },
        },
      },
      lualine_z = {
        {
          "%l:%c",
          padding = {
            left = 2,
            right = 2,
          },
        },
      },
    },
  },
}
