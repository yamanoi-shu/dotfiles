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

autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" Plugin SetUp
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'zxqfl/tabnine-vim'
call plug#end()

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=darkblue
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=magenta
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
