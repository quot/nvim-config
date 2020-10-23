" ============================= Base Vim Settings ============================ 
set mouse=a	" Allow mouse clicks to move cursor
set showtabline=2 " Always show tabline
set number	" Show line numbers
set cursorline	" Highlight current line
let &fcs='eob: ' " Hide tildes after end of file
let g:mapleader = "\<Space>" " Map leader key to space
let g:maplocalleader = ','

" ============================= Plugins ======================================
call plug#begin('~/.config/nvim/plugged')

" Plugin list
Plug 'romgrk/doom-one.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'	" Bottom status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'ojroques/vim-scrollstatus' " Scrollbar for Airline
Plug 'preservim/tagbar'		" Buffer to show code tags
Plug 'mhinz/vim-startify'	" Start menu
Plug 'preservim/nerdtree'	" File browser buffer
Plug 'liuchengxu/vim-which-key'	" Menu for leader key

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

" ==== ScrollStatus
let g:airline_section_x = '%{ScrollStatus()}' " Put ScrollStatus in Airline
" let g:scrollstatus_size = 20 " Change scrollbar size

" ==== Which-Key
source $HOME/.config/nvim/which-key.vim
