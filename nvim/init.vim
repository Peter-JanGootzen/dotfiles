"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                                                "
"                                          .::::.                                                "
"                             ___________ :;;;;:`____________                                    "
"                             \_________/ ?????L \__________/                                    "
"                               |.....| ????????> :.......'                                      "
"                               |:::::| $$$$$$"`.:::::::' ,                                      "
"                              ,|:::::| $$$$"`.:::::::' .OOS.                                    "
"                            ,7D|;;;;;| $$"`.;;;;;;;' .OOO888S.                                  "
"                          .GDDD|;;;;;| ?`.;;;;;;;' .OO8DDDDDNNS.                                "
"                           'DDO|IIIII| .7IIIII7' .DDDDDDDDNNNF`                                 "
"                             'D|IIIIII7IIIII7' .DDDDDDDDNNNF`                                   "
"                               |EEEEEEEEEE7' .DDDDDDDNNNNF`                                     "
"                               |EEEEEEEEZ' .DDDDDDDDNNNF`                                       "
"                               |888888Z' .DDDDDDDDNNNF`                                         "
"                               |8888Z' ,DDDDDDDNNNNF`                                           "
"                               |88Z'    /"DNNNNNNN"                                              "
"                               '"'        /"MMMM"                                                "
"                                            /""                                                  "
"                                                                                                "
"      ___    ____                                            __   _         _    ________  ___  "
"     /   |  / / /  __  ______  __  __   ____  ___  ___  ____/ /  (_)____   | |  / /  _/  |/  /  "
"    / /| | / / /  / / / / __ \/ / / /  / __ \/ _ \/ _ \/ __  /  / / ___/   | | / // // /|_/ /   "
"   / ___ |/ / /  / /_/ / /_/ / /_/ /  / / / /  __/  __/ /_/ /  / (__  )    | |/ // // /  / /    "
"  /_/  |_/_/_/   \__, /\____/\__,_/  /_/ /_/\___/\___/\__,_/  /_/____/     |___/___/_/  /_/     "
"                   /_/                                                                          "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

filetype off                  " required
set hidden

" Plugins
call plug#begin('~/.config/nvim/plugged')

"-------------------=== Code/Project navigation ===-------------
Plug 'scrooloose/nerdtree'                " Project and file navigation
Plug 'ryanoasis/vim-devicons'             " Vimicons
Plug 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'     " Themes for airline
Plug 'airblade/vim-gitgutter'             " Git symbols next to lines
Plug 'tpope/vim-fugitive'                 " Gstatus and stuff
"
" Opens vim in the parent git directory when opening a file, this is handy
" when fuzzy searching
Plug 'airblade/vim-rooter'
" The fuzzy searcher
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'                   " Fuzzy searcher

"-------------------=== Other ===-------------------------------
Plug 'luochen1990/rainbow'
Plug 'thaerkh/vim-indentguides'           " Visual representation of indents
" Figures the indenting style of the current file out
Plug 'tpope/vim-sleuth'
" Automaticly inserts closing tags
Plug 'alvan/vim-closetag'

"-------------------=== Languages support, linting and completions ===-------------------
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Async completions
Plug 'w0rp/ale'                                               " Async linting engine
Plug 'Shougo/neosnippet.vim'                                  " Snippets plugin
Plug 'Shougo/neosnippet-snippets'                             " Snippets db
Plug 'sheerun/vim-polyglot'                                   " Languages syntax
Plug 'rust-lang/rust.vim'                                     " Rust support
Plug 'racer-rust/vim-racer'                                   " Rust auto complete support

call plug#end()

filetype plugin indent on


" General settings
set encoding=utf-8
set t_Co=256                                " 256 colors
let g:airline_theme='badwolf'
color ron
syntax enable                               " enable syntax highlighting

set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent                              " indent when moving to the next line while writing code
set smarttab                                " set tabs for a shifttabs logic

set showmatch                               " shows matching part of bracket pairs (), [], {}

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set directory=$HOME/.nvim/swap//
set backupdir=$HOME/.nvim/backup//
set undodir=$HOME/.nvim/undo//
set undofile

set scrolloff=5                            " let 10 lines before/after cursor during scroll

set clipboard=unnamedplus                   " enable systemwide clipboard
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

" Relative Numbering
nnoremap <leader>rn :set relativenumber!<CR>

" Search settings
set incsearch                                 " incremental search
set hlsearch                                  " highlight search results
set ignorecase                                " only enable case sensitive search if uppercase character was entered

" AirLine settings
let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

" NERDTree settings
set modifiable
let NERDTreeWinSize=50
let NERDTreeMinimalUI=1

" Keybindings
let mapleader=' '
nnoremap <silent> <leader><leader> :w<CR>
nnoremap <silent> <leader>qw :wq<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>qq :q<CR>
nnoremap <silent> <leader>qf :q!<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :GFiles<CR>
nnoremap <silent> <leader>fd :call Fzf_dev()<CR>
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader>ag :Ag<CR>
nnoremap <silent> <leader>src :so $MYVIMRC<CR>
nnoremap <silent> <leader>erc :tabe $MYVIMRC<CR>
nnoremap <silent> <leader>oo :NERDTreeToggle<CR>
nnoremap <silent> <leader>sh :GitGutterStageHunk<CR>
nnoremap <silent> <leader>nh :GitGutterNextHunk<CR>
nnoremap <silent> <leader>ph :GitGutterPrevHunk<CR>

" Set gitgutter to update every 100ms
set updatetime=100

" Auto start deoplete
let g:deoplete#enable_at_startup = 1

let g:rainbow_active = 1

" Restricting mutt mail files to 72 characters text width
au BufRead ~/.config/mutt/tmp set tw=72

let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
iabbrev </ </<C-X><C-O>
let g:closetag_filenames = '*.html,*.vue'

" Rust
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Linter
" only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_rust_rls_config = {
	\ 'rust': {
		\ 'all_targets': 1,
		\ 'build_on_save': 1,
		\ 'clippy_preference': 'on'
	\ }
	\ }
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_rust_rls_toolchain = '' "Chooses the default toolchain
let g:ale_linters = {'rust': ['rls']}
let g:ale_sign_error = "✖"
let g:ale_sign_warning = "⚠"
let g:ale_sign_info = "i"
let g:ale_sign_hint = "➤"
" Show the errors in airline
let g:airline#extensions#ale#enabled = 1
" Show the type of the variable under the cursor
nnoremap <silent> K :ALEHover<CR>


" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
