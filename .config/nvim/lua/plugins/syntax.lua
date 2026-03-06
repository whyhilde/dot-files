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


    vim.bo.indentexpr = "v:lua.require(\"nvim-treesitter\").indentexpr()"


    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "go",
        "gomod",
        "gosum",
        "lua",
        "python",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })

    -- require("nvim-treesitter.configs").setup {
    --   auto_install = true,
    --   ensure_installed = {
    --     "rust",
    --     "lua",
    --     "python",
    --   },
    --   highlight = {
    --     enable = true,
    --   },
    --   indent = {
    --     enable = true,
    --   },
    --   incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --       init_selection = "gn",
    --       node_incremental = "gn",
    --       scope_incremental = "gs",
    --       node_decremental = "gm",
    --     },
    --   },
    --   textobjects = {
    --     select = {
    --       enable = true,
    --       keymaps = {
    --         ["af"] = "@function.outer",
    --         ["if"] = "@function.inner",
    --         ["ac"] = "@class.outer",
    --         ["ic"] = "@class.inner",
    --       },
    --     },
    --   },
    -- }
  end,
}
