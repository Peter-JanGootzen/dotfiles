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

set nocompatible              " required
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

"-------------------=== Languages support ===-------------------
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Async completions
"Plug 'w0rp/ale'                                               " Async linting engine
"Plug 'Shougo/neosnippet.vim'                                  " Snippets plugin
"Plug 'Shougo/neosnippet-snippets'                             " Snippets db
Plug 'sheerun/vim-polyglot'                                   " Languages syntax
"Plug 'joonty/vdebug'                                          " XDebug

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'                   " Fuzzy searcher
"Plug 'mhinz/vim-startify'                 " Nice startup screen
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

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set showmatch                               " shows matching part of bracket pairs (), [], {}

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set directory=$HOME/.nvim/swap//
set backupdir=$HOME/.nvim/backup//

set scrolloff=5                            " let 10 lines before/after cursor during scroll

set clipboard=unnamedplus                   " enable systemwide clipboard
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

" Tabs / Buffers settings
tab sball
set switchbuf=useopen
set laststatus=2
"nmap <F9> :bprev<CR>
"nmap <F10> :bnext<CR>

" Relative Numbering
nnoremap <F4> :set relativenumber!<CR>
" This auto switches relativenumbers, does not work 100% nicely, gets annoying
" fast
" augroup numbertoggle
" autocmd!
" autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

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


" enable mouse with scrolling
if has('mouse')
    set mouse=a
endif

" Keybindings
let mapleader=' '
nnoremap <silent> <leader><leader> :w<CR>
nnoremap <silent> <leader>qw :wq<CR>
nnoremap <silent> <leader>qq :q<CR>
nnoremap <silent> <leader>qf :q!<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fd :call Fzf_dev()<CR>
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader>ag :Ag<CR>
nnoremap <silent> <leader>src :so $MYVIMRC<CR>
nnoremap <silent> <leader>erc :tabe $MYVIMRC<CR>
nnoremap <silent> <leader>oo :NERDTreeToggle<CR>

" Set gitgutter to update every 100ms
set updatetime=100

" Auto start deoplete
let g:deoplete#enable_at_startup = 1

" Custom FZF with file previews and devicons
" No ctrl+x, ctrl+v, ctrl+t though and a lot slower :(
function! Fzf_dev_preview()
  let l:fzf_files_options =
        \ '--preview "echo {} | tr -s \" \" \"\n\" | tail -1 | xargs rougify | head -'.&lines.'"'
  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:parts = split(a:item, ' ')
    let l:file_path = get(l:parts, 1, '')
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

" Custom FZF with devicons
" No ctrl+x, ctrl+v, ctrl+t though and a lot slower :(
function! Fzf_dev()
  function! s:files()
    let files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(files)
  endfunction

  function! s:prepend_icon(candidates)
    let result = []
    for candidate in a:candidates
      let filename = fnamemodify(candidate, ':p:t')
      let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
      call add(result, printf("%s %s", icon, candidate))
    endfor

    return result
  endfunction

  function! s:edit_file(item)
    let parts = split(a:item, ' ')
    let file_path = get(parts, 1, '')
    execute 'silent e' file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m -x +s',
        \ 'down':    '40%' })
endfunction
