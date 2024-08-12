nmap <Leader>r :source $MYVIMRC<CR>

nnoremap <leader>v :vsplit<CR>
noremap <Leader>q :q<CR>
noremap <Leader>Q :q!<CR>
noremap <Leader>qv :qa!<CR>
noremap <Leader>w :w<CR>
noremap <Leader>wq :wa<CR>:q<CR>

noremap <Leader>d0 :1,.d<CR>
noremap <Leader>d$ :,$d<CR>
noremap <leader>em :set mouse=a<CR>
noremap <leader>dm :set mouse=v<CR>
noremap <leader>sn :set nu!<CR>

noremap <Tab>h :vertical resize -30<CR>
noremap <Tab>l :vertical resize +30<CR>
noremap <Tab>k :res +10<CR>
noremap <Tab>j :res -10<CR>

inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-h> <Left>
" 打开终端快捷键：<Leader>t
nnoremap <silent> <Leader>t :botright term<CR>

" 定义快捷键 qt 强制退出终端模式并关闭终端窗口
tnoremap qt <C-\><C-n>:q!<CR>

