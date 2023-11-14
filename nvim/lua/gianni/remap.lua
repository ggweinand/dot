vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("n", "<C-L>", ":nohl<CR><C-L>")
keymap.set("n", "x", '"_x')
