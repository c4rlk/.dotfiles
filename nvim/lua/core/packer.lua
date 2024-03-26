-- Bootstrap Packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Plugins
return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "norcalli/nvim-colorizer.lua" -- Colors highlighter

    use {
        'nvim-lualine/lualine.nvim',
        event = "VimEnter",
        config = function()
            require("core.plugin_config.lualine").setup()
        end,
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- colorschemes

    use({
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        config = function()
            vim.cmd('colorscheme tokyonight')
        end
    })

    use({
        'NTBBloodbath/doom-one.nvim',
        setup = function()
            -- Add color to cursor
            vim.g.doom_one_cursor_coloring = false
            -- Set :terminal colors
            vim.g.doom_one_terminal_colors = true
            -- Enable italic comments
            vim.g.doom_one_italic_comments = false
            -- Enable TS support
            vim.g.doom_one_enable_treesitter = true
            -- Color whole diagnostic text or only underline
            vim.g.doom_one_diagnostics_text_color = false
            -- Enable transparent background
            vim.g.doom_one_transparent_background = false

            -- Pumblend transparency
            vim.g.doom_one_pumblend_enable = false
            vim.g.doom_one_pumblend_transparency = 20

            -- Plugins integration
            vim.g.doom_one_plugin_neorg = true
            vim.g.doom_one_plugin_barbar = false
            vim.g.doom_one_plugin_telescope = true
            vim.g.doom_one_plugin_neogit = true
            vim.g.doom_one_plugin_nvim_tree = true
            vim.g.doom_one_plugin_dashboard = true
            vim.g.doom_one_plugin_startify = true
            vim.g.doom_one_plugin_whichkey = true
            vim.g.doom_one_plugin_indent_blankline = true
            vim.g.doom_one_plugin_vim_illuminate = true
            vim.g.doom_one_plugin_lspsaga = false
        end,
        config = function()
            -- vim.cmd("colorscheme doom-one")
        end,
    })


    use {
        'nvim-telescope/telescope.nvim',
        tag = "0.1.4",
        requires = { 'nvim-lua/plenary.nvim' },
    }

    use {
        opt = true,
        'numToStr/Comment.nvim',
        keys = { "gc", "gcc", "gbc", "gb" },
        config = function()
            require('Comment').setup()
        end
    }

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    --use 'nvim-treesitter/nvim-treesitter-context'

    use 'nvim-treesitter/playground'

    use 'mbbill/undotree'

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    use "lukas-reineke/indent-blankline.nvim"

    use "lewis6991/gitsigns.nvim" -- show gitsymbols on left bar

    -- use {
    --   "folke/which-key.nvim",
    --   config = function()
    --     vim.o.timeout = true
    --     vim.o.timeoutlen = 300
    --     require("which-key").setup {
    --       -- your configuration comes here
    --       -- or leave it empty to use the default settings
    --       -- refer to the configuration section below
    --     }
    --   end
    -- }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
