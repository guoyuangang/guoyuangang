let mapleader = "\<space>"
""""""""""""""""""""""""""""FILE""""""""""""""""""""""""""""
set nobackup noswapfile nowb
set encoding=utf8 ffs=unix,dos,mac t_Co=256
set autoread                                    " 自动加载外部修改（该文件未被修改的情况下）
au FocusGained,BufEnter * silent! checktime     " 提示文件已经被修改
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif        " 打开时将光标移动到上次修改的地方
map <leader>cd :cd %:p:h<cr>:pwd<cr>            " 查看当前文件路径
nmap <leader>w :w!<cr>
nmap <leader>q :qa!<cr>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!  " :W sudo saves the file
""""""""""""""""""""""""""""EDIT""""""""""""""""""""""""""""
filetype plugin on                              " 文件类型检测插件
filetype indent on                              " 文件类型自动缩进
set expandtab smarttab shiftwidth=4 tabstop=4   " 智能缩进
set backspace=eol,start,indent  ai si           " 允许删除换行和缩进
set showmatch mat=2 mouse=a                     " 高亮成对的符号
set hlsearch incsearch ignorecase smartcase     " 搜索时，忽略大小写、高亮匹配项
map <leader><cr> :noh<cr>                       " 取消搜索高亮
map <F7> :setlocal spell!<cr>                   " 拼写检查开关
nmap <C-S-j> mz:m+<cr>`z; vmap <C-S-j> :m'>+<cr>`<my`>mzgv`yo`z     " 向下移动一行
nmap <C-S-k> mz:m-2<cr>`z; vmap <C-S-k> :m'<-2<cr>`>my`<mzgv`yo`z   " 向上移动一行
""""""""""""""""""""""""""""LAYOUT""""""""""""""""""""""""""""
syntax enable                                   " 语法高亮开关
set showmode showcmd cmdheight=1                " 滚动时，保持光标上下至少有5行
set number nowrap scrolloff=5 sidescrolloff=15 
map <leader>th :tabprevious<cr>; map <leader>tl :tabnext<cr>; map <leader>tm :tabmove                                           " Tab标签移动
map <leader>tn :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/; map <leader>tj :tabclose<cr>; map <leader>tk :tabonly<cr>;     " Tab标签编辑
map <leader>wh <C-W>h; map <leader>wj <C-W>j; map <leader>wk <C-W>k; map <leader>wl <C-W>l                                      " 窗口移动
set laststatus=2 statusline=\ \ %{mode()}\ \ %m%f\ \ %{getcwd()}\ \ %=\ \ %{&enc}\ \ Column:%c\ \ Line:%l/%L\ \                 " 状态栏格式
""""""""""""""""""""""""""""OTHER""""""""""""""""""""""""""""
" 可视模式下，*、#搜索选中字符串
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

" Specify the behavior when switching between buffers
set switchbuf=newtab stal=2

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
