if &compatible
  set nocompatible
endif

" automatic installation of vim-plug
let s:data_dir = has('win32') ? expand('~/vimfiles') : expand('~/.vim')

if empty(glob(s:data_dir.'/autoload/plug.vim'))
    silent exe '!curl -fLo '.s:data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    au VimEnter * PlugInstall --sync
endif

" plugins
call plug#begin()
    " colorscheme
    Plug 'arcticicestudio/nord-vim'
    " statusline
    Plug 'itchyny/lightline.vim'
    " edit support
    Plug 'machakann/vim-sandwich'
    Plug 'cohama/lexima.vim'
    " fuzzy finder
    Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

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

