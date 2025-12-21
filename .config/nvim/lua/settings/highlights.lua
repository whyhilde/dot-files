local hl = vim.api.nvim_set_hl


-- general --
hl(0, "FloatBorder", { fg = "#89b4fa", bg = "NONE" })
hl(0, "SignColumn", { fg = "NONE" })


-- indents --
hl(0, "IndentBlanklineIndent", { fg = "#45475a" })
hl(0, "IndentBlanklineScope", { fg = "#89b4fa" })


-- autocomplete --
hl(0, "CmpCursorLine", { fg = "#11111b", bg = "#89b4fa" })


-- dashboard --
hl(0, "DashboardHeader", { fg = "#89b4fa" })
hl(0, "DashboardFooter", { fg = "#89b4fa" })
hl(0, "MyDashboardDesc", { link = "Comment" })
hl(0, "MyDashboardKey", { link = "Comment" })


-- icons --
hl(0, "MiniIconsGrey", { fg = "#a6adc8" })


-- notifications --
hl(0, "NotifyERRORBorder", { fg = "#f38ba8" })
hl(0, "NotifyWARNBorder", { fg = "#f9e2af" })
hl(0, "NotifyINFOBorder", { fg = "#a6e3a1" })
hl(0, "NotifyDEBUGBorder", { fg = "#89b4fa" })
hl(0, "NotifyTRACEBorder", { fg = "#bac2de" })
hl(0, "NotifyERRORIcon", { fg = "#f38ba8" })
hl(0, "NotifyWARNIcon", { fg = "#f9e2af" })
hl(0, "NotifyINFOIcon", { fg = "#a6e3a1" })
hl(0, "NotifyDEBUGIcon", { fg = "#89b4fa" })
hl(0, "NotifyTRACEIcon", { fg = "#bac2de" })
hl(0, "NotifyERRORTitle", { fg = "#f38ba8" })
hl(0, "NotifyWARNTitle", { fg = "#f9e2af" })
hl(0, "NotifyINFOTitle", { fg = "#a6e3a1" })
hl(0, "NotifyDEBUGTitle", { fg = "#89b4fa" })
hl(0, "NotifyTRACETitle", { fg = "#bac2de" })


-- finder --
hl(0, "TelescopePromptTitle", { fg = "#11111b", bg = "#89b4fa" })
hl(0, "TelescopeResultsTitle", { fg = "#11111b", bg = "#89b4fa" })
