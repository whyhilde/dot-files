return {
  "L3MON4D3/LuaSnip",
  event = "VeryLazy",
  config = function()
    local function snippet(lang, path)
      require("luasnip").add_snippets(lang, require(path))
    end

    -- ls.add_snippets("go", require("languages.snippets.go"))
    -- snippet("go", "languages.snippets.go")
  end,
}
