vim.g.mapleader = " "

require("plugins")
require("lsp-cmp")
require("fuzz")

-- 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- columns
-- vim.o.colorcolumn = "80,100"

-- detect indentation
require("guess-indent").setup {}

-- colorscheme
vim.o.termguicolors = true
vim.cmd("colorscheme base16-one-light")

-- asm
vim.cmd [[autocmd BufNew,BufRead *.asm set ft=nasm]]

-- explorer
vim.keymap.set("n", "<C-t>", "<cmd>:Lexplore<cr>")
