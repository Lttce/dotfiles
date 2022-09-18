if &compatible
  set nocompatible
endif

let s:plguin_dir = expand('~/.cache/vim_plugin')

if !isdirectory(s:plguin_dir.'/repos/github.com/Shougo/dein.vim')
    call system('git clone https://github.com/Shougo/dein.vim.git '. s:plguin_dir .'/repos/github.com/Shougo/dein.vim')
endif

execute 'set runtimepath+='. s:plguin_dir .'/repos/github.com/Shougo/dein.vim'

if dein#min#load_state(s:plguin_dir)
    call dein#begin(s:plguin_dir)
        " --------------------------------------------------
        call dein#add('Shougo/dein.vim')

        call dein#add('arcticicestudio/nord-vim')

        call dein#add('itchyny/lightline.vim')

        call dein#add('machakann/vim-sandwich')

        call dein#add('cohama/lexima.vim', {
            \ 'lazy': 1, 'on_event': 'InsertEnter'})

        call dein#add('ctrlpvim/ctrlp.vim')
        " --------------------------------------------------
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" lightline
set nosmd
let g:lightline = {}
let g:lightline.colorscheme = 'nord'

" lexima
let g:lexima_map_escape = ''

" colorscheme
colorscheme nord

" base vimrc
source ~/dotfiles/vim/vimrc

