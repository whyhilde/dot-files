return {
  "lukas-reineke/indent-blankline.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
    "BufNew",
  },
  config = function()
    -- vim.api.nvim_set_hl(0, "IndentBlanklineIndent", { fg = "#45475a" })
    -- vim.api.nvim_set_hl(0, "IndentBlanklineScope", { fg = "#89b4fa" })


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
