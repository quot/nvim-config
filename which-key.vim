" ======= Which-Key Settings ======
let g:which_key_sep = '→'
" set timeoutlen=100

" ==== Required
" Create which_key_map var that can be added to
let g:which_key_map = {}

" ==== Single key examples
" nnoremap <Leader>1 :echom "THis is one"<cr>
" let g:which_key_map.1 = "One"

" ==== Single Key Mappings


" ==== Tab Keys
let g:which_key_map.t = {
	\ 'name': "+buffer",
	\ 'd': [':tabclose',	'close tab'],
	\ 'h': [':tabprevious',	'last tab'],
	\ 'l': [':tabnext',	'next tab'],
	\}

let g:which_key_map['\'] = {
	\ 'name': "+settings", 
	\ 'i': [':e $MYVIMRC',	'init'],
	\ 'w': [':e $HOME/.config/nvim/which-key.vim', 'which-key'],
	\}

let g:which_key_map.o = {
	\ 'name': "+open",
	\ 't': [':Vista!!',	'tagbar'],
	\ 'p': ['NERDTreeToggle',	'project files'],
	\}

let g:which_key_map.f = {
	\ 'name': '+file',
	\ 's': [':FZF', 'search'],
	\}

let g:which_key_map.s = {
	\ 'name': '+search',
	\ 'f': [':FZF', 'file'],
	\ 'p': [':Rg', 'in project'],
	\ 's': [':Lines', 'buffer'],
	\}

" Called after key mappings
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
