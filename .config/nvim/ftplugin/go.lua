-- local core = require("whyhilde.functions.core")
-- local lint_helpers = require("whyhilde.functions.lint")
local toggle_helper = require("whyhilde.functions.test")
-- local toggle_helper = require "ilyasyoy.functions.toggle_test"


local function setup_lsp_actions()
  local map = vim.keymap.set

  map("n", "<localleader>jl",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        filter = function(x)
          return x.kind == "refactor.rewrite.joinLines"
        end,
      }
    end,
    {
      buffer = true,
    }
  )

  map("n", "<localleader>sl",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        filter = function(x)
          return x.kind == "refactor.rewrite.splitLines"
        end,
      }
    end,
    {
      buffer = true,
    }
  )

  map("n", "<localleader>oi",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        filter = function(x)
          return x.kind == "source.organizeImports"
        end,
      }
    end,
    {
      buffer = true,
    }
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>em",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.method"
        end,
      }
    end,
    {
      buffer = true,
    }
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>ef",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.function"
        end,
      }
    end,
    {
      buffer = true,
    }
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>eC",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.constant-all"
        end,
      }
    end,
    {
      buffer = true,
    }
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>ec",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.constant"
        end,
      }
    end,
    {
      buffer = true,
    }
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>eV",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.variable-all"
        end,
      }
    end,
    {
      buffer = true,
    }
  )

  map(
    {
      "v",
      "s",
    },
    "<localleader>ev",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        filter = function(x)
          return x.kind == "refactor.extract.variable"
        end,
      }
    end,
    {
      buffer = true,
    }
  )

  map("n", "<localleader>fs",
    function()
      vim.lsp.buf.code_action {
        filter = function(x)
          return x.kind == "refactor.rewrite.fillStruct"
        end,
      }
    end,
    {
      buffer = true,
    }
  )

  map("n", "<localleader>fS",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        filter = function(x)
          return x.kind == "refactor.rewrite.fillStruct"
        end,
      }
    end,
    {
      buffer = true,
    }
  )
end


local function setup_debugger()
  require("dap").adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
      command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
      args = {
        "dap",
        "-l",
        "127.0.0.1:${port}",
      },
    },
  }

  require("dap").configurations.go = {
    {
      type = "delve",
      name = "debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "delve",
      name = "debug package",
      request = "launch",
      program = "${workspaceFolder}",
    },
  }
end


local function setup_toggle()
  vim.api.nvim_buf_create_user_command(0, "GoToggleTest",
    function()
      local cwf = vim.fn.expand("%:.")
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


local function setup_snippets()
  local ls = require("luasnip")
  local fmt = require("luasnip.extras.fmt").fmt
  local t = ls.text_node
  local s = ls.snippet
  local i = ls.insert_node

  local function in_func()
    local current_node = vim.treesitter.get_node()
    if not current_node then
      return false
    end
    local expr = current_node

    while expr do
      if expr:type() == "function_declaration" or expr:type() == "method_declaration" then
        return true
      end
      expr = expr:parent()
    end

    return false
  end

  local function is_in_test_file()
    local filename = vim.fn.expand("%:p")
    return vim.endswith(filename, "_test.go")
  end

  local function is_in_test_function()
    return is_in_test_file() and in_func()
  end

  local in_test_fn = {
    show_condition = is_in_test_function,
    condition = is_in_test_function,
  }

  require("luasnip").add_snippets("go",
    {
      s("ctxb", t "ctx := context.Background()"),
      s(
        "ctxbc",
        t [[
        ctx, cancel := context.WithCancel(context.Background())
        defer cancel()
        ]]
      ),
      s(
        "trun",
        fmt(
          [[
          t.Run({}, func(t *testing.T) {{
          {}
          }})
          ]],
          {
            i(1, "test case"),
            i(0, ""),
          }
        ),
        in_test_fn
      ),
      s(
        "reqne",
        fmt(
          [[
          require.NoError(t, {})
          ]],
          {
            i(0, "gotErr"),
          }
        ),
        in_test_fn
      ),
      s(
        "reqei",
        fmt(
          [[
          require.ErrorIs(t, {}, {})
          ]],
          {
            i(1, "want"),
            i(0, "got"),
          }
        ),
        in_test_fn
      ),
      s(
        {
          trig = "test",
          dscr = "Go test function",
        },
        fmt(
          [[
          func Test{}(t *testing.T) {{
          {}
          }}
          ]],
          {
            i(1, "Name"),
            i(0, "")
          }
        ),
        {
          show_condition = is_in_test_file,
          condition = is_in_test_file
        }
      ),
    }
  )
end


setup_lsp_actions()
setup_debugger()
-- setup_toggle()
setup_snippets()
-- setup_linters()


toggle_helper.setup {
  command = "GoToggleTest",
  rules = {
    {
      detect = "_test%.go$",
      gsub_pattern = "(%w+)_test%.go$",
      gsub_replacement = "%1.go",
    },
    {
      detect = "%.go$",
      gsub_pattern = "(%w+)%.go$",
      gsub_replacement = "%1_test.go",
    },
  },
}
