let mapleader=" "

if !g:is_nvim
    set nocompatible      " Use Vim defaults instead of Vi defaults
endif
syntax on             " Enable syntax highlighting

" Enable true color support
if has('termguicolors')
    if !g:is_nvim
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif

set backspace=eol,start,indent  " Allow backspacing over everything in insert mode
set autoindent        " Enable auto-indentation
set cindent           " Enable C-style indenting
if exists('+winaltkeys')
    set winaltkeys=no     " Disable Alt key mappings in Windows
endif
set wrap              " Enable line wrapping
if !g:is_nvim
    set ttimeout          " Enable timeout for key codes
    set ttimeoutlen=50    " Set timeout length to 50 ms
endif
set cmdheight=1       " Set command-line height to 1 row
set ruler             " Show line and column number in the status line
if !g:is_nvim
    set nopaste           " Disable automatic pasting
endif
set display=lastline  " Show as much as possible of the last line

set shiftwidth=4      " Set indentation width to 4 spaces
set softtabstop=4     " Set soft tab stop to 4 spaces
set noexpandtab       " Use real tabs instead of spaces
set tabstop=4         " Set tab width to 4 spaces

if has('multi_byte')
    set encoding=utf-8           " Set default encoding to UTF-8
    set fileencoding=utf-8       " Set file encoding to UTF-8
    set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1  " Specify file encodings
endif

set formatoptions+=m  " Automatically insert comment leader after hitting <Enter> in Insert mode
set formatoptions+=B  " Auto-wrap text using textwidth or wrapmargin rather than inserting <EOL>s
set showcmd           " Show (partial) command in status line
set hlsearch          " Highlight search results
set incsearch         " Incremental search

" Enable mouse support
set mouse=a
set selection=inclusive
set selectmode=
set splitright
set fillchars+=vert:¦

set ignorecase        " Ignore case when searching
set smartcase         " Override 'ignorecase' if the search pattern contains uppercase characters
" Disable highlighting after the cursor is still for a while
" autocmd cursorhold * set nohlsearch
" Enable highlighting when using 'n'
noremap n :set hlsearch<cr>n
" Enable highlighting when using 'N'
noremap N :set hlsearch<cr>N
" Enable highlighting when using '/'
noremap / :set hlsearch<cr>/
" Enable highlighting when using '?'
noremap ? :set hlsearch<cr>?
" Enable highlighting when using '*'
noremap * *:set hlsearch<cr>

" Disable search highlighting with <Leader>nh
nnoremap <Leader>nh :nohlsearch<CR>

augroup vimconfig
    autocmd!
    autocmd FileType make set noexpandtab  " Disable expanding tabs in makefiles
" set autowriteall      " Automatically save before executing a command that expects you to confirm modifications
if !g:is_nvim
    set pastetoggle=<F9>   " Toggle paste mode with F9 to avoid automatic indenting
endif
set wildmenu          " Enhanced command-line completion
set laststatus=2      " Always show status line
set number            " Show line numbers
if has('unnamedplus')
    set clipboard=unnamedplus  " Use the system clipboard for copy and paste operations
else
    set clipboard=unnamed
endif
set nobackup          " Prevent Vim from creating backup files

if g:is_nvim
    let s:undodir = stdpath('data') . '/undo'
else
    let s:undodir = $HOME . '/.undo_history'
endif
if !isdirectory(s:undodir)
    call mkdir(s:undodir, 'p')
endif
let &undodir = s:undodir
set undofile          " Enable persistent undo across Vim sessions
set scrolloff=2       " Keep at least 2 lines above and below the cursor when scrolling
set showmatch         " Show matching brackets when cursor is over them
set matchtime=3       " Tenths of a second to show the matching bracket
" When reopening a file, go to the last known cursor position
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   execute "normal! g`\"" |
          \ endif
augroup END

