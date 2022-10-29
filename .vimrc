syntax on
syntax enable
set number
set cursorline
set smartindent
set showmatch
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set smartcase
set laststatus=2
set expandtab
set background=dark
set listchars=tab:-\ ,trail:_,eol:$
set clipboard+=unnamed

let macvim_skip_colorscheme=1

" colorscheme (everforest)
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
let g:everforest_disable_terminal_colors = 1
colorscheme everforest

autocmd FileType vue syntax sync fromstart
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
autocmd BufNewFile,BufRead *.c set tabstop=2
autocmd BufNewFile,BufRead *.c set shiftwidth=2
autocmd BufNewFile,BufRead *.js set tabstop=2
autocmd BufNewFile,BufRead *.js set shiftwidth=2
autocmd BufNewFile,BufRead *.jsx set tabstop=2
autocmd BufNewFile,BufRead *.jsx set shiftwidth=2

map <C-n> :NERDTreeToggle<CR>
map <C-t> :bo terminal ++rows=15<CR>

" Plugin SetUp
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'szw/vim-tags'
Plug 'cohama/lexima.vim'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'fatih/vim-go'
Plug 'Shougo/unite.vim'
Plug 'Quramy/tsuquyomi'
Plug 'Yggdroot/indentLine'
Plug 'udalov/kotlin-vim'
" ddc.vim本体
Plug 'Shougo/ddc.vim'
" DenoでVimプラグインを開発するためのプラグイン
Plug 'vim-denops/denops.vim'
" ポップアップウィンドウを表示するプラグイン
Plug 'Shougo/pum.vim'
" カーソル周辺の既出単語を補完するsource
Plug 'Shougo/ddc-around'
" ファイル名を補完するsource
Plug 'LumaKernel/ddc-file'
" 入力中の単語を補完の対象にするfilter
Plug 'Shougo/ddc-matcher_head'
" 補完候補を適切にソートするfilter
Plug 'Shougo/ddc-sorter_rank'
" 補完候補の重複を防ぐためのfilter
Plug 'Shougo/ddc-converter_remove_overlap'

Plug 'jacoborus/tender.vim'

Plug 'itchyny/lightline.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'bronson/vim-trailing-whitespace'
Plug 'sainnhe/everforest'
Plug 'tpope/vim-rails'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'ruby-formatter/rufo-vim'

call plug#end()

autocmd FileType vue syntax sync fromstart
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

" remove white space
autocmd BufWritePost * FixWhitespace

"indentLine"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors=0
set list listchars=tab:\¦\
"go"
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

let g:lightline = {
    \ 'colorscheme': 'everforest',
    \ 'active': {
    \    'left': [ [ 'mode', 'paste' ], ['gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
    \ },
    \ 'component_function': {
    \ 'gitbranch': 'FugitiveHead'
    \ },
    \ }

let g:lsp_diagnostics_echo_cursor = 1
let lsp_signature_help_enabled = 0

" ddc
call plug#('Shougo/ddc.vim')
call plug#('vim-denops/denops.vim')
call plug#('Shougo/pum.vim')
call plug#('Shougo/ddc-around')
call plug#('LumaKernel/ddc-file')
call plug#('Shougo/ddc-matcher_head')
call plug#('Shougo/ddc-sorter_rank')
call plug#('Shougo/ddc-converter_remove_overlap')
call plug#('prabirshrestha/vim-lsp')
call plug#('mattn/vim-lsp-settings')

call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'vim-lsp',
 \ 'file'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'around': {'mark': 'Around'},
 \ 'vim-lsp': {
 \   'mark': 'LSP',
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.|:|->|"\w+/*'
 \ },
 \ 'file': {
 \   'mark': 'F',
 \   'isVolatile': v:true,
 \   'forceCompletionPattern': '\S/\S*'
 \ }})
call ddc#custom#patch_filetype(
    \ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
    \ 'sourceOptions': {
    \   'file': {
    \     'forceCompletionPattern': '\S\\\S*',
    \   },
    \ },
    \ 'sourceParams': {
    \   'file': {
    \     'mode': 'win32',
    \   },
    \ }})
call ddc#enable()
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
" Mappings"

" Ruby
let g:rufo_auto_formatting = 1


" :vim {pattern} {file} | cw
:command -nargs=1 Vim vim <args> **/* | cw

autocmd QuickFixCmdPost *grep* cwindow

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>


" Python formatter
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    "--ignote=E501: Ignore completing the length of a line."
    call Preserve(':silent %!autopep8 --ignore=E501 -')
endfunction

augroup python_auto_lint
  autocmd!
  autocmd BufWrite *.py :call Autopep8()
augroup END
