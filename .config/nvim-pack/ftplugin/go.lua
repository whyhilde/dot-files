local function setup_lsp()
  vim.lsp.config(
    "gopls",
    {
      filetypes = {
        "go",
        "gomod",
        "gowork",
        "gotmpl",
      },
      settings = {
        gopls = {
          gofumpt = true,
          completeUnimported = true,
          usePlaceholders = false,
          staticcheck = true,
        },
      },
    }
  )

  vim.lsp.enable("gopls")


  local map = vim.keymap.set
  local buf = {
    buffer = true,
  }

  map("n", "<localleader>jl",
    function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(x)
          return x.kind == "refactor.rewrite.joinLines"
        end,
      })
    end,
    buf
  )

  map("n", "<localleader>sl",
    function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(x)
          return x.kind == "refactor.rewrite.splitLines"
        end,
      })
    end,
    buf
  )

  map("n", "<localleader>oi",
    function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(x)
          return x.kind == "source.organizeImports"
        end,
      })
    end,
    buf
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>em",
    function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.method"
        end,
      })
    end,
    buf
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>ef",
    function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.function"
        end,
      })
    end,
    buf
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>eC",
    function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.constant-all"
        end,
      })
    end,
    buf
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>ec",
    function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.constant"
        end,
      })
    end,
    buf
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>eV",
    function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.variable-all"
        end,
      })
    end,
    buf
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>ev",
    function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.variable"
        end,
      })
    end,
    buf
  )

  map("n", "<localleader>fs",
    function()
      vim.lsp.buf.code_action({
        filter = function(x)
          return x.kind == "refactor.rewrite.fillStruct"
        end,
      })
    end,
    buf
  )

  map("n", "<localleader>fS",
    function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(x)
          return x.kind == "refactor.rewrite.fillStruct"
        end,
      })
    end,
    buf
  )
end


local function setup_toggle()
  vim.api.nvim_buf_create_user_command(0, "GoToggleTest",
    function()
      local cwf = vim.fn.expand "%:."
      if string.find(cwf, "_test%.go$") then
        vim.fn.execute(
          "edit " .. string.gsub(cwf, "(%w+)_test%.go$", "%1.go")
        )
      elseif string.find(cwf, "%.go$") then
        vim.fn.execute(
          "edit " .. string.gsub(cwf, "(%w+)%.go$", "%1_test.go")
        )
      end
    end,
    {
      desc = "toggle between test and source code",
    }
  )

  vim.keymap.set("n", "<localleader>ot", "<cmd>GoToggleTest<cr>",
    {
      desc = "toggle between test and source code",
      buffer = true,
    }
  )
end


require("conform").setup({
  formatters_by_ft = {
    go = {
      "gofumpt",
      "golines",
    },
  },
  formatters = {
    golines = {
      args = {
        "--max-len=80",
        "--base-formatter=gofumpt",
        "--shorten-comments",
      },
    },
  },
})


setup_lsp()
setup_toggle()
