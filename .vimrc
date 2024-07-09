let mapleader = "\<space>"
" 文件
filetype plugin on  " Enable filetype plugins
filetype indent on  " Enable filetype plugins
au FocusGained,BufEnter * silent! checktime     " 提示文件已经被修改
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif        " 打开时将光标移动到上次修改的地方
set autoread                                    " 自动加载外部修改（该文件未被修改的情况下）
set encoding=utf8 ffs=unix,dos,mac 
set nobackup nowb noswapfile
map <leader>cd :cd %:p:h<cr>:pwd<cr>            " 查看当前文件路径
nmap <leader>w :w!<cr>
nmap <leader>q :qa!<cr>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!  " :W sudo saves the file
" 编辑
set wildignore=*/.git/*,*.o,*~,*.pyc
set backspace=eol,start,indent                  " 允许删除换行和缩进
set expandtab smarttab shiftwidth=4 tabstop=4 ai si     " 智能缩进
nmap <C-S-j> mz:m+<cr>`z; vmap <C-S-j> :m'>+<cr>`<my`>mzgv`yo`z                     " 向下移动一行
nmap <C-S-k> mz:m-2<cr>`z; vmap <C-S-k> :m'<-2<cr>`>my`<mzgv`yo`z                   " 向上移动一行
map <F7> :setlocal spell!<cr>               " 拼写检查开关
" 选择
set hlsearch incsearch ignorecase smartcase     " 搜索时，忽略大小写、高亮匹配项
map <leader><cr> :noh<cr>                       " 取消搜索高亮
set showmatch mat=2                             " 高亮成对的符号
" 外观
syntax enable                                   " 语法高亮开关
set ruler number nowrap cmdheight=1 scrolloff=5 " 滚动时，保持光标上下至少有5行
set noerrorbells novisualbell t_vb=             " 启用可视响铃功能
map <leader>wh <C-W>h; map <leader>wj <C-W>j; map <leader>wk <C-W>k; map <leader>wl <C-W>l                  " 窗口移动
map <leader>th :tabprevious<cr>; map <leader>tl :tabnext<cr>;map <leader>tn : map <leader>tm :tabmove       " Tab标签移动
tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/; map <leader>tk :tabonly<cr>; map <leader>tj :tabclose<cr>; " Tab标签编辑
set laststatus=2 statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c      " 状态栏格式
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
" 其它
set hid " A buffer becomes hidden when it is abandoned
set whichwrap+=<,>,h,l
set regexpengine=0
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
