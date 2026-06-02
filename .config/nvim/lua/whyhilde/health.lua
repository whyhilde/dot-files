local M = {}


local start = vim.health.start or vim.health.report_start
local ok = vim.health.ok or vim.health.report_ok
local warn = vim.health.warn or vim.health.report_warn
local error = vim.health.error or vim.health.report_error


function M.check()
  start("neovim version")
  if vim.fn.has("nvim-0.11.0") == 1 then
    ok("neovim >= 0.11.0")
  else
    error("neovim >= 0.11.0 is required")
  end

  start("dependencies")
  for _, cmd in ipairs({ "git", "curl", "rg", "fd", }) do
    local name = type(cmd) == "string" and cmd or vim.inspect(cmd)
    local commands = type(cmd) == "string" and { cmd } or cmd
    local found = false

    for _, c in ipairs(commands) do
      if vim.fn.executable(c) == 1 then
        name = c
        found = true
      end
    end

    if found then
      ok(("%s is installed"):format(name))
    else
      warn(("%s is not installed"):format(name))
    end
  end

  start("treesitter")
  local has_treesitter = pcall(require, "nvim-treesitter")
  if has_treesitter then
    ok("nvim-treesitter is installed")

    local has_gcc = vim.fn.executable("gcc") == 1
    local has_clang = vim.fn.executable("clang") == 1

    if has_gcc or has_clang then
      ok("c compiler is installed")
    else
      error("c compiler is not installed")
    end

    if vim.fn.executable("tree-sitter") == 1 then
      ok("tree-sitter-cli is installed")
    else
      error("tree-sitter-cli is not installed")
    end

  else
    error("nvim-treesitter is not installed")
  end
end


return M
