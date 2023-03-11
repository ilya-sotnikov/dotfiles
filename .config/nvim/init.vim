call plug#begin()

Plug 'preservim/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'kuznetsss/shswitch'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType c setlocal tabstop=2 shiftwidth=2
autocmd FileType asm setlocal tabstop=8 shiftwidth=8

set number
set relativenumber

set t_Co=256
set background=light
colorscheme PaperColor

set switchbuf=usetab

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

set hidden
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ 'c': ['clangd'],
  \ }
nnoremap <silent><F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent>K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent>gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent>gD :tab split<CR> :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent>gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent>gR :tab split<CR> :call LanguageClient_textDocument_references()<CR>
nnoremap <silent><F2> :call LanguageClient_textDocument_rename()<CR>
autocmd BufWritePre *.c,*.h,*.cpp :call LanguageClient#textDocument_formatting_sync()

let g:shswitch_root_flags = ['CMakeLists.txt', 'Makefile']
nnoremap <F4> :SHSwitch<CR>
