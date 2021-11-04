syntax on
set number
set cursorline
set virtualedit=onemore
set smartindent
set showmatch
syntax enable
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set smartcase
set laststatus=2
set expandtab
syntax enable
set background=dark
colorscheme solarized

autocmd FileType vue syntax sync fromstart
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
map <C-n> :NERDTreeToggle<CR>
map <C-t> :bo terminal ++rows=15<CR>

" Plugin SetUp
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'zxqfl/tabnine-vim'
Plug 'szw/vim-tags'
Plug 'cohama/lexima.vim'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'fatih/vim-go'
Plug 'Shougo/unite.vim'
Plug 'Quramy/tsuquyomi'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

autocmd FileType vue syntax sync fromstart
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

"indentLine"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors=0
let g:go_fmt_command = "goimports"
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#111111 ctermbg=18
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222222 ctermbg=19



imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
