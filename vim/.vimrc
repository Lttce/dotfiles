" vim .vimrc

" General
syntax enable
filetype indent plugin on

set nocompatible
set nobackup
set noswapfile

" Colors
augroup cutom_colorsheme
    " Desert
    autocmd ColorScheme desert highlight NonText guibg=NONE guifg=gray30
augroup end

" Without this, colorshemes will not be enable in tmux
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

" Please defined after the highlight command
colorscheme desert

set termguicolors

" Edit
set number
set laststatus=2

set expandtab
set shiftwidth=4

set list

inoremap jk <ESC> 

" Command
set wildmenu

" Search
set incsearch

