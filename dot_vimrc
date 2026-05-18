
" ##### because need a POSIX compatible shell  {{
set shell=/bin/bash
" "}}}

" ##### Plugins {{
call plug#begin('~/.vim/plugged')
  Plug 'nordtheme/vim'                 " color
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " sidebar
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'itchyny/lightline.vim'         " status bar
  Plug 'bling/vim-bufferline'          " status bar - list buffers
  Plug 'scrooloose/syntastic'          " status bar - display syntax checking
  Plug 'ctrlpvim/ctrlp.vim'            " search 
  Plug 'terryma/vim-multiple-cursors'  " multiple cursor editor
  Plug 'tpope/vim-fugitive'            " git
  Plug 'editorconfig/editorconfig-vim'
  Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  Plug 'fatih/vim-go', { 'for': 'go' }
  Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
  Plug 'pearofducks/ansible-vim'
  Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
  Plug 'elzr/vim-json', { 'for': 'json' }
  Plug 'cespare/vim-toml', { 'branch': 'main', 'for': 'toml' }
call plug#end()
" "}}}

" ##### general config  {{
set number         " Show line numbers
set linebreak      " Break lines at word (requires Wrap lines)
set showbreak=+++  " Wrap-broken line prefix
set showmatch      " Highlight matching brace
set visualbell     " Use visual bell (no beeping)
" "}}}

" ##### rule  {{{"
set ruler
set colorcolumn=80
set textwidth=80   " Line wrap (number of cols)
" "}}}

" ##### search  {{{
set hlsearch       " Highlight all search results
set smartcase      " Enable smart-case search
set ignorecase     " Always case-insensitive
set incsearch      " Searches for strings incrementally
" "}}}

" ##### indent  {{{
set autoindent     " Auto-indent new lines
set expandtab      " Use spaces instead of tabs
set shiftwidth=4   " Number of auto-indent spaces
set softtabstop=4  " Number of spaces per Tab
" "}}}

" ##### advanced  {{{
set backspace=indent,eol,start  " Backspace behaviour
set undolevels=999              " Number of undo levels 
" "}}}

" ##### colors && syntax highlighting  {{
colorscheme nord
set background=dark
set t_Co=256
" "}}}

" ##### ignore files in navegation tree  {{
set wildmode=list:longest
set wildignore+=[Dd]esktop.ini    " Windows
set wildignore+=*~                " Linux
set wildignore+=.DS_Store         " macOS
set wildignore+=.git,.hg,.svn     " version control
set wildignore+=*.pyc,__pycache__ " Python
set wildignore+=*.egg-info
set wildignore+=*.swp             " Vim 
set wildignore+=.idea*            " Jetbrains IDEs 
set wildignore+=*.sqlite,*.db     " SQLite and Thumbs.db (Windows)
" "}}}

" ##### invisible chars {{{
set list
set listchars=eol:\⁋,tab:\⇥.,trail:~,extends:>,precedes:<,space:\∙
" "}}}

" ##### $ {{{
let mapleader = ";"
" "}}}

" ##### disable arrow key  {{{
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
" "}}}

" ##### simple way in vanilla vimL to close (, [ and { {{{
" https://stackoverflow.com/a/34992101/6442689
" inoremap \" \""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O
" "}}}

" ##### scrooloose/nerdtree  {{{
" auto change root in NERDTree
" http://stackoverflow.com/a/5818335
set autochdir
let NERDTreeChDirMode=2
" nnoremap <leader>n :NERDTree .<CR>
map <leader>n :NERDTreeToggle<CR>

" NERDTree on righ
" http://stackoverflow.com/a/5116379
let g:NERDTreeWinPos = "right"

" Show hidden files aka .files
" https://stackoverflow.com/a/5057406/6442689
let NERDTreeShowHidden=1

" folding indicator
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let g:NERDTreeShowBookmarks = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMouseMode = 2
let g:NERDTreeKeepTreeInNewTab = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

" respect rules from wildignore
let g:NERDTreeRespectWildIgnore=1

" create list to ignore in nav tree
" let g:NERDTreeIgnore = [
"         \ '\.bzr$',
"         \ '\.db$',
"         \ '\.py[cd]$',
"         \ '\.pyc$',
"         \ '\.rbc$',
"         \ '\.sqlite$',
"         \ '\.swo$',
"         \ '\.swp$',
"         \ '\~$',
"         \ '^\.git$',
"         \ '^\.hg$',
"         \ '^\.svn$',
"         \ '__pycache__',
"         \ ]
" "}}}

" ##### itchyny/lightline.vim  {{{
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }
" "}}}

" ##### bling/vim-bufferline  {{{
let g:bufferline_echo = 1
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
let g:bufferline_modified = '+'
let g:bufferline_show_bufnr = 1
let g:bufferline_fname_mod = ':t'
let g:bufferline_active_highlight = 'StatusLine'
" "}}}

" ##### scrooloose/syntastic  {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" "}}}

" ##### hashivim/vim-terraform  {{{
let g:terraform_fmt_on_save = 1
let g:terraform_align = 0
let g:terraform_fold_sections = 0
" "}}}
