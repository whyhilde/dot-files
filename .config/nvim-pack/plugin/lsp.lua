vim.api.nvim_create_autocmd(
  "LspAttach",
  {
    once = true,
    callback = function()
      vim.diagnostic.config({
        virtual_text = false,
        update_in_insert = false,
        underline = false,
        severity_sort = true,
        float = {
          border = "bold",
          header = "diagnostics",
          max_width = 70,
          severity_sort = true,
        },
      })


      local map = vim.keymap.set

      map(
        "n",
        "<leader>d",
        vim.diagnostic.open_float,
        {
          desc = "show diagnostic of current line",
        }
      )

      map(
        "n",
        "grd",
        vim.lsp.buf.definition,
        {
          desc = "go to definitions",
        }
      )

      map(
        "n",
        "grD",
        vim.lsp.buf.declaration,
        {
          desc = "go to declaration",
        }
      )
    end,
  }
)
