vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'sbdchd/neoformat'
  use 'ThePrimeagen/vim-be-good'
  use 'dcampos/nvim-snippy'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'lewis6991/gitsigns.nvim', 
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use { 
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    'ptzz/lf.vim',
    requires = { 'voldikss/vim-floaterm' }
  }
  use {
    "nvim-neorg/neorg",
    -- tag = "latest",
    requires = "nvim-lua/plenary.nvim"
  }
end)
