local M = {}


M.lsp = function()
  vim.lsp.enable(
    "rust_analyzer",
    {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      cmd = {
        vim.fn.stdpath("data") .. "/mason/bin/rust-analyzer",
      },
      settings = {
        ["rust-analyzer"] = {
          inlayHints = {
            enable = true,
            parameterHints = {
              enable = true,
            },
            typeHints = {
              enable = true,
              hideNamedConstructor = false,
            },
            chainingHints = {
              enable = true,
            },
            closureReturnTypeHints = {
              enable = "always",
            },
          },
        },
      },
      root = {
        "Cargo.toml",
      },
      filetypes = {
        "rust",
      },
    }
  )
end


M.test = function()
  require("rustaceanvim.neotest")
end


M.debug = function()
  require("dap").adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
      args = {
        "--port",
        "${port}",
      },
    },
  }

  require("dap").configurations.rust = {
    {
      name = "launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local cwd = vim.fn.getcwd()
        local cargo_toml = cwd .. "/Cargo.toml"

        if vim.fn.filereadable(cargo_toml) == 1 then
          local f = io.open(cargo_toml, "r")
          if f then
            local content = f:read("*all")
            f:close()
            local name = content:match('name%s*=%s*"([^"]+)"')
            if name then
              return cwd .. "/target/debug/" .. name
            end
          end
        end
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    },
  }
end


M.plugins = {
  {
    "Saecki/crates.nvim",
    event = {
      "BufRead Cargo.toml",
    },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    lazy = true,
    opts = {
      server = {
        auto_attach = false,
      },
    },
  },
}


M.formatter = {
  rust = {
    "rustfmt",
  },
  rustfmt = {
    command = vim.fn.stdpath("data") .. "/mason/bin/rustfmt",
  },
}


return M
