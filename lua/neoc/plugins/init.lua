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
    use {'hrsh7th/nvim-cmp', config = "require('neoc.plugins.nvim-cmp')"} -- Autocompletion plugin
    use {'hrsh7th/cmp-nvim-lsp', requires = {{'neovim/nvim-lspconfig'}}, config = "require('neoc.plugins.cmp-nvim-lsp')"} -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- Special completions plugins
    use {'hrsh7th/cmp-path'} -- path completions
    use {'hrsh7th/cmp-buffer'} -- completion for words in buffer
    use {'hrsh7th/cmp-cmdline'} -- complet
    use {"lukas-reineke/cmp-rg"} -- rip grep completion
    use {'ray-x/cmp-treesitter'} -- show node types in autocompletion
    use {'onsails/lspkind-nvim'} -- show pictagrams on autocompletion

    -- Working with git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = "require('neoc.plugins.gitsignsnvim')"}
    use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}
    use {'rhysd/committia.vim'}
    use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = "require('neoc.plugins.neogit')"}

    -- Add autopairs functionality
    use {'windwp/nvim-autopairs', config = "require('neoc.plugins.nvim-autopairs')"}

    --     use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}
    --     -- Autocomplete
    --     use {'hrsh7th/nvim-cmp', config = "require('neoc.plugins.nvim-cmp')"}
    --     use {'hrsh7th/cmp-nvim-lsp'}
    --     use {'L3MON4D3/LuaSnip'}
    --     use {'hrsh7th/cmp-vsnip'}
    --     use {'hrsh7th/vim-vsnip'}
    --     use {'hrsh7th/cmp-calc'}
    --     use {'saadparwaiz1/cmp_luasnip'}
    --     use {'lukas-reineke/cmp-rg'}
    --     use {'quangnguyen30192/cmp-nvim-tags'}
    --     use {'rafamadriz/friendly-snippets'}
    --     use {'nvim-telescope/telescope-fzy-native.nvim'}
    --     use {'nvim-telescope/telescope-project.nvim'}
    --
    use {'terrortylor/nvim-comment', config = "require('neoc.plugins.nvim-comment')"}

end)
