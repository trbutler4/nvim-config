-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- fuzzy finder
    use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- colors
    use({ 
      'sainnhe/everforest', 
      as = 'everforest',
      config = function()
          vim.cmd('colorscheme everforest')
      end
    })

    -- treesitter (syntax highlighting)
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    -- undo tree (undo history visualizer)
    use('mbbill/undotree')

    -- git support 
    use('tpope/vim-fugitive')

    -- LSP support 
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
        pcall(vim.cmd, 'MasonUpdate')
          end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
      }
    }

    -- github copilot 
    --use('github/copilot.vim')

    -- Markdown Preview 
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- auto close pairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- file tree 
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    }

end)
