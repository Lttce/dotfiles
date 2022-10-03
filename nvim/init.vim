" ==========================================================================
"
"  Neovim init.vim
"
" ===========================================================================

" ----------------------------------------
" general
" ----------------------------------------

syntax enable
filetype plugin indent on

set undofile
set nobackup
set noswapfile

" ----------------------------------------
" color
" ----------------------------------------

set termguicolors

au ColorScheme * hi SignColumn  guibg=None
au ColorScheme * hi NonText     guibg=None
au ColorScheme * hi EndOfBuffer guibg=None

colorscheme evening

" ----------------------------------------
" edit
" ----------------------------------------

set number

set list

set tabstop=4
set expandtab
set shiftwidth=4
set shiftround

" set splitbelow
set splitright

set nowrap

inoremap jk <esc>
inoremap <C-l> <C-o>a

nnoremap q <nop>

" copy all current buffer
nnoremap Y <cmd>%y<cr>

nnoremap x "_x
vnoremap x "_x

" save last cursor position
au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" highlight yank
aut TextYankPost * lua require('vim.highlight').on_yank { higroup='MatchParen', timeout=400 }

" ----------------------------------------
" terminal
" ----------------------------------------

tnoremap <esc> <C-\><C-n>

au TermOpen * startinsert

" don't show [Process exited 0]
au TermClose * call feedkeys('i')

" ----------------------------------------
" search
" ----------------------------------------

set ignorecase
set smartcase

" ----------------------------------------
" completion
" ----------------------------------------

set completeopt=menu,menuone,preview,noselect

" ----------------------------------------
" clipboard
" ----------------------------------------

if executable('win32yank.exe')
    if has('wsl') || has('win32')
        let g:clipboard = {
                    \   'name': 'win32yank',
                    \   'copy': {
                    \      '+': 'win32yank.exe -i',
                    \      '*': 'win32yank.exe -i',
                    \    },
                    \   'paste': {
                    \      '+': 'win32yank.exe -o',
                    \      '*': 'win32yank.exe -o',
                    \   },
                    \   'cache_enabled': 1,
                    \ }
    endif
endif

" ----------------------------------------
" runtime
" ----------------------------------------

" disable builtin plugins
let g:did_menu_trans            = 1
let g:did_install_default_menus = 1
let g:skip_loading_mswin        = 1
let g:did_install_syntax_menu   = 1

let g:loaded_gzip               = 1
let g:loaded_man                = 1
let g:loaded_matchit            = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_shada_plugin       = 1
let g:loaded_spellfile_plugin   = 1
let g:loaded_tarPlugin          = 1
let g:loaded_2html_plugin       = 1
let g:loaded_tutor_mode_plugin  = 1
let g:loaded_zipPlugin          = 1

let g:loaded_ruby_provider      = 0
let g:loaded_perl_provider      = 0
let g:loaded_python_provider    = 0
let g:loaded_python3_provider   = 0
let g:loaded_pythonx_provider   = 0
let g:loaded_node_provider      = 0

