" plugin install
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/LeaderF'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
Plugin 'skywind3000/vim-preview'
call vundle#end()

"---------------------------
" NERDTree start
"---------------------------
let NERDTreeWinSize=25
let NERDTreeWinPos="left"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFind<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"----------------------------
" NERDTree end
"----------------------------

"--------------
" NerdComment start
"--------------
filetype plugin on
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
      \ 'c': {
      \   'left': '/*',
      \   'right': '*/'
      \ }
      \ }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Map Ctrl+K to toggle commenting using NERDCommenter
nmap <C-K> <Plug>NERDCommenterToggle
vmap <C-K> <Plug>NERDCommenterToggle
" Map Ctrl+E to comment from cursor position to EOL using NERDCommenter
nmap <C-E> <Plug>NERDCommenterToEOL
vmap <C-E> <Plug>NERDCommenterToEOL
" Map Ctrl+u to add commenting using NERDCommenter
nmap <C-U> <Plug>NERDCommenterUncomment
vmap <C-U> <Plug>NERDCommenterUncomment
"--------------
" NerdComment end
"--------------

"--------------
" Better whitespace
"--------------
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
"--------------
" NerdComment end
"--------------

"--------------
" Vim-airline start
"--------------
" Enable vim-airline
let g:airline#enabled = 1

" Customize the theme (optional)
let g:airline_theme='papercolor'
" Enable powerline symbols (optional, requires a patched font)
let g:airline_powerline_fonts = 1
set background=dark
colorscheme PaperColor
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
let g:lightline = { 'colorscheme': 'PaperColor' }
"------------------------------------------------------------------------------
" Vim-airline end
"-------------------------------------------------------------------------------

"----------------------------
" LeaderF start
"----------------------------
let g:Lf_Ctags="ctags"
let g:Lf_WorkingDirectoryMode = 'AF'
" let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_RootMarkers = ['.root']
let g:Lf_UseVersionControlTool = 0
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowHeight = 0.30
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}
let g:Lf_GtagsAutoGenerate = 0
" let g:Lf_GtagsGutentags = 1

let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-l>'
let winid = 0   " Assign a value to the 'winid' variable
noremap <leader>fh :LeaderfSelf<cr>
noremap <leader>fm :LeaderfMru<cr>
noremap <leader>ff :LeaderfFunction<cr>
noremap <leader>fb :LeaderfBuffer<cr>
noremap <leader>fbt :LeaderfBufTag<cr>
noremap <leader>ft :LeaderfTag<cr>
noremap <leader>fl :LeaderfLine<cr>
noremap <leader>fw :LeaderfWindow<cr>
noremap <leader>frr :LeaderfRgRecall<cr>

"--------------
" LeaderF end
"--------------
"----------------------------------------------------------------------
" Signify
"----------------------------------------------------------------------
let g:signify_vcs_list = ['git', 'svn']
let g:signify_difftool = 'diff'
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change
let g:signify_as_gitgutter           = 1

let g:signify_vcs_cmds = {
            \ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
            \}
"----------------------------------------------------------------------
" Signify end
"----------------------------------------------------------------------
"----------------------------------------------------------------------
" gutentags
"----------------------------------------------------------------------
let g:gutentags_project_root = ['.root']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_add_default_project_roots = 0
let g:gutentags_exclude_git = 1
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" let g:gutentags_modules = ['ctags', 'gtags_cscope']
if exists('g:gutentags_cache_dir') == 0
    let g:gutentags_cache_dir = expand('~/.cache/tags')
endif

if !isdirectory(g:gutentags_cache_dir)
    call mkdir(g:gutentags_cache_dir, 'p')
endif

let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

let g:gutentags_auto_add_gtags_cscope =0
let g:gutentags_define_advanced_commands = 1

" let g:gutentags_define_advanced_commands = 1

if has('win32') || has('win16') || has('win64') || has('win95')
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
endif

let g:gutentags_plus_switch = 1
let g:gutentags_plus_nomap = 1
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>
"----------------------------------------------------------------------
" gutentags
"----------------------------------------------------------------------
"
