" ===========================================================================
"
"  Neovim init.vim
"
" ===========================================================================

" ----------------------------------------
"  Load plugins
" ----------------------------------------

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
        call dein#load_toml('~/dotfiles/nvim/dein.toml'     , { 'lazy': 0 })
        call dein#load_toml('~/dotfiles/nvim/dein_lazy.toml', { 'lazy': 1 })
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" Disable the runtime plugins
source ~/dotfiles/nvim/plugins/runtime.vim

" If set, startup time will be faster
source ~/dotfiles/nvim/plugins/clipboard.vim

" ----------------------------------------
"  General
" ----------------------------------------

set nobackup
set noswapfile

set clipboard+=unnamedplus
set mouse=a

syntax enable
filetype plugin indent on

" ----------------------------------------
" Color
" ----------------------------------------

augroup CustomColorscheme
    autocmd ColorScheme * highlight SignColumn None
augroup end

set termguicolors

colorscheme edge

" ----------------------------------------
"  Edit
" ----------------------------------------

set number
set signcolumn=yes

set expandtab
set tabstop=4
set shiftwidth=4

set smartindent

set list

set virtualedit=onemore,block

set splitbelow
set splitright

set scrolloff=999

set hidden

inoremap jk <ESC>

inoremap <C-l> <RIGHT>

nnoremap x "_x
vnoremap x "_x

augroup CustomFileType
    autocmd FileType make setlocal noexpandtab
    autocmd FileType go setlocal noexpandtab
    autocmd FileType gitcommit setlocal spell
augroup end

augroup CustomCommand
    " Save last cursor position
    autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup end

" ----------------------------------------
"  Command
" ----------------------------------------

augroup CustomTerminal
    autocmd TermOpen * startinsert
augroup end

" Exit inset mode when using the terminal
tnoremap <ESC> <C-\><C-n>

" ----------------------------------------
"  Search
" ----------------------------------------

set ignorecase
set smartcase

nnoremap <silent> <F1> <cmd>noh<CR>

