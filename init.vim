" ============================= Prereqs ======================================
" Vim-plug (https://github.com/junegunn/vim-plug)
"
" ============================= Base Vim Settings ============================ 
set mouse=a	" Allow mouse clicks to move cursor
set showtabline=2 " Always show tabline
set number	" Show line numbers
set cursorline	" Highlight current line
let &fcs='eob: ' " Hide tildes after end of file

" ============================= Plugins ======================================
call plug#begin('~/.config/nvim/plugged')

" Plugin list
Plug 'romgrk/doom-one.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/tagbar'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'

call plug#end() " List ends here. Plugins become visible to Vim after this call.

" Automatically install new/missing plugins
" (https://github.com/junegunn/vim-plug/wiki/extra#automatically-install-missing-plugins-on-startup)
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" ============================= Plugin Settings ==============================
colorscheme doom-one

" ==== Airline
let g:airline_theme='onedark'
