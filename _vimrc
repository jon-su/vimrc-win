"
"
"
"
"
"



set nocompatible

syntax on

set nu

set smartindent

" Convert tabs to a group of 4 spaces.
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=999

set encoding=utf-8

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

" To save, ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" To add a new line, shift-enter
nmap <s-CR> o
imap <s-CR> <ESC>o


set incsearch
set ignorecase
set smartcase


" Status line
"set laststatus=2
"set statusline=
"set statusline+=%-3.3n\                      "buffer number
"set statusline+=%f\                          "filename
"set statusline+=%h%m%r%w                     "status flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}] "file type
"set statusline+=%=                           "right align remainder
"set statusline+=0x%-8B                       "character value
"set statusline+=%-14(%l,%c%V%)               "line, character
"set statusline+=%<%P                         "file position

" Show line number, cursor position
set ruler

" Display incomplete commands
set showcmd

" Search as you type
set incsearch

" 
set ignorecase

" Show autocomplete menus
set wildmenu

" Show editing mode
set showmode

" Error bells are displayed visually
set visualbell

" To insert timestamp, press F3
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" use <space> to fold/unfold
:nnoremap <space> za


" Shortcuts for moving between tabs.
" Alt-j to move to the tab to the lef
noremap <A-j> gT
" Alt-k to move to the tab to the right
noremap <A-k> gt

" noremap <s-CR> <ESC>o

" Theme color
" :colorscheme desert
" :colorscheme evening
if has("gui_running")
    colorscheme evening
else 
    colorscheme darkblue
endif

" Size of Gvim window
set lines=35 columns=99


" Don't display the menu or toolbar. Just the screen
set guioptions-=m
set guioptions-=T

" Font
if has('win32') || has('win64')
    "set guifont=Monaco:h28
    set guifont=Lucida\ Console:h10
    "set guifont=Consolas:h12:cANSI
elseif has('unix')
    let &guifont="Monospace 10"
endif


"autocmd FileType python runtime! autoload/pythoncomplete.vim
"imap <c-space> <c-x><c-o>


"
set backspace=indent,eol,start
set bs=2 


" Vundle
" set the runtime path to include Vundle and initialize
" TODO: use a relative path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}


" My own plugins
Plugin 'Valloric/YouCompleteMe'

Plugin 'https://github.com/Lokaltog/vim-powerline.git'

Bundle 'The-NERD-tree'
" End of my own plugins


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" End of Vundle


" Ycm config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/python/ycm/.ycm_extra_config.py'
" 补全功能在注释中同样有效  
let g:ycm_complete_in_comments=1  
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示  
let g:ycm_confirm_extra_conf=0  
" 开启 YCM 基于标签引擎  
let g:ycm_collect_identifiers_from_tags_files=1  
" 引入 C++ 标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径  
"set tags+=/data/misc/software/misc./vim/stdcpp.tags  
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键  
inoremap <leader>; <C-x><C-o>  
" 补全内容不以分割子窗口形式出现，只显示补全列表  
set completeopt-=preview  
" 从第一个键入字符就开始罗列匹配项  
let g:ycm_min_num_of_chars_for_completion=1  
" 禁止缓存匹配项，每次都重新生成匹配项  
let g:ycm_cache_omnifunc=0  
" 语法关键字补全              
let g:ycm_seed_identifiers_with_syntax=1  
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;  
let g:ycm_key_invoke_completion = '<M-;>'  
" 设置转到定义处的快捷键为ALT + G，这个功能非常赞  
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
" End of ycm


" To use :make in vim
set makeprg=mingw32-make

" ctrip.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

"vim-powerline
set laststatus=2
set t_Co=256
let g:Powerline_sysbols = 'unicode'


"NERDTree
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | cd D:\Codes NERDTree | endif
"to open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" CD
cd D:\Codes

" ctags
" look in the current directory for "tags", and work up the tree towards root until one is found
set tags=./tags;/


