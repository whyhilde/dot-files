vim.pack.add({
  {
    src = "https://github.com/catppuccin/nvim",
    name = "catppuccin",
  },
})

require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = false,
  float = {
    transparent = true,
  },
  no_italic = true,
  no_bold = true,
  no_underline = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    treesitter = true,
  },
  custom_highlights = function(p)
    return {
      TabLineSel = { bg = p.blue },
      CmpCursorLine = { fg = p.mantle, bg = p.blue },
      Visual = { bg = p.surface0 },
    }
  end,
})

require("catppuccin").load()
