return {
  "nvimdev/dashboard-nvim",
  lazy = false,
  config = function()
    local function header()
      return {
        "",
        "",
        "",
        "",
        "",
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "",
        "",
      }
    end


    local function footer()
      return {
        "",
        " eovim configured by whyhilde",
      }
    end


    require("dashboard").setup {
      theme = "doom",
      config = {
        header = header(),
        center = {
          {
            desc = "New File",
            desc_hl = "MyDashboardDesc",
            key = "e",
            key_hl = "MyDashboardKey",
            key_format = "(%s)",
            action = ":enew",
          },
          {
            desc = "Find Files",
            desc_hl = "MyDashboardDesc",
            key = "f",
            key_hl = "MyDashboardKey",
            key_format = "(%s)",
            action = ":Telescope find_files",
          },
          {
            desc = "Recent Files",
            desc_hl = "MyDashboardDesc",
            key = "r",
            key_hl = "MyDashboardKey",
            key_format = "(%s)",
            action = ":Telescope oldfiles",
          },
          {
            desc = "Restore Session",
            desc_hl = "MyDashboardDesc",
            key = "s",
            key_hl = "MyDashboardKey",
            key_format = "(%s)",
            action = ":lua require(\"persistence\").load({ last = true })",
          },
          {
            desc = "Quit Nvim                      ",
            desc_hl = "MyDashboardDesc",
            key = "q",
            key_hl = "MyDashboardKey",
            key_format = "(%s)",
            action = ":q",
          },
        },
        footer = footer(),
        vertical_center = true,
      },
    }


    -- vim.api.nvim_set_hl(0, "MyDashboardDesc", { link = "Comment" })
    -- vim.api.nvim_set_hl(0, "MyDashboardKey", { link = "Comment" })
  end,
}
