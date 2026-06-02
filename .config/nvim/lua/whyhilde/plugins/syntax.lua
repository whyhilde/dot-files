return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  config = function()
    local ts = require("nvim-treesitter")


    ts.setup {}
    ts.install {
      "go",
      "gomod",
      "gosum",
      "lua",
      "python",
    }


    vim.api.nvim_create_autocmd("FileType", {
      pattern = require("nvim-treesitter.config").get_installed(),
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require(\"nvim-treesitter\").indentexpr()"
      end,
    })
  end,
}
