require("mini.statusline").setup({
  content = {
    active = function()
      local mode, mode_hl = require("mini.statusline").section_mode({
        trunc_width = 120,
      })

      local git = function()
        local branch = require("mini.statusline").section_git({
          icon = "git"
        })
        if branch == "" then
          return "no git"
        end
        return branch
      end

      local diff = require("mini.statusline").section_diff({
        trunc_width = 75,
        icon = "diff",
      })

      local diagnostics = require("mini.statusline").section_diagnostics({
        trunc_width = 75,
        icon = "diag",
      })

      local fileformat = vim.bo.fileformat

      local fileencoding = vim.bo.fileencoding

      local location = "%l:%c"

      return require("mini.statusline").combine_groups({
        {
          hl = mode_hl,
          strings = {
            mode,
          },
        },
        {
          hl = "MiniStatuslineDevinfo",
          strings = {
            git(),
          },
        },
        {
          hl = "MiniStatuslineFilename",
          strings = {
            diff,
          },
        },
        "%=",
        {
          hl = "MiniStatuslineFilename",
          strings = {
            diagnostics,
          },
        },
        {
          hl = "MiniStatuslineFileinfo",
          strings = {
            fileformat,
            fileencoding,
          },
        },
        {
          hl = mode_hl,
          strings = {
            location,
          },
        },
      })
    end,
    inactive = nil,
  },
  use_icons = false,
})
