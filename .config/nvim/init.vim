call plug#begin()

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
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

set number
set relativenumber

set t_Co=256
set background=light
colorscheme PaperColor

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:c_syntax_for_h = 1
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

set hidden
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ 'c': ['clangd'],
  \ }
nmap <F5> <Plug>(lcn-menu)
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
autocmd BufWritePre *.c,*.h,*.cpp :call LanguageClient#textDocument_formatting_sync()

let g:shswitch_root_flags = ['CMakeLists.txt', 'Makefile']
nnoremap <F4> :SHSwitch<CR>
