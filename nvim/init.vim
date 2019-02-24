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
Plug 'Xuyuanp/nerdtree-git-plugin'        " NerdTree git functionality
Plug 'ryanoasis/vim-devicons'             " Vimicons
Plug 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'     " Themes for airline
Plug 'yuttie/comfortable-motion.vim'      " Smooth scrolling
Plug 'MattesGroeger/vim-bookmarks'        " Bookmarks
Plug 'thaerkh/vim-indentguides'           " Visual representation of indents
Plug 'airblade/vim-gitgutter'             " Git symbols next to lines
Plug 'tpope/vim-fugitive'                 " Gstatus and stuff

"-------------------=== Other ===-------------------------------
Plug 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
Plug 'vimwiki/vimwiki'                    " Personal Wiki
Plug 'kien/rainbow_parentheses.vim'       " Rainbow Parentheses
Plug 'dylanaraps/wal.vim'                 " wal color scheme

"-------------------=== Languages support ===-------------------
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Async completions
Plug 'w0rp/ale'                                               " Async linting engine
Plug 'Shougo/neosnippet.vim'                                  " Snippets plugin
Plug 'Shougo/neosnippet-snippets'                             " Snippets db
Plug 'sheerun/vim-polyglot'                                   " Languages syntax
" I dont debug in nvim atm
"Plug 'joonty/vdebug'                                          " XDebug
Plug 'tpope/vim-sleuth'
Plug 'alvan/vim-closetag'

Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'                   " Fuzzy searcher
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

set scrolloff=5                            " let 10 lines before/after cursor during scroll

set clipboard=unnamedplus                   " enable systemwide clipboard
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

" Relative Numbering
nnoremap <leader>rn :set relativenumber!<CR>

" Search settings
set incsearch                                 " incremental search
set hlsearch                                  " highlight search results
set ignorecase                                " only enable case sensitive search if uppercase character was entered

" Comfortable Motion Settings
let g:comfortable_motion_scroll_down_key = "k"
let g:comfortable_motion_scroll_up_key = "l"
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 25  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

" AirLine settings
let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

" NERDTree settings
set modifiable
let NERDTreeWinSize=50
let NERDTreeMinimalUI=1

" Rainbow Parentheses Autoload
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Indent Guides Settings
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

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

" Restricting mutt mail files to 72 characters text width
au BufRead ~/.config/mutt/tmp set tw=72

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
iabbrev </ </<C-X><C-O>
let g:closetag_filenames = '*.html,*.vue'


