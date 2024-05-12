call plug#begin('~/vimconfig/bundles')
Plug 'Yggdroot/LeaderF' ", { 'do': ':LeaderfInstallCExtension' }
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons' "this is not config successful
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'preservim/nerdcommenter'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
call plug#end()

" PLUGIN SETTINGS ------------------------------------------------ {{{

"--------------
" LeaderF start
"--------------
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_WindowPosition = "bottom"
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {
         \ 'File': 1,
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
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-l>'
noremap <leader>fh :LeaderfSelf<cr>
noremap <leader>fm :LeaderfMru<cr>
noremap <leader>ff :LeaderfFunction<cr>
noremap <leader>fb :LeaderfBuffer<cr>
noremap <leader>fbt :LeaderfBufTag<cr>
noremap <leader>ft :LeaderfTag<cr>
noremap <leader>fl :LeaderfLine<cr>
noremap <leader>fw :LeaderfWindow<cr>
noremap <leader>frr :LeaderfRgRecall<cr>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
"--------------
" LeaderF end
"--------------

"--------------
" NerdTree start
"--------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>e :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"--------------
" NerdTree end
"--------------

"--------------
" Vim-airline start
"--------------
" Enable vim-airline
let g:airline#enabled = 1

" Customize the theme (optional)
" Uncomment and set a theme of your choice
" let g:airline_theme = 'your_theme_name'
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
"--------------
" Vim-airline end
"--------------

"--------------
" NerdComment start
"--------------
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
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Map Ctrl+K to add commenting using NERDCommenter
" nmap <C-K> <Plug>NERDCommenterComment
" vmap <C-K> <Plug>NERDCommenterComment
" Map Ctrl+u to add commenting using NERDCommenter
nmap <C-U> <Plug>NERDCommenterUncomment
vmap <C-U> <Plug>NERDCommenterUncomment
" Map Ctrl+K to toggle commenting using NERDCommenter
nmap <C-K> <Plug>NERDCommenterToggle
vmap <C-K> <Plug>NERDCommenterToggle
" Map Ctrl+E to comment from cursor position to EOL using NERDCommenter
nmap <C-E> <Plug>NERDCommenterToEOL
vmap <C-E> <Plug>NERDCommenterToEOL
"--------------
" NerdComment end
"--------------
"
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
