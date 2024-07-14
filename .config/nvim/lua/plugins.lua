vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
	use { "wbthomason/packer.nvim", opt = true }
	-- Copilot and CopilotChat
	use 'github/copilot.vim'
	use 'nvim-lua/plenary.nvim'
	use {
	  'CopilotC-Nvim/CopilotChat.nvim',
	  branch = "canary"
	}
	-- nvim-cmp
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	-- Lsp
	use 'vim-denops/denops.vim'
	use 'neovim/nvim-lspconfig'
	-- Go
	use 'tpope/vim-fugitive'
	use 'mattn/vim-goimports'
	-- lualine
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use {
		'kdheepak/tabline.nvim',
		config = function()
			require'tabline'.setup {enable = false}
		end,
		requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
	}
	use 'nvim-tree/nvim-web-devicons'
	use 'archibate/lualine-time'

	-- Others
	use 'scrooloose/nerdtree'
	use 'tpope/vim-endwise'
	use 'bronson/vim-trailing-whitespace'
	use {
	  'neanias/everforest-nvim',
	  branch = 'main'
	}
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
	use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = ':call fzf#install()' }
 }
 use "sindrets/diffview.nvim"
end)
