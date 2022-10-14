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

" allows switching of buffers without saving
set hidden

" this centers the cursor on screen when possible
set scrolloff=999

" add vertical line at col
set colorcolumn=81

set signcolumn=yes

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

Plug 'gruvbox-community/gruvbox'
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
Plug 'luetkemj/vim-todo-lists'
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
call plug#end()

" Plugin settings
"
" emmet
" allow for custom snippets in a json file
"let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.dotfiles/.snippets_custom.json')),"\n"))
"
" Prettier
" auto format on sa
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
" lightline options
" always show status bar (lightline) 
set laststatus=2
" lightline includes the mode so disable the default vim display
set noshowmode
" show current git branch in lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
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

" escape with 'jk'
inoremap jk <esc>

" badhabits
" no-op some default keys so I learn the remaps
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

" git blame - update the log output to something legible
let g:fzf_commits_log_options = '--date=relative --pretty=format:"%h%x09%an%x09%ad%x09%s"'

" fzf and ripgrep keymaps
map <leader>p :Files<CR>
map <leader>o :Buffers<CR>
map <leader>g :GFiles<CR>
map <leader>f :Rg 

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


