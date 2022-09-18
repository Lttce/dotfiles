if &compatible
  set nocompatible
endif

" automatic installation of dein {{{
let s:plugins_dir = expand('~/.cache/dein_vim')
let s:dein_dir = s:plugins_dir.'/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_dir)
    call system('git clone https://github.com/Shougo/dein.vim.git '.s:dein_dir)
endif
" }}}

" setup dein {{{
execute 'set runtimepath+='.s:dein_dir

if dein#min#load_state(s:plugins_dir)
    call dein#begin(s:plugins_dir)
        call dein#add('arcticicestudio/nord-vim')
        call dein#add('itchyny/lightline.vim')
        call dein#add('machakann/vim-sandwich')
        call dein#add('cohama/lexima.vim',{
            \ 'lazy': 1, 'on_event': 'InsertEnter'
            \ })
        call dein#add('ctrlpvim/ctrlp.vim')
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif
" }}}


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

