set background=dark
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set ignorecase "Combines with smartcase"
set smartcase
set noswapfile 
set nobackup
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set incsearch
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4
set listchars=tab:>·,trail:.,  "set certain characters to .
set list
set rnu
set clipboard=unnamedplus               " Copy paste between vim and everything else
set ruler
set hlsearch "highlight search
set ai "auto indent
set mouse=a
set cursorline
set hidden
set cmdheight=2
set splitright
set t_Co=256
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'mhinz/vim-signify'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim' "search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'sheerun/vim-polyglot' 
Plug 'ayu-theme/ayu-vim' "theme
Plug 'tweekmonster/gofmt.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'simnalamburt/vim-mundo'
Plug 'liuchengxu/vim-which-key' "provides popup with shortcut keys
" Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-commentary'
Plug 'preservim/tagbar'
Plug 'antoinemadec/coc-fzf'
" Themes
Plug 'glepnir/oceanic-material'
Plug 'altercation/solarized'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'gruvbox-community/gruvbox'
call plug#end()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" allow for emacs movements
inoremap <C-a> <C-o>0   
inoremap <C-e> <C-o>$
inoremap <C-Space> <C-x><C-o>

" set space to leader
let mapleader= " "

" COC section
func GoCoc()
    :CocEnable
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()

    " GoTo code navigation.
    nmap <buffer> <leader>gd :vsp<CR><Plug>(coc-definition)
    nmap <buffer> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <leader>gi <Plug>(coc-implementation)
    nmap <buffer> <leader>gr <Plug>(coc-references)
    nmap <buffer> <leader>rr <Plug>(coc-rename)
    nnoremap <buffer> <leader>cr :CocRestart
endfun
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <leader>d :call <SID>show_documentation()<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"git fugitive shortcuts
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>
" git checkout
nnoremap <leader>gc :GBranches<CR>
" fzf
nnoremap <C-g> :Rg 
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :BLines<CR>
" window movements
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" mundo
nnoremap <F5> :MundoToggle<cr>
" quick vim init edits
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" nnoremap <C-w> :update<cr>
" inoremap <C-w> <esc>:update<cr>a

let g:python_highlight_all = 1
" instant git updates for signify
let g:signify_realtime = 1

"Theme settings
let g:gruvbox_contrast_dark = "soft"
let g:gruvbox_termcolors = 256
colorscheme gruvbox
" colorscheme oceanic_material
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" airline settings
let g:airline_theme="gruvbox"
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#tagbar#flags='f'
let g:airline_statusline_ontop = 1

autocmd FileType js,ts,python,html,r,cpp,cxx,h,hpp,c :call GoCoc()
" source extra settings
source $HOME/.config/nvim/keys/which-key.vim
" source ~/.config/nvim/plug-config/sneak.vim
source ~/.config/nvim/plug-config/quickscope.vim
