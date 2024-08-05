vim.g.mapleader = " "

require("plugins")
require("lsp-cmp")
require("fuzz")

-- 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.smarttab = true
vim.o.smartindent = true

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

-- center cursor after scrolling and search
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
