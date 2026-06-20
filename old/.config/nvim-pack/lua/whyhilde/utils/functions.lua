local M = {}


function M.augroup(name)
  return vim.api.nvim_create_augroup("general_" .. name, { clear = true })
end


local seconds_in_day = 60 * 60 * 24

function M.current_date()
  return require("luasnip").function_node(function()
    return os.date("%d-%m-%y")
  end)
end

function M.yesterday_date()
  return require("luasnip").function_node(function()
    return os.date("%d-%m-%y", os.time() - seconds_in_day)
  end)
end

function M.tomorrow_date()
  return require("luasnip").function_node(function()
    return os.date("%d-%m-%y", os.time() + seconds_in_day)
  end)
end


return M
