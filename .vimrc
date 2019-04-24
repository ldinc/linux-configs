set nocompatible              " be iMproved, required
" backspase doesn't work correctly on some distros (like my ubuntu vps ...)
" set backspace=indent,eol,start
filetype off                  " required

set maxmempattern=20000 " more mem for syntax highlight

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
if has('nvim')
	call vundle#begin('~/.vim/neobundle/')
else
	call vundle#begin()
endif

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
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

if has('nvim')
	Plugin 'Shougo/deoplete.nvim'
else
	Plugin 'Shougo/neocomplete.vim'
endif

Bundle 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'reedes/vim-colors-pencil'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'airblade/vim-gitgutter'
"Bundle 'jonathanfilip/lucius'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'ldinc/vim-ld-theme'
Plugin 'peterhoeg/vim-qml'
Plugin 'nathanaelkane/vim-indent-guides'
" Latex/tex
Plugin 'lervag/vimtex'
" Golang
Plugin 'fatih/vim-go'
" Rust
Plugin 'rust-lang/rust.vim'
" Toml
Plugin 'cespare/vim-toml'
" Javascript
Plugin 'pangloss/vim-javascript'

" async linter
Plugin 'w0rp/ale'

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

let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }

let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0
let g:go_info_mode = "gocode"
let g:go_def_mode = "gopls"
let g:go_echo_command_info = 1
let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']

let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_gocode_propose_source = 1

let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = []

nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>


" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


augroup go
  autocmd!

  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)

  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)

  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  " I like these more!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END


"let g:go_highlight_types = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_interfaces = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"let g:go_fmt_command = "goimports"
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']

"au FileType go nmap <Leader>e <Plug>(go-rename)
"au FileType go nmap <Leader>i <Plug>(go-info)

" ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
map <leader>at :ALEToggle<CR>
map <leader>al :ALELint<CR>

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

" Complete settings
if has('nvim')
	let g:deoplete#enable_at_startup = 1
else
	let g:neocomplete#enable_at_startup = 1
endif

" Tagbar settings
nmap <F8> :TagbarToggle<CR>

" auto strip whitespaces
autocmd BufEnter * EnableStripWhitespaceOnSave
