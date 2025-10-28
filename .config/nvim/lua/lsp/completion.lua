local cmp = require("cmp")
local lspkind = require("lspkind")


cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      scrollbar = false,
    },
    documentation = cmp.config.disable,
  },
  formatting = {
    format = lspkind.cmp_format {
      mode = "symbol_text",
      maxwidth = 20,
      ellipsis_char = "..",
      preset = "codicons",
      symbol_map = require("icons").completion,
      menu = {},
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
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
}


vim.opt.pumheight = 6
