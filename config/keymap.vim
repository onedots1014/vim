vnoremap <Leader>c "*y
"nmap <Leader>v "*p
"nmap <Leader>v vsplit
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

noremap <leader>nw <C-W><C-W>
noremap <Leader>wh <C-w>h
noremap <Leader>wl <C-w>l
noremap <Leader>wk <C-w>k
noremap <Leader>wj <C-w>j

noremap <Leader>tu :tabe<CR>
noremap <Leader>tn :-tabnext<CR>
noremap <Leader>ti :+tabnext<CR>
noremap <Leader>sv <C-w>t<C-w>H
noremap <Leader>sh <C-w>t<C-w>K

"noremap <leader>fw :FixWhitespace<cr>
noremap <Leader>sh :set nosplitright<CR>:vsplit
noremap <Leader>sl :set splitright<CR>:vsplit
noremap <Leader>sk :set nosplitbelow<CR>:split
noremap <Leader>sj :set splitbelow<CR>:split

noremap <Leader>h :vertical resize -30<CR>
noremap <Leader>l :vertical resize +30<CR>
noremap <Leader>k :res +10<CR>
noremap <Leader>j :res -10<CR>

nmap <Leader>r :source $MYVIMRC<CR>


map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
noremap <leader>df :Gdiff<cr>
map <C-k> <Plug>NERDCommenterToggle
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk
"----------------------------
" LeaderF start
"----------------------------
noremap <leader>f :LeaderfSelf<cr>
noremap <leader>fm :LeaderfMru<cr>
noremap <leader>ff :LeaderfFunction<cr>
noremap <leader>fb :LeaderfBuffer<cr>
noremap <leader>ft :LeaderfBufTag<cr>
noremap <leader>fl :LeaderfLine<cr>
noremap <leader>fw :LeaderfWindow<cr>
noremap <leader>frr :LeaderfRgRecall<cr>
"--------------
" LeaderF end
"--------------

