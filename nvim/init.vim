syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile 
set nobackup
set incsearch
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4
set listchars=tab:>·,trail:.,  "set certain characters to .
set list
set rnu

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'jalvesaq/Nvim-R'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'scrooloose/nerdtree'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'sheerun/vim-polyglot'
Plug 'ayu-theme/ayu-vim'
Plug 'tweekmonster/gofmt.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'simnalamburt/vim-mundo'
call plug#end()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" nvim-R running commands
" remapping the basic :: send line
nmap , <Plug>RDSendLine
" remapping selection :: send multiple lines
vmap , <Plug>RDSendSelection
" remapping selection :: send multiple lines + echo lines
vmap ,e <Plug>RESendSelection

" allow for emacs movements
inoremap <C-a> <C-o>0   
inoremap <C-e> <C-o>$
inoremap <C-Space> <C-x><C-o>

let mapleader= " "

" nerd tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'

" COC section
"
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
    nmap <buffer> <leader>gd <Plug>(coc-definition)
    nmap <buffer> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <leader>gi <Plug>(coc-implementation)
    nmap <buffer> <leader>gr <Plug>(coc-references)
    nmap <buffer> <leader>rr <Plug>(coc-rename)
    nnoremap <buffer> <leader>cr :CocRestart
endfun

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


nnoremap <C-f> :Rg 
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <F5> :MundoToggle<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


let g:ale_linters = {'python': ['flake8'], 'R': ['lintr']}
let g:ale_fixers = {'*': ['styler'], 'python': ['black']}
let g:ale_fix_on_save = 1

let g:python_highlight_all = 1

" instant git updates for signify
let g:signify_realtime = 1

"Theme settings
" colorscheme palenight
let g:gruvbox_contrast_dark = "soft"
let g:airline_theme="gruvbox"
colorscheme gruvbox
" set termguicolors
"

let g:deoplete#enable_at_startup = 0
" set <-- hotkey
let R_assign_map = "--"
" set a minimum source editor width
let R_min_editor_width = 80
let R_in_buffer = 1
"let R_applescript = 1
"let RStudio_cmd = '/Applications/RStudio.app/Contents/MacOS/RStudio'
"let R_tmux_split = 1
" R output is highlighted with current colorscheme
let g:rout_follow_colorscheme = 1
" R commands in R output are highlighted
let g:Rout_more_colors = 1
" make sure the console is at the bottom by making it really wide
" let R_rconsole_width = 1000
" show arguments for functions during omnicompletion
let R_show_args = 1

" for RADIAN
" let R_app = "radian"
" let R_cmd = "R"
" let R_hl_term = 0
" let R_args = []  " if you had set any
" let R_bracketed_paste = 1


autocmd FileType js,ts,python,html,r,cpp,cxx,h,hpp,c :call GoCoc()

