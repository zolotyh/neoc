return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- File manager
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = "require('neoc.plugins.nvim-tree')",
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Works with files
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = "require('neoc.plugins.nvim-telescope')",
  })

  -- -- Theme
  -- use({
  --   "folke/tokyonight.nvim",
  --   config = "vim.cmd[[colorscheme tokyonight]]",
  -- }) -- turn on theme

  -- Language servers config
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim" ,
    "jayp0521/mason-null-ls.nvim",
  }

  use({ "hrsh7th/nvim-cmp" }) -- Autocompletion plugin
  use({ "hrsh7th/cmp-nvim-lsp" }) -- LSP source for nvim-cmp
  use({ "tami5/lspsaga.nvim" })

  -- Special completions plugins
  use({ "hrsh7th/cmp-path" }) -- path completions
  use({ "hrsh7th/cmp-buffer" }) -- completion for words in buffer
  use({ "hrsh7th/cmp-cmdline" }) -- complete
  use({ "lukas-reineke/cmp-rg" }) -- rip grep completion
  use({ "onsails/lspkind-nvim" }) -- show pictagrams on autocompletion

  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "L3MON4D3/LuaSnip", config = "require('neoc.plugins.lua-snip')" })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = "require('neoc.plugins.troublenvim')",
  }) -- Show LSP errors in one place

  -- Working with git
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = "require('neoc.plugins.gitsignsnvim')",
  })
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

  use 'rhysd/committia.vim'

  use({ "f-person/git-blame.nvim"})
  use({
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    config = "require('neoc.plugins.neogit')",
  })

  -- Add autopairs functionality
  use({ "windwp/nvim-autopairs",
    config = "require('neoc.plugins.nvim-autopairs')",
  })
  use({ "tpope/vim-repeat" })
  use({ "wakatime/vim-wakatime" })
  use({ "pechorin/any-jump.vim" })

  -- Status line setup
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = "require('neoc.plugins.lualine')",
  })

  use({ "Lenovsky/nuake", config = "require('neoc.plugins.nuake')" })

  use("ygm2/rooter.nvim")

  use({
    "terrortylor/nvim-comment",
    config = "require('neoc.plugins.nvim-comment')",
  })

  use({
    "windwp/nvim-ts-autotag",
    -- config = "require('neoc.plugins.nvim-ts-autotag')",
    after = "nvim-treesitter",
    ft = { "html", "tsx", "vue", "svelte", "php" },
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = "require('neoc.plugins.nvim-treesitter')",
  })
  use({ "ray-x/cmp-treesitter" }) -- show node types in autocompletion
  use({ "theHamsta/nvim-treesitter-pairs", after = "nvim-treesitter" })
  use({
    "nvim-treesitter/nvim-treesitter-refactor",
    after = "nvim-treesitter",
  })

  use({
    "goolord/alpha-nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = "require('neoc.plugins.alpha-nvim')",
  })
  use({
    "dinhhuy258/vim-local-history",
    config = "require('neoc.plugins.vim-local-history')",
  })
  use({ "phaazon/hop.nvim", config = "require('neoc/plugins/hopvim')" })

  use("tpope/vim-surround")
  use("editorconfig/editorconfig-vim")

  use("gennaro-tedesco/nvim-jqx")

  use("ziglang/zig.vim")

  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',

    config = function() require('ufo').setup()
      end
  }

  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  use {
    "brymer-meneses/grammar-guard.nvim",
    requires = {
        "neovim/nvim-lspconfig",
        "williamboman/nvim-lsp-installer"
    }
}
  use({
    "ray-x/sad.nvim",
    requires = { { "ray-x/guihua.lua" } },
    config = "require('neoc.plugins.sad')",
  })

  use {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup()
    end
  }
  use 'jsgv/codeql.nvim'

  use({
    "ellisonleao/gruvbox.nvim",
    config = function ()
      vim.o.background = 'light'
      vim.cmd[[colorscheme gruvbox]]
    end
  }) -- turn on theme
  

  -- use("neomake/neomake")
end)
