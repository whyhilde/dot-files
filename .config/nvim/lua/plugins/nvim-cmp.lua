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
      menu = {
        nvim_lsp = "LSP",
        buffer = "BUFFER",
        luasnip = "SNIPPET",
        path = "PATH",
        nvim_lua = "LUA",
      },
      symbol_map = {
        Array = "󰅨",
        Boolean = "",
        Class = "󰠱",
        Color = "󰏘",
        Constant = "󰏿",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        File = "",
        Folder = "",
        Function = "󰊕",
        Interface = "",
        Key = "󰌆",
        Keyword = "󰌆",
        Method = "󰖷",
        Module = "󰐱",
        Null = "",
        Number = "",
        Package = "󰏔",
        Property = "󰖷",
        Snippet = "",
        Struct = "",
        Text = "",
        Unit = "",
      },
    },
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-space>"] = cmp.mapping.complete(),
    ["<C-c>"] = cmp.mapping.abort(),
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
