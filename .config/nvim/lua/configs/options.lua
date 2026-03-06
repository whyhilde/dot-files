local options = {
  -- general
  encoding = "utf-8",                  -- set UTF-8 encoding
  fileencoding = "utf-8",              -- default file encoding
  modelines = 0,                       -- disable CVE-2007-2438 vulnerability
  wildmode = "longest:full,full",      -- autocompletes in command line
  clipboard = "unnamedplus",           -- use system clipboard
  updatetime = 5000,                   -- update timeout
  mouse = "a",                         -- enable mouse support
  langmap = {
    "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    "фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
  },                                   -- enable support russian layout

  -- editor
  number = true,                       -- enable absolute numbering of current line
  relativenumber = true,               -- enable relative line numbering
  numberwidth = 2,                     -- line number width
  fillchars = {
    eob = " ",
  },                                   -- interface symbols
  scrolloff = 10,                      -- minimum number of lines above/below cursor when scrolling
  smoothscroll = true,                 -- enable smooth scrolling
  cursorline = true,                   -- highlight cursor line
  signcolumn = "yes",                  -- enable sign column
  splitbelow = true,                   -- when horizontal split open new window at bottom
  splitright = true,                   -- when vertically split open new window on right

  -- indents
  expandtab = true,                    -- replace Tabs with spaces
  tabstop = 2,                         -- number of spaces for tabs
  shiftwidth = 2,                      -- number of spaces when auto-adding margins
  softtabstop = 2,                     -- number of spaces during autotabulation
  smarttab = true,                     -- smart tabulation behavior
  smartindent = true,                  -- smart code alignment

  -- search
  hlsearch = true,                     -- enable search results highlight
  incsearch = true,                    -- enable search as you type
  ignorecase = true,                   -- ignore case when searching
  smartcase = true,                    -- ignore case if there are no uppercase letters
  infercase = true,                    -- save register when auto-complete

  -- performance
  laststatus = 3,                      -- enable global status line
  ruler = false,                       -- disable character ruler
  showtabline = 0,                     -- enable tab line
  showmode = false,                    -- disable display mode
  wrap = true,                         -- enable line wrapping
  linebreak = true,                    -- enable wrap only by words
  whichwrap = "",                      -- which keys enable transfer to next line
  showbreak = " 󱞩 ",                   -- add arrow at beginning of moved line
  backup = false,                      -- disable backup files
  writebackup = false,                 -- disable creation of temporary backups
  swapfile = false,                    -- disable creation .swp files
  undofile = true,                     -- save history of changes
}


for option, value in pairs(options) do
  vim.opt[option] = value
end
