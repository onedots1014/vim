let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '. fnameescape(s:home."/<args>")
exec 'set rtp+='. fnameescape(s:home)

" Platform detection
let g:is_nvim = has('nvim')
let g:is_win = has('win32') || has('win64')
let g:is_vscode = exists('g:vscode')
let g:vim_home = s:home

if !g:is_nvim
    exec 'set rtp+=' . expand('~/.vim')
endif

IncScript config/vimconfig.vim

if !g:is_vscode
    IncScript config/plugin.vim
    if g:is_nvim
        exec 'luafile ' . fnameescape(s:home . '/config/ai.lua')
    endif
endif

IncScript config/keymap.vim
