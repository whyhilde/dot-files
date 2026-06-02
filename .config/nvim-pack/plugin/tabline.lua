require("mini.tabline").setup({
  show_icons = false,
  format = function(buf_id, label)
    if label == "*" then
      return " Empty "
    end
    return require("mini.tabline").default_format(buf_id, label)
  end,
  tabpage_section = "left",
})
