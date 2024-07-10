let mapleader = "\<space>"
""""""""""""""""""""""""""""FILE""""""""""""""""""""""""""""
set nobackup noswapfile nowb autoread           " 不创建备份文件
set encoding=utf8 ffs=unix,dos,mac t_Co=256
set mouse=a selection=exclusive selectmode=mouse,key  " 鼠标模式
set switchbuf=newtab stal=2
set clipboard=unnamedplus
map <leader>cd :cd %:p:h<cr>:pwd<cr>            " 查看当前文件路径
nmap <leader>w :w!<cr>
nmap <leader>q :qa!<cr>
""""""""""""""""""""""""""""EDIT""""""""""""""""""""""""""""
syntax enable                                   " 语法高亮开关
filetype plugin on                              " 文件类型检测插件
filetype indent on                              " 文件类型自动缩进
set expandtab smarttab shiftwidth=4 tabstop=4   " 智能缩进
set backspace=eol,start,indent  ai si           " 允许删除换行和缩进
set showmatch mat=2                             " 高亮成对的符号
set hlsearch incsearch ignorecase smartcase     " 搜索时，忽略大小写、高亮匹配项
map <leader><cr> :noh<cr>                       " 取消搜索高亮
map <F7> :setlocal spell!<cr>                   " 拼写检查开关
nmap <C-S-j> mz:m+<cr>`z; vmap <C-S-j> :m'>+<cr>`<my`>mzgv`yo`z     " 向下移动一行
nmap <C-S-k> mz:m-2<cr>`z; vmap <C-S-k> :m'<-2<cr>`>my`<mzgv`yo`z   " 向上移动一行
""""""""""""""""""""""""""""LAYOUT""""""""""""""""""""""""""""
set showmode showcmd cmdheight=1                " 滚动时，保持光标上下至少有5行
set number nowrap scrolloff=5 sidescrolloff=15 
map <leader>th :tabprevious<cr>; map <leader>tl :tabnext<cr>; map <leader>tm :tabmove       " 移动标签
map <leader>tn :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/;                            " 新建标签
map <leader>tj :tabclose<cr>; map <leader>tk :tabonly<cr>;                                  " 关闭标签
set laststatus=2  statusline=\ \ %{mode()}\ \ %h%m%f\ \ %<%{getcwd()}\ \                    " 状态栏左边
set statusline+=%=%{&filetype}\ \ %{&enc}\ \ Column:%c\ \ Line:%l/%L\ \                     " 状态栏右边
""""""""""""""""""""""""""""END""""""""""""""""""""""""""""