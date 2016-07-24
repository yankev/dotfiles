" Packages
call plug#begin()
" Plugins
Plug 'ervandew/ag'
Plug 'neomake/neomake'
Plug 'bufexplorer.zip'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'

" Languages
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'kiasaki/vim-eth'
Plug 'klen/python-mode'
Plug 'pangloss/vim-javascript'
Plug 'glench/vim-jinja2-syntax'
Plug 'hdima/python-syntax'
Plug 'davidhalter/jedi-vim'
Plug 'andviro/flake8-vim'
Plug 'bigfish/vim-eslint'
" Themes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'jscappini/material.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'

call plug#end()

" Don't bother supporting vi, update window title, no ~file
set nocompatible title nobackup noswapfile
" Show line number, current line and current command
set number cursorline showcmd
" Search incrementally with smart case sensitivity, highlight all matches
set incsearch ignorecase smartcase hlsearch
" Automatic indentation and adjust with tab and backspace
set autoindent smartindent smarttab
" Shorten messages, disable intro screen and disable audible bell
set shortmess=atI visualbell t_vb=
" Allow backspace in insert mode, show hard tabs and trailing whitespace
set backspace=2 list listchars=tab:▸\ ,trail:.,nbsp:_
" Show hard tabs as 4 wide, use 2 space indentation rounded to multiples
set tabstop=4 expandtab shiftwidth=4 shiftround
" Use mac's clipboard
set clipboard=unnamed
" Show tab-complete suggestions and complete longest substring.
set wildmenu wildmode=list:longest
" Color line 100
set colorcolumn=100
" Fold on { { {
set foldmethod=marker
" Use space as leader
let mapleader=" "
" Use zsh
set shell=zsh
" highlight matching [{()}]
set showmatch

" Syntax highlighting, FILETYPE indentation rules, color scheme
"syntax on
syntax enable
filetype plugin indent on
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" colorscheme
colorscheme Tomorrow-Night
" Status line
hi statusline ctermbg=5 ctermfg=15
hi statuslinenc ctermbg=8 ctermfg=15
set statusline=\ %f
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=(%c,\ %l)\ -\ %L\ 


" Auto commands
autocmd VimResized * :wincmd = " Equalize window sizes on resize
autocmd BufNewFile,BufRead *.md setlocal spell " Help correct my english
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.scm set filetype=scheme
autocmd BufNewFile,BufRead *.eth setfiletype eth

" Map Ctrl+[hjkl] to move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w>n <ESC>:tabnext<CR>
if has("nvim") " In neovim, move out of the terminal easier
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  " Hack to get C-h working in neovim
  nmap <BS> <C-W>h
  tnoremap <Esc> <C-\><C-n>
end

" Leader commands
nmap <leader>n :nohlsearch<CR>
noremap <leader>nt :NERDTreeToggle<CR>
noremap <leader>be :BufExplorerHorizontalSplit<CR>
noremap <leader>f :CtrlP<CR>

" Inspect sym at cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules',
  \ 'file': '\.exe$\|\.so$\|\.DS_Store|.*\.pyc',
  \ }

" Javascript
let g:javascript_plugin_jsdoc = 1
