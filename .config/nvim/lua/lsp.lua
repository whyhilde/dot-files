vim.diagnostic.config {
  virtual_text = false,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    source = "always",
    border = "rounded",
  },
  signs = true,
  signs = {
    text = {
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.ERROR] = "",
    },
  },
}
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
require("mason").setup {
  automatic_installation = false,
  ensure_installed = {
    "rust-analyzer",
    "rustfmt",
    "codelldb",
    "clangd"
  },
  ui = {
    check_outdated_packages_on_open = true,
    border = "rounded",
    height = 0.75,
    width = 0.75,
    icons = require("icons").manager,
  },
}
vim.lsp.enable('pyright', {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "py" },
})
vim.lsp.enable('clangd', {
capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--completion-style=detailed",
    "--offset-encoding=utf-16",
  },
  filetypes = {
    "c", "cpp",
  },
})
vim.lsp.enable('cssls', {
  cmd = { "vscode-css-language-server", "--stdio" },
filetypes = { "css", "scss", "less" },
root_dir = function(fname)
      return root_pattern(fname) or vim.loop.os_homedir()
    end,
settings = {
  css = {
    validate = true
  },
  less = {
    validate = true
  },
  scss = {
    validate = true
  },
}
})
vim.lsp.enable('bashls', {
  cmd = { "bash-language-server", "start" },
cmd_env = {
  GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
},
filetypes = { "sh", "bash","zsh"},
root_dir = function(path)
      if not path or #path == 0 then
        return
      end
      local result = path:gsub(strip_sep_pat, ''):gsub(strip_dir_pat, '')
      if #result == 0 then
        return '/'
      end
      return result
    end
})
vim.lsp.enable ('lua_ls', {
  filetypes = { "lua" },
  log_level = 2,

  settings = {
    Lua = {
      telemetry = {
        enable = false
    },
  },
},
})

