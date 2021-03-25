" Colmak-DH remaps
nnoremap n h
nnoremap e j
nnoremap i k
nnoremap o l

nnoremap h n
nnoremap j e
nnoremap k i
nnoremap l o

" Base settings
set number
set relativenumber
set tabstop=4

" Plugins
call plug#begin('~/.config/nvim/plugged')
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'scalameta/nvim-metals'
call plug#end()

" FZF config
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
noremap :rg :Rg
