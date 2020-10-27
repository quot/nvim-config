
" ============================= Pre-Reqs ===================================== 
" - Neovim 5.x+ for LSP support
" - Ripgrep for FZF (Optional but required for some chords)

" ============================= After First Run ============================== 
" ==== Scala:
" Install metals client: ':LspInstall metals'
" - This process will change in the future. Latest instructions can be found
"   on the nvim-metals readme.
"   https://github.com/scalameta/nvim-metals#getting-started

" ============================= Base Vim Settings ============================ 
set mouse=a	" Allow mouse clicks to move cursor
set showtabline=2 " Always show tabline
set number	" Show line numbers
set cursorline	" Highlight current line
" set hidden	" Switch buffers without having to save
let &fcs='eob: ' " Hide tildes after end of file
let g:mapleader = "\<Space>" " Map leader key to space
let g:maplocalleader = ','

" Set proper colors in Alacritty
" https://github.com/alacritty/alacritty/issues/109#issuecomment-440353106
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" ============================= Base Keymaps =================================
" ==== Change windows with ctrl+direction
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" ============================= Plugins ======================================
call plug#begin('~/.config/nvim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'	" Neovim lsp configs
Plug 'scalameta/nvim-metals'	" LSP Config for Metals
Plug 'nvim-lua/completion-nvim' " Neovim lsp completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP client
" Plug 'dense-analysis/ale'	" LSP client
" Plug 'RishabhRD/popfix'	" Required by lsputils
" Plug 'RishabhRD/nvim-lsputils' " Better default lsp settings? Can't get
				 " working though.

" Airline
Plug 'vim-airline/vim-airline'	" Bottom status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'ojroques/vim-scrollstatus' " Scrollbar for Airline

" Tagbar
Plug 'liuchengxu/vista.vim'
" Plug 'preservim/tagbar'		" Buffer to show code tags
" Plug 'derekwyatt/vim-scala'	" Using for Scala support in tagbar plugin

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim'	" fzf commands and mappings bundle

" Misc
Plug 'romgrk/doom-one.vim'
Plug 'liuchengxu/vim-which-key'	" Menu for leader key
Plug 'mhinz/vim-startify'	" Start menu
Plug 'preservim/nerdtree'	" File browser buffer
Plug 'airblade/vim-rooter'	" Automatically set the project root im_lspdirectory
Plug 'TaDaa/vimade'		" Fade inactive windows
Plug 'airblade/vim-gitgutter'	" Git gutter

call plug#end() " List ends here. Plugins become visible to Vim after this call.

" Automatically install new/missing plugins
" (https://github.com/junegunn/vim-plug/wiki/extra)
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" ============================= Plugin Settings ==============================
colorscheme doom-one

" ==== LSP
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.metals.setup{ on_attach=require'completion'.on_attach }
" Key map from ':h lsp'
nnoremap <silent> <leader>bi  <cmd>lua require'metals'.build_import()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" ==== Airline
let g:airline_theme='onedark'

" ==== ScrollStatus
let g:airline_section_x = '%{ScrollStatus()}' " Put ScrollStatus in Airline
" let g:scrollstatus_size = 20 " Change scrollbar size

" ==== Which-Key
source $HOME/.config/nvim/which-key.vim

" ==== FZF
let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g !'.git/*'"

" ==== Startify
if !empty(glob('$HOME/.config/nvim/startify-bookmarks.vim'))
	source $HOME/.config/nvim/startify-bookmarks.vim
endif
let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'
let g:startify_lists = [
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

" ==== Vista
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
    \'scala': 'nvim_lsp',
    \}

