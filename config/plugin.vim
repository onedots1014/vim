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
let g:NERDCreateDefaultMappings = 0

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
let g:NERDCommentEmptyLines = 0

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Map Space+K to toggle commenting using NERDCommenter
nmap <leader>k <Plug>NERDCommenterToggle
vmap <leader>k <Plug>NERDCommenterToggle
" Map Space+E to comment from cursor position to EOL using NERDCommenter
nmap <leader>e <Plug>NERDCommenterToEOL
vmap <leader>e <Plug>NERDCommenterToEOL
" Map Space+u to add commenting using NERDCommenter
nmap <leader>u <Plug>NERDCommenterUncomment
vmap <leader>u <Plug>NERDCommenterUncomment
"--------------
" NerdComment end
"--------------

"--------------
" Better whitespace
"--------------
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=0
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

"--------------
" LeaderF start
"--------------
let g:Lf_RootMarkers = ['.root']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_PopupWidth = 0.75
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 1
let g:Lf_HideHelp = 1
let g:Lf_NoChdir = 1

let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
			\ }

let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
let g:Lf_MruMaxFiles = 2048
let g:Lf_StlColorscheme = 'airline'
let g:Lf_PopupColorscheme = 'default'
let g:Lf_PopupColorscheme = 'gruvbox_default'
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_MruEnableFrecency = 1

if (exists('*popup_create') && has('patch-8.1.2000')) || has('nvim-0.4')
	let g:Lf_WindowPosition = 'popup'
endif

let g:Lf_PreviewInPopup = 1
let g:Lf_PopupPreviewPosition='bottom'
let g:Lf_QuickSelect = 0
let g:Lf_GtagsAutoUpdate = 0
let g:Lf_ShortcutF = '<c-p>'
" let g:Lf_ShortcutB = '<c-l>'


"----------------------------------------------------------------------
" preview
"----------------------------------------------------------------------
let g:Lf_PreviewResult = {
		\ 'File': 1,
		\ 'Buffer': 0,
		\ 'Mru': 0,
		\ 'Tag': 0,
		\ 'BufTag': 0,
		\ 'Function': 1,
		\ 'Line': 1,
		\ 'Colorscheme': 0,
		\ 'Rg': 0,
		\ 'Gtags': 0,
		\ 'Snippet': 0,
		\}

"----------------------------------------------------------------------
" keymap
"----------------------------------------------------------------------
if get(g:, 'lf_disable_normal_map', 0) == 0
	nnoremap <space>ff :<c-u>Leaderf file<cr>
	nnoremap <space>fe :<c-u>Leaderf filer<cr>
	nnoremap <space>fb :<c-u>Leaderf buffer<cr>
	nnoremap <space>fm :<c-u>Leaderf mru<cr>
	nnoremap <space>fg :<c-u>Leaderf gtags<cr>
	nnoremap <space>fn :<c-u>Leaderf function<cr>
	nnoremap <space>ft :<c-u>Leaderf tag<cr>
	nnoremap <space>fu :<c-u>Leaderf bufTag<cr>
	nnoremap <space>fs :<c-u>Leaderf self<cr>
	nnoremap <space>fc :<c-u>Leaderf colorscheme<cr>
	nnoremap <space>fy :<c-u>Leaderf cmdHistory<cr>
	nnoremap <space>fj :<c-u>Leaderf jumps<cr>
	nnoremap <space>fq :<c-u>Leaderf quickfix<cr>
endif

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
" Faster sign updates on CursorHold/CursorHoldI
set updatetime=100

" mappings to jump to changed blocks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nnoremap <leader>gd :SignifyDiff<cr>
nnoremap <leader>gp :SignifyHunkDiff<cr>
nnoremap <leader>gu :SignifyHunkUndo<cr>

"----------------------------------------------------------------------
" Signify end
"----------------------------------------------------------------------
"----------------------------------------------------------------------
" gutentags start
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
" Show the quickfix window
nnoremap <Leader>co :copen<CR>

" Hide the quickfix window
" nnoremap <Leader>cc :cclose<CR>
nnoremap <Esc><Esc> :cclose<CR>
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" Find symbol (reference) under cursor
noremap <silent> <leader>js mA:GscopeFind s <C-R><C-W><cr>
" Find symbol definition under cursor
noremap <silent> <leader>jg :GscopeFind g <C-R><C-W><cr>
" noremap <silent> <C-]> : GscopeFind g <C-R><C-W><cr>
" Functions called by this function
noremap <silent> <leader>jc :GscopeFind c <C-R><C-W><cr>
" Functions calling this function
noremap <silent> <leader>jt :GscopeFind t <C-R><C-W><cr>
" Find text string under cursor
noremap <silent> <leader>je :GscopeFind e <C-R><C-W><cr>
" Find file name under cursor
noremap <silent> <leader>jf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" Find files #including the file name under cursor
noremap <silent> <leader>ji :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>

noremap <silent> <leader>jd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ja :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>jz :GscopeFind z <C-R><C-W><cr>
"----------------------------------------------------------------------
" gutentags end
"----------------------------------------------------------------------

"----------------------------------------------------------------------
" Preview start
"----------------------------------------------------------------------
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>"
"----------------------------------------------------------------------
" preview file
"----------------------------------------------------------------------
function! s:PreviewFile(...)
	if a:0 == 0
		return
	endif
	let filename = expand(a:{a:0})
	let nohl = 0
	let cmd = ''
	for i in range(a:0 - 1)
		let item = a:{i + 1}
		let head = strpart(item, 0, 2)
		if head == '+:'
			let cmd = strpart(item, 2)
		elseif head == '++'
			if item == '++nohl'
				let nohl = 1
			endif
		endif
	endfor
	if !filereadable(filename)
		call preview#errmsg('ERROR: preview: file not find "'. filename.'"')
		return
	endif
	call preview#preview_edit(-1, filename, -1, cmd, nohl)
endfunc


command! -nargs=+ -complete=file PreviewFile call s:PreviewFile(<f-args>)
command! -nargs=0 PreviewClose call preview#preview_close()


"----------------------------------------------------------------------
" preview tag
"----------------------------------------------------------------------
function! s:PreviewTag(...)
	let tagname = (a:0 > 0)? a:1 : expand('<cword>')
	call preview#preview_tag(tagname)
endfunc

command! -nargs=? PreviewTag call s:PreviewTag(<f-args>)


"----------------------------------------------------------------------
" preview signature
"----------------------------------------------------------------------
function! s:PreviewSignature(bang, ...)
	let funcname = (a:0 > 0)? a:1 : ""
	if a:bang
		let funcname = '<?>'
	endif
	call preview#function_echo(funcname, 0)
endfunc

command! -nargs=? -bang PreviewSignature call s:PreviewSignature(<bang>0, <f-args>)


"----------------------------------------------------------------------
" preview tags in quickfix
"----------------------------------------------------------------------
function! s:PreviewList(bang, ...)
	let name = (a:0 > 0)? a:1 : expand('<cword>')
	let size = preview#quickfix_list(name, a:bang, &filetype)
	if size > 0
		redraw | echo "" | redraw
		echo "PreviewList: ". size . " tags listed."
	endif
endfunc

command! -nargs=? -bang PreviewList call s:PreviewList(<bang>0, <f-args>)


"----------------------------------------------------------------------
" preview scroll
"----------------------------------------------------------------------
function! s:PreviewScroll(bang, offset)
	if a:bang == 0
		call preview#preview_scroll(str2nr(a:offset))
	else
		call preview#previous_scroll(str2nr(a:offset))
	endif
endfunc

command! -nargs=1 -bang PreviewScroll call s:PreviewScroll(<bang>0, <f-args>)



"----------------------------------------------------------------------
" goto the preview window
"----------------------------------------------------------------------
command! -nargs=1 PreviewGoto call preview#preview_goto(<q-args>)


"----------------------------------------------------------------------
" preview files for quickfix
"----------------------------------------------------------------------
function! s:PreviewQuickfix(...)
	let linenr = (a:0 > 0)? a:1 : 0
	call preview#preview_quickfix(linenr)
endfunc


command! -nargs=? PreviewQuickfix call s:PreviewQuickfix(<f-args>)

"----------------------------------------------------------------------
" Preview end
"----------------------------------------------------------------------
