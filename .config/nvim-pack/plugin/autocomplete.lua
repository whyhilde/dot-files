local cmp = require("cmp")
cmp.setup({
  -- snippet = {
  --   expand = function(args)
  --     require("luasnip").lsp_expand(args.body)
  --   end,
  -- },
  window = {
    completion = cmp.config.window.bordered {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CmpCursorLine,Search:None",
      border = "bold",
      scrollbar = false,
      max_height = 6,
    },
    documentation = cmp.config.window.bordered {
      border = "bold",
      max_height = 6,
      max_width = 25,
    },
  },
  formatting = {
    fields = {
      "abbr",
      "kind",
    },
  },
  mapping = cmp.mapping.preset.insert {
    ["<c-j>"] = cmp.mapping.select_next_item(),
    ["<c-k>"] = cmp.mapping.select_prev_item(),
    ["<c-space>"] = cmp.mapping.complete(),
    ["<c-c>"] = cmp.mapping.abort(),
    ["<cr>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    -- { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
})
