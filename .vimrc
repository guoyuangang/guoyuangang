let mapleader = "\<space>"
""""""""""""""""""""""""""""""""""""""""""""""""FILE""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on                                                                      " 类型检测
filetype indent on                                                                      " 自动缩进
set nobackup noswapfile nowb autoread                                                   " 不备份
set encoding=utf8 ffs=unix,dos,mac t_Co=256                                             " 默认格式
set mouse=a selection=exclusive selectmode=mouse,key                                    " 鼠标模式
set switchbuf=newtab stal=2                                                             " 用标签打开
nmap <leader>w :w!<cr>                                                                  " 保存
nmap <leader>q :qa!<cr>                                                                 " 退出
""""""""""""""""""""""""""""""""""""""""""""""""EDIT""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :setlocal spell!<cr>                                                           " 拼写检查
syntax enable                                                                           " 语法高亮
set showmatch mat=2                                                                     " 符号高亮
set hlsearch incsearch ignorecase smartcase                                             " 搜索高亮
map <leader><cr> :noh<cr>                                                               " 取消高亮
set expandtab smarttab shiftwidth=4 tabstop=4 ai si                                     " 智能缩进
set backspace=eol,start,indent clipboard=unnamedplus                                    " 允许删除换行
nmap <C-S-j> mz:m+<cr>`z; vmap <C-S-j> :m'>+<cr>`<my`>mzgv`yo`z                         " 向下移动一行
nmap <C-S-k> mz:m-2<cr>`z; vmap <C-S-k> :m'<-2<cr>`>my`<mzgv`yo`z                       " 向上移动一行
""""""""""""""""""""""""""""""""""""""""""""""""LAYOUT"""""""""""""""""""""""""""""""""""""""""""""""
map <leader>th :tabprevious<cr>; map <leader>tl :tabnext<cr>; map <leader>tm :tabmove   " 移动标签
map <leader>tn :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/;                        " 新建标签
map <leader>tj :tabclose<cr>; map <leader>tk :tabonly<cr>;                              " 关闭标签
set number nowrap scrolloff=5 sidescrolloff=15 showmode showcmd cmdheight=1             " 状态栏边栏
set laststatus=2  statusline=\ \ %{mode()}\ \ %h%m%f\ \ %<%{getcwd()}\ \                " 状态栏左边
set statusline+=%=%{&filetype}\ \ %{&enc}\ \ Column:%c\ \ Line:%l/%L\ \                 " 状态栏右边
""""""""""""""""""""""""""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""""""""""""""