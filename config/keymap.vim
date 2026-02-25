nnoremap <Leader>d0 :1,.d<CR>
nnoremap <Leader>d$ :,$d<CR>

inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-h> <Left>

" VSCode handles windows, terminal, etc.
if g:is_vscode
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
