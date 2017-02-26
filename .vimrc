set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Bundle 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Bundle 'bling/vim-airline'
"Bundle 'reedes/vim-colors-pencil'
Bundle 'ntpeters/vim-better-whitespace'
"Bundle 'jonathanfilip/lucius'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'ldinc/vim-ld-theme'
Plugin 'peterhoeg/vim-qml'
Plugin 'Shougo/neocomplete.vim'
Plugin 'nathanaelkane/vim-indent-guides'
" Latex/tex
Plugin 'lervag/vimtex'
" Golang
Plugin 'fatih/vim-go'
" Rust
Plugin 'rust-lang/rust.vim'
" Toml
Plugin 'cespare/vim-toml'

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
set number
colorscheme ld
"colorscheme pencil
"set background=light
set laststatus=2

" airline settings
set linespace=0
let g:airline_theme = 'pencil'
let g:Powerline_symbols = 'fancy'
"let g:airline_right_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_left_alt_sep= ''
"let g:airline_left_sep = '▶'
let g:airline_powerline_fonts = 1

set cc=80
" set limit 80 for text
":au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
set t_Co=256
" fix Konsole bold type font
set t_ZH=[3m
set t_ZR=[23m
set smartindent
set hls
set is
" Ru map keys
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
"set tabstop=4
set tabstop=2
set shiftwidth=2
"set expandtab

" golang settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>i <Plug>(go-info)

" NERD TREE
autocmd StdinReadPre * let s:std_in=1
"autostart
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
"map <C-n> :NERDTreeToggle<CR>
"let g:NERDTreeWinSize = 40
"au VimEnter *  NERDTree

" Set leader mapping
"let mapleader=","

" indent plugin settings
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=251
hi IndentGuidesEven ctermbg=254
" ===========================

" Neocomplete settings
let g:neocomplete#enable_at_startup = 1
