"                .::::.
"   ___________ :;;;;:`____________
"   \_________/ ?????L \__________/
"     |.....| ????????> :.......'
"     |:::::| $$$$$$"`.:::::::' ,
"    ,|:::::| $$$$"`.:::::::' .OOS.
"  ,7D|;;;;;| $$"`.;;;;;;;' .OOO888S.
".GDDD|;;;;;| ?`.;;;;;;;' .OO8DDDDDNNS.
" 'DDO|IIIII| .7IIIII7' .DDDDDDDDNNNF`
"   'D|IIIIII7IIIII7' .DDDDDDDDNNNF`
"     |EEEEEEEEEE7' .DDDDDDDNNNNF`
"     |EEEEEEEEZ' .DDDDDDDDNNNF`
"     |888888Z' .DDDDDDDDNNNF`
"     |8888Z' ,DDDDDDDNNNNF`
"     |88Z'    /"DNNNNNNN"
"     '"'        /"MMMM"
"                  /""

filetype off
set hidden

" Plugins
call plug#begin('~/.config/nvim/plugged')

"-------------------=== Code/Project navigation ===-------------
Plug 'scrooloose/nerdtree'                          " Project and file navigation
Plug 'ryanoasis/vim-devicons'                       " Vimicons
Plug 'vim-airline/vim-airline'                      " Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'               " Themes for airline
Plug 'airblade/vim-gitgutter'                       " Git symbols next to lines
Plug 'tpope/vim-fugitive'                           " Gstatus and stuff
"Plug 'airblade/vim-rooter'                          " Opens vim in the parent git directory when opening a file
Plug '/usr/bin/fzf'                                 " The fuzzy searcher,
Plug 'junegunn/fzf.vim'                             " with vim support
Plug 'mhinz/vim-startify'                           " Fancy start screen

"-------------------=== Languages support, linting and completions ===-------------------
Plug 'sheerun/vim-polyglot'                         " Languages syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Language Server Protocol client and completion engine
"Plug 'SirVer/ultisnips'                             " Snippets engine
"Plug 'honza/vim-snippets'                           " Snippets pack
Plug 'rust-lang/rust.vim'                           " Rust support

"-------------------=== Other ===-------------------------------
Plug 'luochen1990/rainbow'                          " Rainbow Parentheses
Plug 'thaerkh/vim-indentguides'                     " Visual representation of indents
Plug 'tpope/vim-sleuth'                             " Figures the indenting style of the current file out
Plug 'alvan/vim-closetag'                           " Automaticly inserts closing tags when HTMLing
Plug 'joshdick/onedark.vim'                         " Color theme

call plug#end()
filetype plugin indent on


"" General settings
set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration
set updatetime=100                          " For fast programming

set encoding=utf-8
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent                              " indent when moving to the next line while writing code
set smarttab                                " set tabs for a shifttabs logic

set showmatch                               " highlights matching part of bracket pairs (), [], {}

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set directory=$HOME/.nvim/swap//
set backupdir=$HOME/.nvim/backup//
set undodir=$HOME/.nvim/undo//
set undofile

set scrolloff=5                             " let 5 lines before/after cursor during scroll

set clipboard=unnamedplus                   " enable systemwide clipboard
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

" Search settings
set incsearch                                 " incremental search
set hlsearch                                  " highlight search results
set ignorecase                                " only enable case sensitive search if uppercase character was entered

" Theming
set termguicolors                           " enable full 24-bit color support
" onedark.vim settings override, custom bg
if (has("autocmd") && !has("gui_running"))
  augroup colors
    autocmd!
    let s:background = { "gui": "#212121", "cterm": "235", "cterm16": "0" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background }) "No `fg` setting
  augroup END
endif
let g:airline_theme='onedark'
color onedark
syntax enable

" AirLine settings
let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

" NERDTree settings
set modifiable
let NERDTreeWinSize=50
let NERDTreeMinimalUI=1

" Closetags
let g:closetag_filenames = '*.html,*.vue'

" Rain parentheses
let g:rainbow_active = 1

" Restricting mutt mail files to 120 characters text width
au BufRead ~/.config/mutt/tmp set tw=120

autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

"--------------=== coc.nvim settings ===----------------
" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


function! SwitchHeaderAndSource()
    let l:alter = CocRequest('clangd', 'textDocument/switchSourceHeader', {'uri': 'file://'.expand("%:p")})
    " remove file:/// from response
    let l:alter = substitute(l:alter, "file://", "", "")
    execute 'edit ' . l:alter
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Keybindings
"" These keybindings mimick Doom emacs
let mapleader=' '
nnoremap <silent> <leader><leader> :Files<CR>
nnoremap <silent> <leader>qw  :wq<CR>
nnoremap <silent> <leader>bd  :bd<CR>
nnoremap <silent> <leader>qq  :q<CR>
nnoremap <silent> <leader>qf  :q!<CR>
nnoremap <silent> <leader>ff  :Files<CR>
nnoremap <silent> <leader>fs  :w<CR>
nnoremap <silent> <leader>fg  :GFiles<CR>
nnoremap <silent> <leader>fd  :call Fzf_dev()<CR>
nnoremap <silent> <leader>fc  :Ag<CR>
nnoremap <silent> <leader>bb  :Buffers<CR>
nnoremap <silent> <leader>src :so $MYVIMRC<CR>
nnoremap <silent> <leader>erc :edit $MYVIMRC<CR>
nnoremap <silent> <leader>op  :NERDTreeToggle<CR>
nnoremap <silent> <leader>sh  :GitGutterStageHunk<CR>
nnoremap <silent> <leader>nh  :GitGutterNextHunk<CR>
nnoremap <silent> <leader>ph  :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>cf  :!cargo fmt<CR>
nnoremap <silent> <leader>cc  :call SwitchHeaderAndSource()<CR>
nnoremap <silent> <leader>sr  :set relativenumber!<CR>
nnoremap <silent> <leader>k   :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>a   :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>c   :<C-u>CocList commands<cr>
nnoremap <silent> <leader>o   :<C-u>CocList outline<cr>
nnoremap <silent> <leader>s   :<C-u>CocList -I symbols<cr>

nmap     <silent> <leader>ac  <Plug>(coc-codeaction)
nmap     <silent> <leader>cf  <Plug>(coc-fix-current)
nmap     <silent> <leader>gd  <Plug>(coc-definition)
nmap     <silent> <leader>gy  <Plug>(coc-type-definition)
nmap     <silent> <leader>gi  <Plug>(coc-implementation)
nmap     <silent> <leader>gr  <Plug>(coc-references)
nmap     <silent> <leader>g< <Plug>(coc-diagnostic-prev)
nmap     <silent> <leader>g> <Plug>(coc-diagnostic-next)


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

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END
