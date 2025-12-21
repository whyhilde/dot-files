require("lazy").setup {
  ui = {
    border = "rounded",
    size = {
      width = 0.75,
      height = 0.75,
    },
    icons = require("icons").plugins,
  },
  spec = {
    -- coding --
    require("coding.autopairs"),
    require("coding.debugger"),
    require("coding.formatter"),
    require("coding.indents"),
    require("coding.outline"),
    require("coding.syntax"),
    require("coding.vcs"),

    -- lsp --
    require("lsp.autocomplete"),
    require("lsp.config"),
    require("lsp.manager"),
    require("lsp.signature"),

    -- ui --
    require("ui.bufferline"),
    require("ui.dashboard"),
    require("ui.icons"),
    require("ui.improvement"),
    require("ui.notifications"),
    require("ui.scrollbar"),
    require("ui.statusline"),
    require("ui.theme"),

    -- utils --
    require("utils.breadcrumbs"),
    require("utils.colorizer"),
    require("utils.explorer"),
    require("utils.finder"),
    require("utils.session"),
    require("utils.terminal"),
    require("utils.todocomments"),
    require("utils.troubleshoots"),
  },
}
