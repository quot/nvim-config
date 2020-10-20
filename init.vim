" ============================= Prereqs =============================
" Vim-plug (https://github.com/junegunn/vim-plug)
"
" ============================= Base Vim Settings ============================= 
set mouse=a	" Allow mouse clicks to move cursor
set showtabline=2 " Always show tabline
set number	" Show line numbers
set cursorline	" Highlight current line
let &fcs='eob: ' " Hide tildes after end of file

" ============================= Plugins =============================
call plug#begin('~/.config/nvim/plugged')

" Plugin list
Plug 'romgrk/doom-one.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/fern.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end() " List ends here. Plugins become visible to Vim after this call.

" ============================= Plugin Settings =============================
colorscheme doom-one

" ==== Airline
let g:airline_theme='onedark'
