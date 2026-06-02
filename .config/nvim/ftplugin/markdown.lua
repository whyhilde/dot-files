vim.opt_local.spell = true
vim.opt_local.wrap = true


local function setup_formatters()
  local map = vim.keymap.set

  map("v", "<localleader>fi",
    function()
      return "c*<C-r>-*<Esc>"
    end,
    {
      expr = true,
      buffer = true,
      desc = "wrap selected text with italic markers (*)",
    }
  )

  map("v", "<localleader>fb",
    function()
      return "c**<C-r>-**<Esc>"
    end,
    {
      expr = true,
      buffer = true,
      desc = "wrap selected text with bold markers (**)",
    }
  )

  map("v", "<localleader>fc",
    function()
      return "c`<C-r>-`<Esc>"
    end,
    {
      expr = true,
      buffer = true,
      desc = "wrap selected text with code markers (`)",
    }
  )

  map("v", "<localleader>fl",
    function()
      return "c[<C-r>-](<C-r>+)<Esc>"
    end,
    {
      expr = true,
      buffer = true,
      desc = "wrap selected text with link ([]()), link valus is + register",
    }
  )
end


setup_formatters()
