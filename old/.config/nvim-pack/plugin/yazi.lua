require("yazi").setup({
  open_for_directories = true,
  floating_window_scaling_factor = 0.8,
  yazi_floating_window_border = "bold",
})

vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<leader>e", "<cmd>Yazi<cr>")
