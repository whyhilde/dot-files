vim.keymap.set("n", "<leader>fc", function()
  require("conform").format({
    async = true,
    lsp_fallback = true,
  })
end)

vim.keymap.set("v", "<leader>fc", function()
  require("conform").format({
    async = true,
    lsp_fallback = true,
  })
end)
