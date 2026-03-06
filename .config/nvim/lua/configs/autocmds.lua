local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup("general_" .. name, { clear = true })
end


-- check for spell in text filetypes
autocmd("FileType", {
  group = augroup("spell"),
  pattern = {
    "text",
    "markdown",
  },
  callback = function()
    vim.opt_local.spelllang = {
      "ru",
      "en",
    }
    vim.opt_local.spell = true
  end,
})


-- highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual",
      timeout = 500,
      on_visual = true,
    })
  end,
})


-- open :help with vertical split
autocmd("BufWinEnter", {
  pattern = {
    "*.txt",
  },
  group = augroup("open_help"),
  callback = function()
    if vim.bo.filetype == "help" then
      vim.cmd.wincmd("L")
    end
  end,
})
