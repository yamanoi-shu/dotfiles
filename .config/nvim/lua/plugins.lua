vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
	-- Copilot and CopilotChat
	use 'github/copilot.vim'
	use 'nvim-lua/plenary.nvim'
	use {
	  'CopilotC-Nvim/CopilotChat.nvim',
	  branch = "canary"
	}
	-- Lsp
	use 'vim-denops/denops.vim'
	use 'prabirshrestha/vim-lsp'
	use 'mattn/vim-lsp-settings'
	use 'Shougo/ddc.vim'
	use 'Shougo/ddc-ui-native'
	use 'Shougo/ddc-source-around'
	use 'matsui54/ddc-buffer'
	use 'shun/ddc-source-vim-lsp'
	use 'tani/ddc-fuzzy'
	-- Go
	use 'tpope/vim-fugitive'
	use 'mattn/vim-goimports'
	-- lualine
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use 'nvim-tree/nvim-web-devicons'
	-- Others
	use 'scrooloose/nerdtree'
	use 'tpope/vim-endwise'
	use 'bronson/vim-trailing-whitespace'
	use {
	  'neanias/everforest-nvim',
	  branch = 'main'
	}
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
