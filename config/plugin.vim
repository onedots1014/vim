" plugin install (vim-plug)
let s:home = g:vim_home
let s:plugdir = s:home . '/plugged'

" Auto-install vim-plug if not found
let s:plug_file = s:home . '/autoload/plug.vim'
if empty(glob(s:plug_file))
    if g:is_win
        silent execute '!powershell -command "New-Item -Path \"' . s:plug_file . '\" -ItemType File -Force; (New-Object Net.WebClient).DownloadFile(''https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'', ''' . s:plug_file . ''')"'
    else
        silent execute '!curl -fLo ' . shellescape(s:plug_file) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:plugdir)
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'github/copilot.vim'
if g:is_nvim
    Plug 'nvim-lua/plenary.nvim'
    Plug 'olimorris/codecompanion.nvim'
endif
call plug#end()

"---------------------------
" NERDTree start
"---------------------------
let NERDTreeWinSize=25
let NERDTreeWinPos="left"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
" Start NERDTree when Vim is started without file arguments.
augroup nerdtree_auto
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
augroup END
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
	  \   'left': '//',
	  \   'right': ''
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
" Better whitespace end
"--------------

"--------------
" Vim-airline start
"--------------
" Customize the theme (optional)
let g:airline_theme='papercolor'
" Enable powerline symbols (optional, requires a patched font)
let g:airline_powerline_fonts = 1
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   },
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
set background=dark
colorscheme PaperColor
"------------------------------------------------------------------------------
" Vim-airline end
"-------------------------------------------------------------------------------

"--------------
" fzf.vim start
"--------------
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_preview_window = ['right,50%', 'ctrl-/']

" Use rg for :Rg if available, ignore .git
if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git"'
endif

" keymap
nnoremap <c-p>      :Files<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fm :History<cr>
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fu :BTags<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fg :Rg<cr>
nnoremap <leader>fc :Commands<cr>
nnoremap <leader>fy :History:<cr>
nnoremap <leader>fh :Helptags<cr>

"--------------
" fzf.vim end
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
set updatetime=300

" mappings to jump to changed blocks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nnoremap <leader>gD :SignifyDiff<cr>
nnoremap <leader>gp :SignifyHunkDiff<cr>
nnoremap <leader>gu :SignifyHunkUndo<cr>

"----------------------------------------------------------------------
" Signify end
"----------------------------------------------------------------------

"----------------------------------------------------------------------
" vim-fugitive
"----------------------------------------------------------------------
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gd :Git diff<cr>
nnoremap <leader>gl :Git log<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>ga :Git add %<cr>
"----------------------------------------------------------------------
" vim-fugitive end
"----------------------------------------------------------------------

"----------------------------------------------------------------------
" gutentags start
"----------------------------------------------------------------------
let g:gutentags_project_root = ['.root']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_add_default_project_roots = 0
let g:gutentags_exclude_git = 1
let g:gutentags_modules = ['ctags', 'gtags_cscope']

if exists('g:gutentags_cache_dir') == 0
    let g:gutentags_cache_dir = expand('$HOME/.cache/tags')
endif

if !isdirectory(g:gutentags_cache_dir)
    call mkdir(g:gutentags_cache_dir, 'p')
endif

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

let g:gutentags_auto_add_gtags_cscope =0
let g:gutentags_define_advanced_commands = 1

if has('win32')
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
endif

let g:gutentags_plus_switch = 1
let g:gutentags_plus_nomap = 1
" Show the quickfix window
nnoremap <Leader>co :copen<CR>

map <C-j> :cn<CR>
map <C-k> :cp<CR>

" Find symbol (reference) under cursor
noremap <silent> <leader>js mA:GscopeFind s <C-R><C-W><cr>
" Find symbol definition under cursor
noremap <silent> <leader>jg :GscopeFind g <C-R><C-W><cr>
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
augroup preview_quickfix
    autocmd!
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
augroup END
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

"----------------------------------------------------------------------
" Copilot
"----------------------------------------------------------------------
let g:copilot_no_tab_map = v:true
inoremap <silent><script><expr> <C-e> copilot#Accept("\<CR>")
let g:copilot_filetypes = {
      \ '*': v:true,
      \ }
"----------------------------------------------------------------------
" Copilot end
"----------------------------------------------------------------------

"----------------------------------------------------------------------
" CodeCompanion (Neovim only)
"----------------------------------------------------------------------
if g:is_nvim
    nnoremap <leader>ai :CodeCompanionChat Toggle<cr>
    vnoremap <leader>ai :CodeCompanionChat Toggle<cr>
    nnoremap <leader>aa :CodeCompanionActions<cr>
    vnoremap <leader>aa :CodeCompanionActions<cr>
    nnoremap <leader>ae :CodeCompanion<space>
endif
"----------------------------------------------------------------------
" CodeCompanion end
"----------------------------------------------------------------------
