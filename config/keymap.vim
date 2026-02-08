nnoremap <Leader>r :source $MYVIMRC<CR>

nnoremap <leader>v :vsplit<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>qv :qa!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wa<CR>:q<CR>

nnoremap <Leader>d0 :1,.d<CR>
nnoremap <Leader>d$ :,$d<CR>
nnoremap <leader>em :set mouse=a<CR>
nnoremap <leader>dm :set mouse=v<CR>
nnoremap <leader>sn :set nu!<CR>

nnoremap <Leader>wh :vertical resize -30<CR>
nnoremap <Leader>wl :vertical resize +30<CR>
nnoremap <Leader>wk :res +10<CR>
nnoremap <Leader>wj :res -10<CR>

inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-h> <Left>
" 打开终端快捷键：<Leader>t
nnoremap <silent> <Leader>t :botright term<CR>

" 定义快捷键 qt 强制退出终端模式并关闭终端窗口
tnoremap <Leader>qt <C-\><C-n>:q!<CR>

