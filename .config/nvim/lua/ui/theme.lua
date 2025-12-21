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
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        miscs = {},
      },
      integrations = {
        cmp = true,
        treesitter = true,
        telescope = true,
      },
    }
  end,
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
}
