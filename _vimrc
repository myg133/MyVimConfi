"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设定默认解码
"""""""""""""""""""""""""""""
"解决windows下的中文乱码问题
"""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"解决中文菜单乱码
set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决console输出乱码
language messages zh_cn.utf-8
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" history文件中需要记录的行数
set history=100
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 与windows共享剪贴板
set clipboard+=unnamed
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 语法高亮
syntax on
" 高亮字符，让其不受100列限制
:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
:match OverLength '\%101v.*'
" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White
"设置表尺
set ruler
"字体设置
set guifont=Courier_New:h14:cANSI
"配色方案
colorscheme desert
"打开全屏
"magic设置
set magic
"配置文件自动重载
set autoread
"突显当前选中行
set cursorline
"显示输入的命令
set showcmd
"Ctags 设置
set tags=tags;
set autochdir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不要备份文件（根据自己需要取舍）
set nobackup
" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 不让vim发出讨厌的滴滴声
set noerrorbells
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5
" 在搜索的时候忽略大小写
set ignorecase
" 不要高亮被搜索的句子（phrases）
set nohlsearch
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch
" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=4
" 不要闪烁
set novisualbell
" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime("%d/%m/%y\-\ %H:%M")}
" 总是显示状态行
set laststatus=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动格式化
set formatoptions=tcrqn
" 继承前一行的缩进方式，特别适用于多行注释
set autoindent
" 为C程序提供自动缩进
set smartindent
" 使用C样式的缩进
set cindent
" 用空格代替制表符
set expandtab
" 制表符为2
set tabstop=2
" 统一缩进为2
set softtabstop=2
set shiftwidth=2
" 不要换行
set wrap
" 在行和段开始处使用制表符
set smarttab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按照名称排序
let Tlist_Sort_Type = "name"
" 在右侧显示窗口
let Tlist_Use_Right_Window = 1
" 压缩方式
let Tlist_Compart_Format = 1
" 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_Exist_OnlyWindow = 1
" 不要关闭其他文件的tags
let Tlist_File_Fold_Auto_Close = 1
" 不要显示折叠树
let Tlist_Enable_Fold_Column = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
if has("autocmd")
  autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
  autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
  autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o
  autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
  autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim
"  autocmd BufReadPost *
"    \ if line("'"") > 0 && line("'"") <= line("$") |
"    \ exe " normal g`"" |
"    \ endif
endif "has("autocmd")
"允许插件
filetype plugin on
"NERDtee设定
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\vimfiles\data\NerdBookmarks'
let NERDTreeMouseMode=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=0
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
let NERDTreeDirArrows=0 "1显示箭头 0显示+-号
let NERDTreeQuitOnOpen=0 "打开文件时关闭树
inoremap <silent><F7> :NERDTreeToggle<CR>
nnoremap <silent><F7> :NERDTreeToggle<CR>
imap <silent><F7> <ESC>:NERDTreeToggle<CR> <C-w><C-w>
"TagList 设置
"let Tlist_Ctags_Cmd=$VIM.'\vimfiles\tools\ctags.exe'
let Tlist_Show_One_File=1
let Tlist_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Sort_Type='name'
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=1
let Tlist_Max_Submenu_Items=10
let Tlist_Max_Tag_length=20
let Tlist_Use_SingleClick=0
let Tlist_Auto_Open=1
let Tlist_Close_On_Select=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Process_File_Always=1
let Tlist_WinHeight=10
let Tlist_WinWidth=18
let Tlist_Use_Horiz_Window=0
map <silent> <F8> :TlistToggle<CR>
"miniBufferExplorer setting
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplorerMoreThanOne=0
"cscope key maps
"source $VIM/vimfiles/plugin/cscope_maps.vim
"Python debug
map <silent><F5> :!python -mpdb % <CR>
map <C-F5> :!python % <CR>
"source $VIM/vimfiles/plugin/doctitle.vim  
"AutoCompleteDot
set completeopt=menu,menuone  
let OmniCpp_MayCompleteDot=1    "打开  . 操作符
let OmniCpp_MayCompleteArrow=1  "打开 -> 操作符
let OmniCpp_MayCompleteScope=1  "打开 :: 操作符
let OmniCpp_NamespaceSearch=1   "打开命名空间
let OmniCpp_GlobalScopeSearch=1  
let OmniCpp_DefaultNamespace=["std"]  
let OmniCpp_ShowPrototypeInAbbr=1  "打开显示函数原型
let OmniCpp_SelectFirstItem = 2 "自动弹出时自动跳至第一个
" powerline
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set encoding=utf-8
set laststatus=2
set t_Co=256   
let g:Powerline_symbols= "fancy"
