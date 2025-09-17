---- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
---------------- remaps (primeagen) ------------------
-- vim.g.mapleader = " "

-- vim.keymap.set("n", "<Enter>", ':call append(line('.'), '')<CR>')
-- vim.keymap.set("n", "<S-Enter>", ':call append(line('.')-1, '')<CR>')

-- vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", {remap = true})
-- vim.keymap.set("n", "<leader>e", ":Telescope file_browser<CR>")

-- vim.keymap.del("n", "<c-/>")

vim.keymap.set("x", "<leader>p", '"_dP') -- when pasting pasted stuff stays in the clipboard

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- cursor centered when CTRL+d
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- moving lines in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- cursor stays when shift+J

vim.keymap.set("n", "n", "nzzzv") -- cursor in the middle when searching
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("n", "<Enter>", "o<ESC>") -- insert blank line below on enter

vim.keymap.set("n", "<C-_>", "gcc", { remap = true })
vim.keymap.set("v", "<C-_>", "gcgv", { remap = true })

vim.keymap.set("n", "<F2>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- F2 replacing word in the entire file
