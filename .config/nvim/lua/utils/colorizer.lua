-- return {
--   "norcalli/nvim-colorizer.lua",
--   event = {
--     "BufReadPre",
--     "BufNewFile",
--     "BufNew",
--   },
--   opts = {},
-- }


return {
  "nvim-mini/mini.hipatterns",
  version = "*",
  event = {
    "BufReadPre",
    "BufNewFile",
    "BufNew",
  },
  config = function()
    require("mini.hipatterns").setup {
      highlighters = {
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
      },
    }
  end,
}
