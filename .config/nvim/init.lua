vim.g.mapleader = " "

-- 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false

-- show tabs
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·' }

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- columns
vim.o.colorcolumn = "80,100"

-- colorscheme
vim.o.termguicolors = true
vim.cmd("colorscheme base16-one-light")

vim.o.keymap = "russian-jcukenwin"
vim.o.iminsert = 0
vim.o.imsearch = 0

-- explorer
vim.keymap.set("n", "<C-t>", "<cmd>:Lexplore<cr>")

-- pynvim
-- vim.g.python3_host_prog = "~/.pynvim/bin/python"
