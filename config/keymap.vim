nnoremap <Leader>d0 :1,.d<CR>
nnoremap <Leader>d$ :,$d<CR>

inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-h> <Left>

" VSCode: map leader keys to VSCode commands
if g:is_vscode
    nnoremap <leader>v <Cmd>call VSCodeCall('workbench.action.splitEditorRight')<CR>
    nnoremap <Leader>q <Cmd>call VSCodeCall('workbench.action.closeActiveEditor')<CR>
    nnoremap <Leader>Q <Cmd>call VSCodeCall('workbench.action.closeActiveEditor')<CR>
    nnoremap <Leader>qv <Cmd>call VSCodeCall('workbench.action.closeAllEditors')<CR>
    nnoremap <Leader>w <Cmd>call VSCodeCall('workbench.action.files.save')<CR>
    nnoremap <Leader>wq <Cmd>call VSCodeCall('workbench.action.files.saveAll')<CR><Cmd>call VSCodeCall('workbench.action.closeActiveEditor')<CR>
    nnoremap <Leader>t <Cmd>call VSCodeCall('workbench.action.terminal.toggleTerminal')<CR>
    nnoremap <Leader>ff <Cmd>call VSCodeCall('workbench.action.quickOpen')<CR>
    nnoremap <Leader>fg <Cmd>call VSCodeCall('workbench.action.findInFiles')<CR>
    nnoremap <Leader>fb <Cmd>call VSCodeCall('workbench.action.showAllEditors')<CR>
    nnoremap <Leader>nh <Cmd>call VSCodeCall('editor.action.clearSearchResults')<CR>
    nnoremap <Leader>k <Cmd>call VSCodeCall('editor.action.commentLine')<CR>
    vnoremap <Leader>k <Cmd>call VSCodeCall('editor.action.commentLine')<CR>
    nnoremap <Leader>sn <Cmd>call VSCodeCall('editor.action.toggleLineNumbers')<CR>
    finish
endif

nnoremap <Leader>r :source $MYVIMRC<CR>

nnoremap <leader>v :vsplit<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>qv :qa!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wa<CR>:q<CR>

nnoremap <leader>em :set mouse=a<CR>
nnoremap <leader>dm :set mouse=v<CR>
nnoremap <leader>sn :set nu!<CR>

nnoremap <Leader>wh :vertical resize -30<CR>
nnoremap <Leader>wl :vertical resize +30<CR>
nnoremap <Leader>wk :res +10<CR>
nnoremap <Leader>wj :res -10<CR>

" Open terminal
if g:is_nvim
    nnoremap <silent> <Leader>t :botright split \| terminal<CR>
else
    nnoremap <silent> <Leader>t :botright term<CR>
endif

" Force quit terminal mode and close terminal window
tnoremap <Leader>qt <C-\><C-n>:q!<CR>
