-----------------------------------------------------------plugins.l
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

local use = require("packer").use
require("packer").startup(function()
	use("wbthomason/packer.nvim") -- Package manager
	use({ -- file tree explorer
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		}, -- optional, for file icon
	})
	use("tpope/vim-fugitive") -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	use("tpope/vim-commentary") -- "gc" to comment visual regions/lines
	-- UI to select things files, grep results, open buffers...)
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use("nvim-treesitter/nvim-treesitter")
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("jose-elias-alvarez/null-ls.nvim") -- diagnostics & formatting plugin
	use("lukas-reineke/indent-blankline.nvim") -- indentation guides
	use("numToStr/Comment.nvim") -- Comment functionality
	use("kyazdani42/nvim-web-devicons") -- devicons
	use({ -- statusline
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("axvr/zepl.vim") -- REPL support
	-- rose-pine
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			-- Options (see available options below)
			vim.g.rose_pine_variant = "base"
		end,
	})
	-- nord
	use("shaunsingh/nord.nvim")
end)
