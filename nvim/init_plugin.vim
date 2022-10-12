" ===========================================================================
"
"  Neovim init_plugin.vim
"
" ===========================================================================

" ----------------------------------------
" dein.vim
" ----------------------------------------

let s:plguins_dir = expand('~/.cache/dein')
let s:dein_dir = expand(s:plguins_dir.'/repos/github.com/Shougo/dein.vim')
let s:toml_dir = expand('~/dotfiles/nvim/')

if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim.git '.s:dein_dir
endif

execute 'set runtimepath+='.s:dein_dir

if dein#min#load_state(s:plguins_dir)
    call dein#begin(s:plguins_dir)
        call dein#add(s:dein_dir, {
                    \ 'hook_add': "
                    \      let g:dein#auto_recache = !has('win32')
                    \ "})
        call dein#load_toml(s:toml_dir.'dein.toml'     , { 'lazy': 0 })
        call dein#load_toml(s:toml_dir.'dein_lazy.toml', { 'lazy': 1 })
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

syntax enable
filetype plugin indent on

