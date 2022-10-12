echo ">^.^<"
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" turn on syntax highlighing
syntax on

" Add numbers to each line on the left-hand side.
set number

" makes numbers on the left-hand side relative to cursor
set relativenumber

" highlight search results
set hlsearch

set tw=80

" this centers the cursor on screen when possible
set scrolloff=999

" add vertical line at col
set colorcolumn=81

set showcmd
let mapleader = " "

let g:fzf_layout = { 'down': '40%' }
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" color scheem cobalt2
" Plug 'joshdick/onedark.vim'	
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'eslint/eslint'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }
Plug 'tpope/vim-surround'
" Plug 'aserebryakov/vim-todo-lists'
Plug 'luetkemj/vim-todo-lists'
call plug#end()

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

let g:gruvbox_contrast_dark= 'hard'
colorscheme gruvbox 

" vim-todo-lists options
let g:VimTodoListsMoveItems = 1
let g:VimTodoListsDatesEnabled = 1
let g:VimTodoListsDatesFormat = "%y%m%d %T"
let g:VimTodoListsKeepSameIndent = 0
" %y%m%d

" lightline options
" always show status bar (lightline) 
set laststatus=2
" lightline includes the mode so disable the default
set noshowmode

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Rg with preview window
" https://github.com/junegunn/fzf.vim#example-rg-command-with-preview-window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Move to beginning/end of line without taking my fingers off of home row:
nnoremap H ^
nnoremap L $

" remap escape so I don't have to stretch so dang much. apparently
inoremap <nowait> jk <esc>

" badhabits
let g:fzf_commits_log_options = '--date=relative --pretty=format:"%h%x09%an%x09%ad%x09%s"'


" fzf and ripgrep keymaps
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Rg 

" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[1 q"

" allow yanking to sys clipboard
set clipboard=unnamed

map <leader>h :noh<CR>
map <leader>f :Prettier<CR>
map <leader>r :so ~/.dotfiles/vim/.vimrc<CR>
map <leader>ga :G add .<CR>
map <leader>gc :G commit .<CR>
map <leader>gs :G status<CR>
map <leader>gd :G diff --cached<CR>

"todo emoji
function! MakeTodoEmojiComplete()
  normal! mz
  normal! 0f[lsx
  normal! `z
endfunction
function! MakeTodoEmojiIncomplete()
  normal! mz
  normal! 0f[ls 
  normal! `z
endfunction


nnoremap <leader>tt :call MakeTodoEmojiComplete()<cr>
nnoremap <leader>tr :call MakeTodoEmojiIncomplete()<cr>
nnoremap <leader>th o🏠 [ ] - <esc>a
nnoremap <leader>tw o💻 [ ] - <esc>a
nnoremap <leader>tp o😶 [ ] - <esc>a

" open vimrc in a splt for quick editing
nnoremap <leader>ev :vsplit ~/.dotfiles/vim/.vimrc<cr>
