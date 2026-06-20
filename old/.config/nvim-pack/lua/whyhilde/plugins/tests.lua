return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",

    "nvim-neotest/neotest-go",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require("neotest-go")({}),
      },
    }
  end,
  keys = {
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
    },
  },
}
