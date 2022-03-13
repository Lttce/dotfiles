" ===========================================================================
"
"  Neovim init.vim
"
" ===========================================================================

" ----------------------------------------
"  Load plugins
" ----------------------------------------

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let b:loaded_dein_vim = v:false

if isdirectory(expand('~/.cache/dein'))
    let b:loaded_dein_vim = v:true

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
else
    echo '[Notice] dein.vim is not installed.'
endif

if isdirectory(expand('~/dotfiles/nvim/plugins'))
    " Disable the runtime plugins
    source ~/dotfiles/nvim/plugins/runtime.vim

    " If set, startup time will be faster
    source ~/dotfiles/nvim/plugins/clipboard.vim
endif

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

if b:loaded_dein_vim
    colorscheme edge
else
    colorscheme desert
endif

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

" wait time for key input
set timeoutlen=300

inoremap jk <ESC>

inoremap <C-l> <RIGHT>

" Copy all chars from current buffer
noremap Y <cmd>%y<CR>

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

    " highlight yank
    autocmd TextYankPost * lua require'vim.highlight'.on_yank {higroup='MatchParen', timeout=400}
augroup end

" ----------------------------------------
"  Command
" ----------------------------------------

augroup CustomTerminal
    autocmd TermOpen * startinsert
augroup end

" Exit inset mode when using the terminal
tnoremap <ESC> <C-\><C-n>
tnoremap jk <C-\><C-n>

" Disable commands history
noremap q: <NOP>

" Open a termial with ':T'
command T split | resize 10 | terminal

" Close a terminal with input ':q'
tnoremap :q <C-\><C-n>:q<CR>

" ----------------------------------------
"  Search
" ----------------------------------------

set ignorecase
set smartcase

nnoremap <silent> <F1> <cmd>noh<CR>

