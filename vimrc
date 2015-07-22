" Spenser Pothier vimrc

" Colors {{{

"}}}

" UI Layout {{{
set number
set nobackup
set nowritebackup
set noswapfile
set ruler
set shortmess+=I
set wildmenu

"}}}

" Searching {{{

"}}}

" Spaces and Tabs {{{
" Spaces instead of tabs
set expandtab
set smarttab
" tab width to 2
set shiftwidth=2
set tabstop=2

" Auto indent, smart indent
set ai
set si
"}}}

" Folding {{{
  set modelines=1
" }}}

" Key Bindings {{{
nnoremap <space> za

" Force use of hjkl for navigation in normal mode
noremap <Up> :echoerr "Use k dummy"<CR>
noremap <Down> :echoerr "Use j dummy"<CR>
noremap <Left> :echoerr "Use h dummy"<CR>
noremap <Right> :echoerr "Use l dummy"<CR>

" }}}

" Plugins {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim
"}}}



" vim:foldmethod=marker:foldlevel=0
