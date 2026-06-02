return {
  "kylechui/nvim-surround",
  version = "*",
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufNew",
  },
  opts = {
    aliases = {
      ["b"] = ")",
      ["B"] = "}",
      ["q"] = "\"",
    },
  },
}
