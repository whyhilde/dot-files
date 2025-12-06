return {
  "lukas-reineke/virt-column.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
    "BufNew",
  },
  config = function()
    vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#45475a" })


    require("virt-column").setup {
      enabled = true,
      virtcolumn = "100",
      char = "┃",
      highlight = "VirtColumn",
      exclude = {
        filetypes = {
          "dashboard",
        },
      },
    }
  end,
}
