""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Vim原始配置

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="," "leader key

set bg=dark

set clipboard=unnamed "use universal clipboard, both vim and system clipboard

set wildmenu          "cmd line completion

set path+=**          "path include sub-directories, this is useful for :find command

set nocompatible      "设置vim不兼容vi的键盘模式

set backspace=2       "等同于set backspace=indent,eol,start
                      "设置backspace或者del键的工作模式，默认是vi兼容的
                      "默认只能删除本次插入的文本，不是本次插入的文本是无法删除的
                      "我们需要将其设置为2或者indent,eol,start，这两个是等效的
                      "indent，指删除各种缩进和自动缩进的字段
                      "eol，指end of line，可以通过这样来合并两行
                      "start，指删除此次插入之前的输入

"set list              "显示tab等特殊字符
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬ "定义特殊字符的显示形式

set expandtab         "Tab键转换为空格

set tabstop=2         "设置制表符等于2空格

set autoindent        "设置自动缩进，当你新开一行的时候将会使用当上一行的缩进
                      "CR，o，O都适用
                      "CR 指回车
                      "o  指向下插入一行
                      "O  指向上插入一行

set shortmess=atI     "打开vim时不显示其版本等信息

set shiftwidth=2      "缩进的大小，以空格为衡量，需要和tabstop一致

set cmdheight=1       "设置命令行高度为2

set autochdir         "自动切换当前目录为编辑文件所在的目录
                      "如果你要用多标签页，那么就得注意这个目录问题
                      "比如你现在编辑的文件的目录是~/github/xxxx，而你想编辑~/.vimrc
                      "就得指定位置，比如tabe ~/.vimrc
                      "那么直接tabe .vimrc即可

set noignorecase      "不区分大小写

set hlsearch          "设置搜索结果高亮，这可能在你搜索了以后一直高亮
                      "解决办法就是搜索以后不存在的字符串
                      "这样没有了匹配，前一次的高亮也就消失了

set incsearch         "即时查找,你按一个键就触发查找，
                      "而不像之前要输完所有字符再按enter键才会开始查找

syntax enable         "启用语法检查

syntax on             "开启语法高亮 filetype plugin indent on

filetype plugin on    "加载vim自带插件相应的语法和文件类型相关脚本

set smartindent      "自动缩进

set nu                "显示行号    

set relativenumber    "显式相对行号，便于计算上下跳的行数

set autoread         "自动读取改动

set autowrite        "自动保存，指当前文件失去焦点时会触发自动保存
                      "一般而言，你是不会忘记在关闭文件之前使用:w的
                      "而且vim也会提示你

"set showmatch        "打一半边括号时，自动补全另一半括号
                      "如果你安装了auto-pair之类的插件，大可注释掉此行

"set cursorline        "高亮光标所在行
                      "即视感就是你光标所在行出现一条横线
                      "cursorline和cursorcolumn
                      "遇到文中有中文英文的时候往往对不齐
                      "可以考虑对其进行关闭
                      "这两者都和配色有关

"set cursorcolumn     "高亮光标所在列
                      "即视感就是你光标所在的那一列会出现一根竖线来提示你
                      "但是，如果你的光标在第一列
                      "有可能导致你看不清第一列的字符，这个和你配色有关

"set background=light "设置背景为亮色,这里可以先不设置,可以暂时保持和terminal的色调相同

"set ruler            "显示当前光标所在的行与列的信息
                      "具体位置在vim窗口右下角，类似4,4，20%
                      "意思分别为，当前光标在第几行，第几列，光标在全文的百分之几十。
                      "不过现在这个经常被airline之类的插件给替代了
                      "如果你的插件里面有airline之类的显示状态的插件，就没必要设置ruler


"set mouse=a          "使用鼠标点击来定位，即鼠标点哪里，光标就去哪里。

set fileencodings=ucs-bom,utf-8,gb2312      "vim打开文件的时候，需要识别文件的编码，用的就是这里指定的编码
                                            "vim会根据这里所列出的编码来尝试对文件进行打开

set fileencoding=utf-8                      "本文件进行保存操作的时候将本文件设置为此选项对于的编码

set encoding=utf-8                          "vim内部使用的编码，显示消息什么的就会用这个编码

set termencoding=utf-8                      "告诉vim你目前使用的terminal是什么编码

highlight VertSplit ctermfg=NONE ctermbg=NONE cterm=NONE "这里清除NERDTree和文本区两边的围绕白块
highlight SignColumn ctermbg=NONE "清除SignColumn的背景色，:h sings

highlight Pmenu ctermbg=241 ctermfg=170 cterm=bold "PopMenu前景色和背景色
highlight PmenuSel ctermbg=243 ctermfg=171 cterm=bold
" for more highlight selections
"Pmenu – normal item
"PmenuSel – selected item
"PmenuSbar – scrollbar
"PmenuThumb – thumb of the scrollbar

""""""""""""""""""" panel traverse start
" use traditional h j k l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" 同时显示行和列标记，用于定位当前光标
command! Blink exec ':set cursorline! cursorcolumn!'

" 重新加载当前配置文件
command! Reload exec 'source' $MYVIMRC

" 显示不可见字符
command! List exec ':set list!'

" 新建tab
nmap <C-t> :tabe<CR>
imap <C-t> <Esc>:tabe<CR>

"tab切换
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt

" 禁用arrow-keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" jumplist, 解决coc占用<C-i>问题
nnoremap <C-p> <C-i>

" 缩进对齐
vnoremap < <gv
vnoremap > >gv
