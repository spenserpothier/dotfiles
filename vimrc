" Spenser Pothier vimrc
set nocompatible

" Colors {{{
set t_Co=256
colorscheme badwolf  
"}}}

" UI Layout {{{
set number
set nobackup
set nowritebackup
set noswapfile
set shortmess+=I
set wildmenu
set showmatch
syntax enable

" Set vertical rulers at column 80 and 100
set colorcolumn=80,100
highlight ColorColumn ctermbg=DarkGray

" Font stuff for vim-airline
set guifont=Liberation\ Mono\ for\ Powerline\ 10 
let g:airline_powerline_fonts = 1

" Set different explore mode style
let g:netrw_liststyle=3

"}}}

" Searching {{{
set hlsearch
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
syntax on
filetype on
filetype indent on
filetype plugin on
setlocal omnifunc=syntaxcomplete#Complete

"}}}

" Folding {{{
set foldenable
" }}}

" Key Bindings {{{

" Remap leader to ","
let mapleader=","

" Toggle folding with space in normal mode
nnoremap <space> za

" Force use of hjkl for navigation in normal mode
noremap <Up> :echoerr "Use k dummy"<CR>
noremap <Down> :echoerr "Use j dummy"<CR>
noremap <Left> :echoerr "Use h dummy"<CR>
noremap <Right> :echoerr "Use l dummy"<CR>

"Clear search highlighting with <Leader> and return
nnoremap <Leader><CR> :nohlsearch<CR>

" Shortcuts to edit and source vimrc file
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>

nnoremap ; :

" Convert document to pdf (using pandoc)
nnoremap <Leader>md :! pandoc %:t -o %:t:r.pdf

" Explore mode
map <Leader>e :E<cr>

" Tab switching
map <Leader>[ :tabp<cr>
map <Leader>] :tabn<cr>
" }}}

" Plugins {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/vim-gitgutter
set runtimepath^=~/.vim/bundle/vim-airline
set runtimepath^=~/.vim/bundle/vim-fugitive
set runtimepath^=~/.vim/bundle/vim-ags
set runtimepath^=~/.vim/bundle/vim-ruby

set laststatus=2

let g:gitgutter_avoid_cmd_prompt_on_windows = 0

"}}}

" Vimrc Folding Stuff {{{
set modeline
set modelines=1

" }}}

" vim:foldmethod=marker:foldlevel=0
