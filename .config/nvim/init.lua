local vim = vim
local Plug = vim.fn['plug#']
local opt = vim.opt

require "plugins"


vim.o.termguicolors = true

opt.number = true
opt.cursorline = true
opt.smartindent = true
opt.showmatch = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.showmatch = true
opt.smartcase = true
opt.mouse=a
vim.wo.list = true
vim.wo.listchars = 'tab:¦ '
vim.o.background = dark

-- enable clipboard
vim.opt.clipboard = "unnamedplus"


-- colorscheme everforest settings
require("everforest").setup({
  background = "medium",
  transparent_background_level = 0,
  italics = false,
})
require("everforest").load()

-- lualine settings
require('lualine').setup {
	theme = 'everforest'
}

-- copilot settings
require("CopilotChat").setup {
  debug = true
}

-- ddc settings
vim.fn["ddc#custom#patch_global"]({
	ui = 'native',
	sources = {
		'vim-lsp',
		'around',
		'buffer',
	},
	sourceOptions = {
		_ = {
			matchers = {'matcher_fuzzy'},
			sorters = {'sorter_rank'},
			converters = {'converter_fuzzy'},
			ignoreCase = 'v:true',
		},
		around = {
			mark = '[Around]',
		},
		buffer = {
			mark = '[Buffer]',
		},
		['vim-lsp'] = {
			mark = '[LSP]',
		},
	},
	sourcesParams = {
		around = {
			maxSize = 500,
		},
		buffer = {
			limitBytes = 5000000,
			forceCollect = 'v:true',
			fromAltBuf = 'v:true',
		},
	},
})
vim.fn["ddc#enable"]()

vim.keymap.set('','<C-n>', ':NERDTreeToggle<CR>')


-- vim-go syntax highlighting
vim.g['go_highlight_array_whitespace_error']=1
vim.g['go_highlight_chan_whitespace_error']=1
vim.g['go_highlight_extra_types']=1
vim.g['go_highlight_space_tab_error']=1
vim.g['go_highlight_trailing_whitespace_error']=1
vim.g['go_highlight_operators']=1
vim.g['go_highlight_functions']=1
vim.g['go_highlight_function_arguments']=1
vim.g['go_highlight_function_calls']=1
vim.g['go_highlight_fields']=1
vim.g['go_highlight_types']=1
vim.g['go_highlight_build_constraints']=1
vim.g['go_highlight_generate_tags']=1
vim.g['go_highlight_variable_assignments']=1
vim.g['go_highlight_variable_declarations']=1

-- goimports
vim.g['goimports'] = 1
vim.g['goimports_local'] = 'github.com/ca-love'

vim.cmd('autocmd FileType vue syntax sync fromstart')
vim.cmd('autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html')
vim.cmd('autocmd BufNewFile,BufRead *.c set tabstop=2')
vim.cmd('autocmd BufNewFile,BufRead *.c set shiftwidth=2')
vim.cmd('autocmd BufNewFile,BufRead *.js set tabstop=2')
vim.cmd('autocmd BufNewFile,BufRead *.js set shiftwidth=2')
vim.cmd('autocmd BufNewFile,BufRead *.jsx set tabstop=2')
vim.cmd('autocmd BufNewFile,BufRead *.jsx set shiftwidth=2')
vim.cmd('autocmd BufNewFile,BufRead *.proto set tabstop=2')
vim.cmd('autocmd BufNewFile,BufRead *.proto set shiftwidth=2')


vim.cmd("autocmd! BufWritePre *.go call execute('LspDocumentFormatSync')")
vim.cmd('autocmd BufWritePre * FixWhitespace')
vim.cmd('autocmd QuickFixCmdPost *grep* cwindow')

vim.api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<left>", { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '`', '``<left>', { noremap = true })

vim.api.nvim_set_keymap('', '<c-]>', ':LspDefinition<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-[>', ':LspImplementation<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-L>', ':LspNextError<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-K>', 'LspPreviousError<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-T>', '<C-O>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-H>', ':LspHover<CR>', { noremap = true, silent = true })

