return {
  "catppuccin/nvim",
  lazy = false,
  config = function()
    require("catppuccin").setup {
      flavour = "mocha",
      transparent_background = true,
      no_italic = true,
      no_bold = true,
      no_underline = true,
      integrations = {
        cmp = true,
        treesitter = true,
        telescope = true,
      },
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.flamingo },
          TabLineSel = { bg = colors.pink },
          CmpBorder = { fg = colors.surface2 },
          Pmenu = { bg = colors.none },
        }
      end,
    }
  end,
}
