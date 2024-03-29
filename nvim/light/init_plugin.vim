let s:plguins_dir = expand('~/.cache/dein_light')
let s:dein_dir = expand(s:plguins_dir.'/repos/github.com/Shougo/dein.vim')
let s:toml_dir = expand('~/dotfiles/nvim/light/')

if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim.git '.s:dein_dir
endif

execute 'set runtimepath+='.s:dein_dir

if dein#min#load_state(s:plguins_dir)
    call dein#begin(s:plguins_dir)
        call dein#add(s:dein_dir, {
                    \ 'rev': '3.*',
                    \ 'hook_add': "
                    \      let g:dein#auto_recache = v:false
                    \ "})
        call dein#load_toml(s:toml_dir.'dein.toml')
    call dein#end()
    call dein#save_state()
endif

syntax enable
filetype plugin indent on

if dein#check_install()
    call dein#install()
endif

