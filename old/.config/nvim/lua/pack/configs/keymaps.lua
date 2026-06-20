local key = vim.keymap.set


-- leader
vim.g.mapleader = " "


-- files
key("n", "<c-s>", "<cmd>w<cr>", { desc = "save file" })
key("n", "<c-q>", "<cmd>qa!<cr>", { desc = "quit without save" })


-- movement
key("n", "j", "gj", { desc = "move down based on transfer" })
key("n", "k", "gk", { desc = "move up based on transfer" })
key("n", "H", "b", { desc = "move to previous word" })
key("n", "L", "w", { desc = "move to next word" })
key("n", "J", "^", { desc = "move to beginning of line" })
key("n", "K", "$", { desc = "move to end of line" })
key("i", "<c-h>", "<left>", { desc = "move left in insert mode" })
key("i", "<c-j>", "<down>", { desc = "move down in insert mode" })
key("i", "<c-k>", "<up>", { desc = "move up in insert mode" })
key("i", "<c-l>", "<right>", { desc = "move right in insert mode" })
key("n", "<c-h>", "<c-w>h", { desc = "pane movement left" })
key("n", "<c-j>", "<c-w>j", { desc = "pane movement down" })
key("n", "<c-k>", "<c-w>k", { desc = "pane movement up" })
key("n", "<c-l>", "<c-w>l", { desc = "pane movement right" })


-- visual
key("v", "J", ":m '>+1<cr>gv=gv", { desc = "move selection down" })
key("v", "K", ":m '<-2<cr>gv=gv", { desc = "move selection up" })
key("v", "<", "<gv", { desc = "indent left and keep selection" })
key("v", ">", ">gv", { desc = "indent right and keep selection" })


-- yank and paste
key("n", "x", "\"_x", { desc = "cut without storing to clipboard" })
key("n", "<leader>c", "yyp", { desc = "duplicate line" })


-- window management
key("n", "<leader>sv", "<c-w>v", { desc = "split window vertically" })
key("n", "<leader>sh", "<c-w>s", { desc = "split window horizontally" })


-- scrolling
key("n", "<c-u>", "<c-u>zz", { desc = "scrolling up with centering" })
key("n", "<c-d>", "<c-d>zz", { desc = "scrolling down with centering" })


-- increment/decrement number
key("n", "+", "<c-a>", { desc = "increment number" })
key("n", "-", "<c-x>", { desc = "decrement number" })


-- improved next match
key("n", "n", "nzzzv", { desc = "next search result and center" })
key("n", "N", "Nzzzv", { desc = "previous search result and center" })


-- other keymaps
key("i", "jj", "<esc>", { desc = "quit insert mode" })
key("i", "<d-space>", "<nop>", { desc = "ignore switch keyboard layout" })
key("n", "<leader>hl", "<cmd>noh<cr>", { desc = "disable highlight after searching" })


-- no arrow keys
key({ "n", "i", "v", }, "<left>", function() print("skill issue?") end, { desc = "no arrow keys" })
key({ "n", "i", "v", }, "<down>", function() print("skill issue?") end, { desc = "no arrow keys" })
key({ "n", "i", "v", }, "<up>", function() print("skill issue?") end, { desc = "no arrow keys" })
key({ "n", "i", "v", }, "<right>", function() print("skill issue?") end, { desc = "no arrow keys" })
