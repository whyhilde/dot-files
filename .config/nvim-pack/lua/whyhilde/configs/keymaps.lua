local map = vim.keymap.set


vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- file
map("n", "<c-s>", "<cmd>w<cr>", { desc = "save file" })
map("n", "<c-q>", "<cmd>qa!<cr>", { desc = "quit without save" })

-- buffers
map("n", "<tab>", "<cmd>bn<cr>", { desc = "go to next buffer" })
map("n", "<s-tab>", "<cmd>bp<cr>", { desc = "go to previous buffer" })
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "delete buffer" })

-- move between lines
map("n", "j", "gj", { desc = "move down based on transfer" })
map("n", "k", "gk", { desc = "move up based on transfer" })

-- move between words
map("n", "H", "b", { desc = "move to previous word" })
map("n", "L", "w", { desc = "move to next word" })
map("n", "J", "^", { desc = "move to beginning of line" })
map("n", "K", "$", { desc = "move to end of line" })

-- move between panes
map("n", "<c-h>", "<c-w>h", { desc = "pane movement left" })
map("n", "<c-j>", "<c-w>j", { desc = "pane movement down" })
map("n", "<c-k>", "<c-w>k", { desc = "pane movement up" })
map("n", "<c-l>", "<c-w>l", { desc = "pane movement right" })

-- yank/paste
map("n", "x", "\"_x", { desc = "cut without storing to clipboard" })
map("n", "<leader>c", "yyp", { desc = "duplicate line" })

-- increment/decrement
map("n", "+", "<c-a>", { desc = "increment number" })
map("n", "-", "<c-x>", { desc = "decrement number" })

-- move between search results
map("n", "n", "nzzzv", { desc = "next search result and center" })
map("n", "N", "Nzzzv", { desc = "previous search result and center" })

-- disable highlight after search
map("n", "<leader>hl", "<cmd>noh<cr>", { desc = "disable highlight after search" })

-- quit insert mode
map("i", "jj", "<esc>", { desc = "quit insert mode" })

-- move in insert mode
map("i", "<c-h>", "<left>", { desc = "move left in insert mode" })
map("i", "<c-j>", "<down>", { desc = "move down in insert mode" })
map("i", "<c-k>", "<up>", { desc = "move up in insert mode" })
map("i", "<c-l>", "<right>", { desc = "move right in insert mode" })

map("i", "<esc>", "<nop>")
