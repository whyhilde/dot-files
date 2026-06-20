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
      map("n", "<leader>ll", vim.diagnostic.open_float, { desc = "lsp diagnostic" })
      map("n", "<leader>lh", vim.lsp.buf.hover, { desc = "lsp hover" })
      map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "go to definitions" })
      map("n", "<leader>lD", vim.lsp.buf.declaration, { desc = "go to declaration" })
    end,
  }
)
