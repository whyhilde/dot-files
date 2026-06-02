require("mini.icons").setup({
  style = "glyph",
  default = {},
  directory = {},
  extension = {},
  file = {
    ["init.lua"] = { glyph = "", hl = "MiniIconsAzure", },
  },
  filetype = {
    sh = { glyph = "", hl = "MiniIconsGreen", },
    go = { glyph = "", hl = "MiniIconsAzure", },
    python = { glyph = "", hl = "MiniIconsYellow", },
    c = { glyph = "", hl = "MiniIconsBlue", },
    cpp = { glyph = "", hl = "MiniIconsBlue", },
  },
  lsp = {},
  os = {},
})


require("mini.icons").mock_nvim_web_devicons()
