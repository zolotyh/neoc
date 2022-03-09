return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- File manager
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = "require('neoc.plugins.nvim-tree')"}

    -- Works with files
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}, config = "require('neoc.plugins.nvim-telescope')"}

    -- Theme
    use {'folke/tokyonight.nvim', config = "vim.cmd[[colorscheme tokyonight]]"} -- turn on theme

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = "require('neoc.plugins.nvim-treesitter')"}

    -- Language server
    -- use {'neovim/nvim-lspconfig', config = "require('neoc.plugins.nvim-lspconfig')"} -- List of language server
    --
    use {'hrsh7th/nvim-cmp', config = "require('neoc.plugins.nvim-cmp')"} -- Autocompletion plugin
    use {'hrsh7th/cmp-nvim-lsp', requires = {{'neovim/nvim-lspconfig'}}, config = "require('neoc.plugins.cmp-nvim-lsp')"} -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = "require('neoc.plugins.gitsignsnvim')"}

    --     use {'onsails/lspkind-nvim'}
    --     use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}
    --     -- Autocomplete
    --     use {'hrsh7th/nvim-cmp', config = "require('neoc.plugins.nvim-cmp')"}
    --     use {'hrsh7th/cmp-nvim-lsp'}
    --     use {'hrsh7th/cmp-buffer'}
    --     use {'L3MON4D3/LuaSnip'}
    --     use {'hrsh7th/cmp-vsnip'}
    --     use {'hrsh7th/vim-vsnip'}
    --     use {'hrsh7th/cmp-path'}
    --     use {'hrsh7th/cmp-calc'}
    --     use {'hrsh7th/cmp-cmdline'}
    --     use {'saadparwaiz1/cmp_luasnip'}
    --     use {'ray-x/cmp-treesitter'}
    --     use {'lukas-reineke/cmp-rg'}
    --     use {'quangnguyen30192/cmp-nvim-tags'}
    --     use {'rafamadriz/friendly-snippets'}
    --     use {'nvim-telescope/telescope-fzy-native.nvim'}
    --     use {'nvim-telescope/telescope-project.nvim'}
    --
    use {'terrortylor/nvim-comment', config = "require('neoc.plugins.nvim-comment')"}

end)
