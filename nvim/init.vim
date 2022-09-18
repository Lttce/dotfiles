" ===========================================================================
"
"  Neovim init.vim
"
" ===========================================================================

" ----------------------------------------
"  Load plugins
" ----------------------------------------

let s:plguin_dir = expand('~/.cache/dein')

if !isdirectory(s:plguin_dir.'/repos/github.com/Shougo/dein.vim')
    call system('git clone https://github.com/Shougo/dein.vim.git '. s:plguin_dir .'/repos/github.com/Shougo/dein.vim')
endif

execute 'set runtimepath+='. s:plguin_dir .'/repos/github.com/Shougo/dein.vim'

if dein#min#load_state(s:plguin_dir)
    call dein#begin(s:plguin_dir)
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

if has('persistent_undo')
    if !filewritable(expand('~/.vim/undo'))
        call mkdir($HOME.'/.vim/undo', 'p')
    endif
    set undodir=~/.vim/undo
    set undofile
endif

inoremap jk <ESC>

" Copy all chars from current buffer
noremap Y <cmd>%y<CR>

" Disable recoding
nnoremap q <NOP>

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

