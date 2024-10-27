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
vim.scriptencoding="UTF-8"

-- enable clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.foldmethod=manual


-- colorscheme everforest settings
-- require("everforest").setup({
--   background = "medium",
--   transparent_background_level = 0,
--   italics = false,
-- })
-- require("everforest").load()


-- vim.cmd[[colorscheme tender]]

-- vim.cmd[[colorscheme gotham]]

-- vim.g['quantum_black']=1
-- vim.cmd[[colorscheme quantum]]

-- vim.g['sonokai_style']='andromeda'
-- vim.cmd[[colorscheme sonokai]]

-- vim.cmd[[colorscheme materialtheme]]

-- vim.cmd[[colorscheme tokyonight]]

vim.cmd[[colorscheme nordfox]]

vim.opt.showtabline = 0

local my_filename = require('lualine.components.filename'):extend()
my_filename.apply_icon = require('lualine.components.filetype').apply_icon

-- lualine settings
require('lualine').setup {
	theme = 'nordfox',
	sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
	tabline = {
		lualine_a = {{
			my_filename,
			path = 1,
		}},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			'cdate',
			'ctime',
		},
		lualine_z = {},
	},
}

-- copilot settings
require("CopilotChat").setup {
  debug = true
}

-- lsp settings
local on_attatch = function (client, bufnr)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-[>', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-L>', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-K>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-H>', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-J>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true, silent = true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-J>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true, silent = true})
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<ESC>', '<ESC>', {noremap = true, silent = true})
end
vim.api.nvim_set_keymap('n', '<C-T>', '<C-O>', { noremap = true, silent = true })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true }
)
local lspconfig = require("lspconfig")

-- hover settings
local double = {
      {"╔", "FloatBorder"},  -- upper left
      {"═", "FloatBorder"},  -- upper
      {"╗", "FloatBorder"},  -- upper right
      {"║", "FloatBorder"},  -- right
      {"╝", "FloatBorder"},  -- lower right
      {"═", "FloatBorder"},  -- lower
      {"╚", "FloatBorder"},  -- lower left
      {"║", "FloatBorder"},  -- left
}
vim.cmd [[
" autocmd ColorScheme * highlight NormalFloat guifg=gray guibg=#073642
" autocmd ColorScheme * highlight FloatBorder guifg=gray guibg=#073642
autocmd ColorScheme * highlight! link Pmenu FloatBorder
autocmd ColorScheme * highlight! link Pmenu NormalFloat
]]
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = double, -- "single", "shadow", "none", "rounded"
    width = 100,
  }
)
-- Go
lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attatch,
  settings = {
    ["gopls"] = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})
-- Rust
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attatch,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})

-- Terraform
lspconfig.tflint.setup{}
lspconfig.terraform_lsp.setup{}

-- typescript
require'lspconfig'.tsserver.setup{}


-- auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = buffer,
		callback = function()
				vim.lsp.buf.format { async = false }
		end
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true }
)

vim.keymap.set('','<C-n>', ':NERDTreeToggle<CR>')



-- nvim-cmp settings
local cmp = require('cmp')
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
	window = {
		 completion = cmp.config.window.bordered(),
		 documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<S-Tab>"] = cmp.mapping.select_prev_item(), --Ctrl+pで補完欄を一つ上に移動
    ["<Tab>"] = cmp.mapping.select_next_item(), --Ctrl+nで補完欄を一つ下に移動
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
	}, {
		{ name = 'buffer' },
	})
})

-- js, ts, jsx
-- prettier settings(formatter)
local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
-- treesitter settings(syntax highlighting)
require('nvim-treesitter.configs').setup {
  highlight = {
    enabled = true,
  },
	ensure_installed = {
    "tsx",
		"jsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
    "lua",
		"markdown",
		"go"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
-- autotag settings
require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})

-- git.nvim settings
require('git').setup({
  default_mappings = true, -- NOTE: `quit_blame` and `blame_commit` are still merged to the keymaps even if `default_mappings = false`

  keymaps = {
    -- Open blame window
    blame = "<CR>x",
    -- Close blame window
    quit_blame = "q",
    -- Open blame commit
    blame_commit = "<CR>",
    -- Quit blame commit
    quit_blame_commit = "q",
    -- Open file/folder in git repository
    browse = "<Leader>go",
    -- Open pull request of the current branch
    open_pull_request = "<Leader>gp",
    -- Create a pull request with the target branch is set in the `target_branch` option
    create_pull_request = "<Leader>gn",
    -- Opens a new diff that compares against the current index
    diff = "<Leader>gd",
    -- Close git diff
    diff_close = "<Leader>gD",
    -- Revert to the specific commit
    revert = "<Leader>gr",
    -- Revert the current file to the specific commit
    revert_file = "<Leader>gR",
  },
  -- Default target branch when create a pull request
  target_branch = "master",
  -- Private gitlab hosts, if you use a private gitlab, put your private gitlab host here
  private_gitlabs = { "https://xxx.git.com" },
  -- Enable winbar in all windows created by this plugin
  winbar = false,
})

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
vim.cmd('autocmd BufNewFile,BufRead *.js set expandtab')
vim.cmd('autocmd BufNewFile,BufRead *.js set tabstop=2')
vim.cmd('autocmd BufNewFile,BufRead *.js set shiftwidth=2')
vim.cmd('autocmd BufNewFile,BufRead *.jsx set tabstop=2')
vim.cmd('autocmd BufNewFile,BufRead *.jsx set shiftwidth=2')
vim.cmd('autocmd BufNewFile,BufRead *.proto set tabstop=2')
vim.cmd('autocmd BufNewFile,BufRead *.proto set shiftwidth=2')
vim.cmd('autocmd BufNewFile,BufRead *.lua set tabstop=2')
vim.cmd('autocmd BufNewFile,BufRead *.lua set shiftwidth=2')
vim.cmd('autocmd BufNewFile,BufRead *.go set tabstop=4')
vim.cmd('autocmd BufNewFile,BufRead *.go set shiftwidth=4')


-- vim.cmd('autocmd BufWritePre * FixWhitespace')
vim.cmd('autocmd QuickFixCmdPost *grep* cwindow')

vim.api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<left>", { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<left>', { noremap = true })
vim.api.nvim_set_keymap('i', '`', '``<left>', { noremap = true })

