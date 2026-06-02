local dir = vim.fn.stdpath("config") .. "/colors/"


local themes = {}
for _, file in ipairs(vim.fn.globpath(dir, "*.lua", false, true)) do
  local name = vim.fn.fnamemodify(file, ":t:r")
  if name ~= "random" then
    table.insert(themes, name)
  end
end


if #themes > 0 then
  math.randomseed(os.time())
  local chosen = themes[math.random(#themes)]
  dofile(dir .. chosen .. ".lua")
end
