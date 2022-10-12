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

" this centers the cursor on screen when possible
set scrolloff=999

" add vertical line at col
set colorcolumn=81

" show indicator in bottom right when <leader> key is pressed
set showcmd

" set leader key to <space>
let mapleader = " "

" fzf gui to use 40% of bottom of buffer
let g:fzf_layout = { 'down': '40%' }

" install plugins with plug
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

" Plugin settings
"
" Prettier
" auto format on save
let g:prettier#autoformat = 1
" don't require @prettier pragma at top of files
let g:prettier#autoformat_require_pragma = 0
"
" Gruvbox (colorscheme)
" set colorscheme to grubox
colorscheme gruvbox 
" gruvbox variant
let g:gruvbox_contrast_dark= 'hard'
"
" vim-todo-lists 
"
" Move items on complete
let g:VimTodoListsMoveItems = 1
" Add dates to new items
let g:VimTodoListsDatesEnabled = 1
" Format for dates 221011 20:49:15
let g:VimTodoListsDatesFormat = "%y%m%d %T"
" something to do with nested todos but honestly IDK - transition away from this
" plugin anyways
let g:VimTodoListsKeepSameIndent = 0
"
" lightline 
" 
" always show status bar (lightline) 
set laststatus=2
" lightline includes the mode so disable the default vim display
set noshowmode
"
" Enables preview window for Rg global search results (straight from docs)
" Rg with preview window
" https://github.com/junegunn/fzf.vim#example-rg-command-with-preview-window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Remaps
" Move to beginning/end of line without taking my fingers off of home row:
nnoremap H ^
nnoremap L $

" remap escape so I don't have to stretch so dang much. apparently
inoremap <nowait> jk <esc>

" badhabits
" no-op some default keys so I learn the remaps
inoremap <esc> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

" git blame - update the log output to something legible
let g:fzf_commits_log_options = '--date=relative --pretty=format:"%h%x09%an%x09%ad%x09%s"'

" fzf and ripgrep keymaps
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Rg 

" these are really only used in Vim - neovim has reasonable defaults
" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[1 q"

" allow yanking to sys clipboard (so I can yank and <C-v> outside of vim)
set clipboard=unnamed

" clear highlighting
map <leader>h :noh<CR>
" format file with prettier
map <leader>f :Prettier<CR>
" source vimrc (use after saving changes to vimrc so I don't have to manually
" reastart)
map <leader>r :so ~/.dotfiles/vim/.vimrc<CR>
" remap vim fugitive commands to something closer to my bash aliases
map <leader>ga :G add .<CR>
map <leader>gc :G commit .<CR>
map <leader>gs :G status<CR>
map <leader>gd :G diff --cached<CR>

"todo emoji (my own todo plugin)
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
