local function header()
  return {
    "",
    "",
    " _      ____        __   _ __   __   ",
    "| | /| / / /  __ __/ /  (_) /__/ /__ ",
    "| |/ |/ / _ \\/ // / _ \\/ / / _  / -_)",
    "|__/|__/_//_/\\_, /_//_/_/_/\\_,_/\\__/ ",
    "            /___/                    ",
    "",
    "(configuration by whyhilde)",
    "",
  }
end


require("dashboard").setup {
  theme = "doom",
  config = {
    header = header(),
    center = {
      {
      desc = "  Make new file",
      desc_hl = "Comment",
      key = "n",
      key_hl = "Comment",
      key_format = "%s",
      action = "enew",
      },
      {
      desc = "  File explorer",
      desc_hl = "Comment",
      key = "t",
      key_hl = "Comment",
      key_format = "%s",
      action = ":NvimTreeToggle",
      },
      {
      desc = "  Find files",
      desc_hl = "Comment",
      key = "f",
      key_hl = "Comment",
      key_format = "%s",
      action = ":Telescope find_files",
      },
      {
      desc = "  Find commands",
      desc_hl = "Comment",
      key = "c",
      key_hl = "Comment",
      key_format = "%s",
      action = ":Telescope command_history",
      },
      {
      desc = "  Find git branches          ",
      desc_hl = "Comment",
      key = "b",
      key_hl = "Comment",
      key_format = "%s",
      action = ":Telescope git_branches",
      },
      {
      desc = "󰈆  Quit neovim",
      desc_hl = "Comment",
      key = "q",
      key_hl = "Comment",
      key_format = "%s",
      action = "q",
      },
    },
    footer = {
    },
    vertical_center = true,
  },
}
