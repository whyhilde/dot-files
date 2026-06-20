return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  lazy = false,
  config = function()
    require("nvim-treesitter-textobjects").setup {}
  end,
  keys = {
    {
      mode = {
        "x",
        "o",
      },
      "af",
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
      end,
    },
    {
      mode = {
        "x",
        "o",
      },
      "if",
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
      end,
    },
    {
      mode = {
        "x",
        "o",
      },
      "ac",
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
      end,
    },
    {
      mode = {
        "x",
        "o",
      },
      "ic",
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
      end,
    },
    {
      mode = {
        "x",
        "o",
      },
      "as",
      function()
        require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
      end,
    },
    {
      mode = {
        "n",
        "o",
      },
      "]f",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_start(
          "@function.outer",
          "textobjects"
        )
      end,
    },
    {
      mode = {
        "n",
        "o",
      },
      "]F",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_end(
          "@function.outer",
          "textobjects"
        )
      end,
    },

    {
      mode = {
        "n",
        "o",
      },
      "[f",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_start(
          "@function.outer",
          "textobjects"
        )
      end,
    },
    {
      mode = {
        "n",
        "o",
      },
      "[F",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_end(
          "@function.outer",
          "textobjects"
        )
      end,
    },
  },
}
