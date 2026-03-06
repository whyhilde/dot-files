local hl = vim.api.nvim_set_hl
local c = require("util.colors")


-- general
hl(0, "FloatBorder", { fg = c.blue, bg = "NONE" })
hl(0, "SignColumn", { fg = "NONE" })
hl(0, "Visual", { bg = c.surface0 })


-- context
hl(0, "TreesitterContextLineNumber", { fg = c.surface1 })
hl(0, "TreesitterContextSeparator", { fg = c.surface1 })


-- indents
hl(0, "IndentBlanklineIndent", { fg = c.surface1 })
hl(0, "IndentBlanklineScope", { fg = c.blue })


-- autocomplete
hl(0, "CmpCursorLine", { fg = c.crust, bg = c.blue })


-- dashboard
hl(0, "DashboardHeader", { fg = c.lavender })
hl(0, "DashboardFooter", { fg = c.text })
hl(0, "DashboardDesc", { fg = c.overlay2 })
hl(0, "DashboardKey", { fg = c.overlay2 })


-- icons
hl(0, "MiniIconsGrey", { fg = c.text })


-- notifications
hl(0, "NotifyERRORBorder", { fg = c.red })
hl(0, "NotifyWARNBorder", { fg = c.yellow })
hl(0, "NotifyINFOBorder", { fg = c.green })
hl(0, "NotifyDEBUGBorder", { fg = c.blue })
hl(0, "NotifyTRACEBorder", { fg = c.subtext1 })
hl(0, "NotifyERRORIcon", { fg = c.red })
hl(0, "NotifyWARNIcon", { fg = c.yellow })
hl(0, "NotifyINFOIcon", { fg = c.green })
hl(0, "NotifyDEBUGIcon", { fg = c.blue })
hl(0, "NotifyTRACEIcon", { fg = c.subtext1 })
hl(0, "NotifyERRORTitle", { fg = c.red })
hl(0, "NotifyWARNTitle", { fg = c.yellow })
hl(0, "NotifyINFOTitle", { fg = c.green })
hl(0, "NotifyDEBUGTitle", { fg = c.blue })
hl(0, "NotifyTRACETitle", { fg = c.subtext1 })


-- finder
hl(0, "TelescopePromptTitle", { fg = c.mantle, bg = c.blue, bold = true })
hl(0, "TelescopeResultsTitle", { fg = c.mantle, bg = c.blue, bold = true })


-- statusline
hl(0, "StatuslineDiff", { fg = c.overlay2, bg = c.base })
