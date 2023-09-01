call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'NMAC427/guess-indent.nvim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'tomtom/tcomment_vim'
Plug 'RRethy/nvim-base16'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bfrg/vim-cpp-modern'

call plug#end()
