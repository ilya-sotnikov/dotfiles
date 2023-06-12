call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'NMAC427/guess-indent.nvim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'tomtom/tcomment_vim'
Plug 'lvimuser/lsp-inlayhints.nvim'
Plug 'RRethy/nvim-base16'

call plug#end()
