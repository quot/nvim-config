" ============================= Prereqs =============================
" Vim-plug (https://github.com/junegunn/vim-plug)

" ============================= Plugins =============================
call plug#begin('~/.config/nvim/plugged')

" Plugin list
Plug 'romgrk/doom-one.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/fern.vim'

call plug#end() " List ends here. Plugins become visible to Vim after this call.

" ============================= Settings ============================= 
colorscheme doom-one
set mouse=a	" Allow mouse clicks to move cursor
set showtabline=2 " Always show tabline
set number	" Show line numbers
set cursorline	" Highlight current line
let &fcs='eob: ' " Hide tildes after end of file
