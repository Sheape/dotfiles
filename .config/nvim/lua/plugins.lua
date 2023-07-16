vim.cmd([[packadd packer.nvim]])

-- Note: Optimize LSP for certain filetypes
return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Change this later to L3MON4D3/LuaSnip
	use("dcampos/nvim-snippy")

	---* LSP Stuff *---
	use("folke/neodev.nvim")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("mfussenegger/nvim-dap")
	use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
	use({
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	})
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvimdev/lspsaga.nvim")
	use({ "j-hui/fidget.nvim", tag = "legacy" })

	---* UI Stuff *---
	use("nvim-tree/nvim-web-devicons")
	use("windwp/nvim-autopairs")
	use("lukas-reineke/indent-blankline.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("nvim-lualine/lualine.nvim")
	use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		-- before = "neorg"
	})
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("nvim-telescope/telescope.nvim")
	use("mbbill/undotree")
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
			"antoinemadec/FixCursorHold.nvim",
		},
	})

	-- Utilities
	use({ "nvim-neorg/neorg", requires = "nvim-lua/plenary.nvim" })
	use("echasnovski/mini.align")
	use("kylechui/nvim-surround")
	use({
		"Wansmer/treesj",
		requires = { "nvim-treesitter" },
	})

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	-- use({ "dcampos/cmp-snippy", requires = { "hrsh7th/nvim-cmp" } })
	use({
		"L3MON4D3/LuaSnip",
		requires = { "rafamadriz/friendly-snippets" },
		run = "make install_jsregexp",
	})
	use("saadparwaiz1/cmp_luasnip")
	use({ "numToStr/Comment.nvim" })

	use({ "hrsh7th/cmp-nvim-lsp", requires = { "hrsh7th/nvim-cmp" } })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help", requires = { "hrsh7th/nvim-cmp" } })
	use({ "hrsh7th/cmp-path", requires = { "hrsh7th/nvim-cmp" } })

	-- Github (Configure this in the future)
	-- use({ "pwntester/octo.nvim" })
	-- use({ "stevearc/overseer.nvim" })
end)
