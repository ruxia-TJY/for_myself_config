#VIM


'''.vimrc
call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
call plug#end()

nmap <Leader>tb :TagbarToggle<CR>  " 将开启tagbar的快捷键设置为　<Leader>tb
let g:tagbar_ctags_bin='/usr/bin/ctags'  " 设置ctags所在路径
" let g:tagbar_width=30　" 设置tagbar的宽度
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py call tagbar#autoopen()　" 在某些情况下自动打开tagbar
" 高亮
syntax on

" 显示行号
set number

" 显示当前行行号，其他行显示相对行号
" set relativenumber

" 光标所在行高亮
set cursorline

" 行宽
set textwidth=80

" 自动折行
set wrap

" 折行处与编辑窗口右边缘空处字符数
set wrapmargin=2

" 垂直滚动光标距离顶部底部位置
set scrolloff=5


" 底部显示当前模式是命令模式还是插入模式
set showmode

" 命令模式在底部显示键入指令
set showcmd

" 支持鼠标
set mouse=a

" utf-8编码
set encoding=utf-8

" 256色
set t_Co=256

" 回车键下一行保持缩进
set autoindent

" TAB键显示空格数量
set tabstop=4

" 光标遇到括号，自动高亮对应括号
set showmatch
'''
