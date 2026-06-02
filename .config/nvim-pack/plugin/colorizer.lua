require("colorizer").setup({
  filetypes = {
    "*",
  },
  buftypes = {},
  user_commands = true,
  lazy_load = false,
  options = {
    parsers = {
      css = false,
      css_fn = false,
      names = {
        enable = false,
      },
      hex = {
        default = true,
        rgb = true,
        rgba = true,
        rrggbb = true,
        rrggbbaa = false,
        hash_aarrggbb = false,
        aarrggbb = false,
        no_hash = false,
      },
      rgb = {
        enable = true,
      },
      hsl = {
        enable = false,
      },
      oklch = {
        enable = false,
      },
      hwb = {
        enable = false,
      },
      lab = {
        enable = false,
      },
      lch = {
        enable = false,
      },
      css_color = {
        enable = false,
      },
      xterm = {
        enable = false,
      },
      css_var_rgb = {
        enable = false,
      },
      css_var = {
        enable = true,
        parsers = {
          css = true,
        },
      },
    },
    display = {
      mode = "background",
      background = {
        bright_fg = "#000000",
        dark_fg = "#ffffff",
      },
      priority = {
        default = 150,
        lsp = 200,
      },
      disable_document_color = true,
    },
    always_update = false,
    debounce_ms = 0,
  },
})
