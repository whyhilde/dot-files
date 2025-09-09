local function header()
  return {
    "",
    "",
    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓███████▓▒░░▒▓████████▓▒░ ",
    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ",
    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ",
    "░▒▓████████▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░   ",
    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ",
    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ",
    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░░▒▓████████▓▒░ ",
    "",
    "",
    "",
  }
end


require("dashboard").setup {
  theme = "doom",
  config = {
    header = header(),
    center = {
      {
      desc = "󰈔  New file",
      desc_hl = "Comment",
      key = "e",
      key_hl = "Comment",
      key_format = "%s",
      action = ":enew",
      },
      {
      desc = "  File tree",
      desc_hl = "Comment",
      key = "n",
      key_hl = "Comment",
      key_format = "%s",
      action = ":NvimTreeToggle",
      },
      {
      desc = "󰱼  Find file",
      desc_hl = "Comment",
      key = "f",
      key_hl = "Comment",
      key_format = "%s",
      action = ":Telescope find_files",
      },
      {
      desc = "󱇧  Recent",
      desc_hl = "Comment",
      key = "r",
      key_hl = "Comment",
      key_format = "%s",
      action = ":Telescope oldfiles",
      },
      {
      desc = "󰈆  Quit                       ",
      desc_hl = "Comment",
      key = "q",
      key_hl = "Comment",
      key_format = "%s",
      action = ":q",
      },
    },
    footer = {
    },
    vertical_center = true,
  },
}
