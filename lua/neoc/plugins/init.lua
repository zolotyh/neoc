return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- File manager
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = "require('neoc.plugins.nvim-tree')"}

    -- Works with files
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}, config = "require('neoc.plugins.nvim-telescope')"}

    -- Theme
    use {'folke/tokyonight.nvim', config = "vim.cmd[[colorscheme tokyonight]]"}

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = "require('neoc.plugins.nvim-treesitter')"}

    -- Language server
    use {'neovim/nvim-lspconfig', config = "require('neoc.plugins.nvim-lspconfig')"}

end)
