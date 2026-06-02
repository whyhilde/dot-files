require("mini.snippets").setup({
  snippets = {
    require("mini.snippets").gen_loader.from_lang(),
  },
  mappings = {
    expand = "",
    jump_next = "",
    jump_prev = "",
    stop = "",
  },
})


require("mini.snippets").start_lsp_server()
