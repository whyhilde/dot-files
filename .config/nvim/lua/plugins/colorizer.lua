return {
  "catgoose/nvim-colorizer.lua",
  event = {
    "BufReadPre",
    "BufNewFile",
    "BufNew",
  },
  opts = {
    filetypes = {
      "*",
    },
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = true,
      AARRGGBB = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      mode = "virtualtext",
      tailwind = false,
      sass = {
        enable = true,
        parsers = {
          "css",
        },
      },
      virtualtext = "■",
      always_update = false,
    },
    buftypes = {},
  },
}
