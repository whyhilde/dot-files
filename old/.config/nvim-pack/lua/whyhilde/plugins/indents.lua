return {
  "lukas-reineke/indent-blankline.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
    "BufNew",
  },
  config = function()
    require("ibl").setup {
      indent = {
        char = "│",
        highlight = "IndentBlanklineIndent",
        smart_indent_cap = true,
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        char = "│",
        highlight = "IndentBlanklineScope",
      },
      exclude = {
        filetypes = {
          "dashboard",
        },
      },
    }
  end,
}
