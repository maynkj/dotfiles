let mapleader = ","

map Q <Nop>
map q <Nop>
map K <Nop>
map ` <Nop>

" turn off search highlight
map <leader><space> :nohl<CR>

" open/closes folds
nnoremap <space> za

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" edit vimrc/rcrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp $HOME/.rcrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" open ag.vim
nnoremap <leader>a :Ag<space>
