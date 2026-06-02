require("nvim-treesitter").setup()

vim.g.no_plugin_maps = true
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
    include_surrounding_whitespace = false,
  },
  move = {
    set_jumps = true,
  },
})

require("treesitter-context").setup({
  enable = true,
  multiwindow = false,
  max_lines = 3,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 20,
  trim_scope = "outer",
  mode = "cursor",
  separator = "━",
  zindex = 20,
})

require("nvim-treesitter").install({
  "bash",
  "c",
  "cpp",
  "css",
  "dockerfile",
  "git_config",
  "gitignore",
  "go",
  "gomod",
  "gosum",
  "gotmpl",
  "gowork",
  "html",
  "lua",
  "markdown",
  "python",
  "rust",
  "toml",
})


local function setup_selects()
  local select = require("nvim-treesitter-textobjects.select").select_textobject

  vim.keymap.set({ "x", "o" }, "af", function() select("@function.outer", "textobjects") end)
  vim.keymap.set({ "x", "o" }, "if", function() select("@function.inner", "textobjects") end)
  vim.keymap.set({ "x", "o" }, "ac", function() select("@class.outer", "textobjects") end)
  vim.keymap.set({ "x", "o" }, "ic", function() select("@class.inner", "textobjects") end)
end


vim.api.nvim_create_autocmd("FileType",
  {
    pattern = require("nvim-treesitter.config").get_installed(),
    callback = function()
      vim.treesitter.start()
      vim.bo.indentexpr = "v:lua.require(\"nvim-treesitter\").indentexpr()"
      setup_selects()
    end,
  }
)
