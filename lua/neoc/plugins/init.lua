return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- File manager
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = "require('neoc.plugins.nvim-tree')"}

    -- Works with files
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}, config = "require('neoc.plugins.nvim-telescope')"}

    -- Theme
    use {'folke/tokyonight.nvim', config = "vim.cmd[[colorscheme tokyonight]]"} -- turn on theme

    -- Language server
    use {'hrsh7th/nvim-cmp', config = "require('neoc.plugins.nvim-cmp')"} -- Autocompletion plugin
    use {'hrsh7th/cmp-nvim-lsp', requires = {{'neovim/nvim-lspconfig'}}, config = "require('neoc.plugins.cmp-nvim-lsp')"} -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = "require('neoc.plugins.troublenvim')"} -- Show LSP errors in one place

    -- Special completions plugins
    use {'hrsh7th/cmp-path'} -- path completions
    use {'hrsh7th/cmp-buffer'} -- completion for words in buffer
    use {'hrsh7th/cmp-cmdline'} -- complet
    use {"lukas-reineke/cmp-rg"} -- rip grep completion
    use {'onsails/lspkind-nvim'} -- show pictagrams on autocompletion

    -- Working with git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = "require('neoc.plugins.gitsignsnvim')"}
    use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}
    use {'rhysd/committia.vim'}
    use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = "require('neoc.plugins.neogit')"}

    -- Add autopairs functionality
    use {'windwp/nvim-autopairs', config = "require('neoc.plugins.nvim-autopairs')"}
    use {'tpope/vim-repeat'}
    use {'wakatime/vim-wakatime'}
    use {'pechorin/any-jump.vim'}

    -- Status line setup
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}, config = "require('neoc.plugins.lualine')"}

    use {'Lenovsky/nuake', config = "require('neoc.plugins.nuake')"}

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
    use 'ygm2/rooter.nvim'

    use {'terrortylor/nvim-comment', config = "require('neoc.plugins.nvim-comment')"}

    -- use {'mhinz/vim-startify'}
    use {
        'windwp/nvim-ts-autotag',
        config = "require('neoc.plugins.nvim-ts-autotag')",
        after = "nvim-treesitter",
        ft = {'html', 'tsx', 'vue', 'svelte', 'php'}
    }

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = "require('neoc.plugins.nvim-treesitter')"}
    use {'ray-x/cmp-treesitter'} -- show node types in autocompletion
    use {'theHamsta/nvim-treesitter-pairs', after = "nvim-treesitter"}
    use {'nvim-treesitter/nvim-treesitter-refactor', after = "nvim-treesitter"}

    use {'goolord/alpha-nvim', requires = 'kyazdani42/nvim-web-devicons', config = "require('neoc.plugins.alpha-nvim')"}
    use 'dinhhuy258/vim-local-history'
    use {'phaazon/hop.nvim', config = "require('neoc/plugins/hopvim')"}

end)
