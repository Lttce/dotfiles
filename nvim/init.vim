" ===========================================================================
"
"  Neovim init.vim
"
" ===========================================================================

" ----------------------------------------
"  Load plugins
" ----------------------------------------

if !isdirectory(expand('~/.cache/dein'))
    let s:url = 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh'
    let s:dir = '~/.cache/dein'
    call system('curl '.s:url.' | bash -s -- '.s:dir)
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#min#load_state('~/.cache/dein')
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

set autoindent
set shiftround

set list

set splitbelow
set splitright

set scrolloff=999

set hidden

set nowrap

inoremap jk <ESC>

" Copy all chars from current buffer
noremap Y <cmd>%y<CR>

nnoremap x "_x
vnoremap x "_x

augroup CustomFileType
    autocmd FileType make setlocal noexpandtab
    autocmd FileType go setlocal noexpandtab
    autocmd FileType gitcommit setlocal spell
    autocmd FileType markdown setlocal spell
    autocmd FileType typescriptreact setlocal shiftwidth=2
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

" don't show [Process exited 0]
autocmd TermClose * call feedkeys('i')

" ----------------------------------------
"  Search
" ----------------------------------------

set ignorecase
set smartcase

