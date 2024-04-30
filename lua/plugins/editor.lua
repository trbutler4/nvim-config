return {
    "neovim/nvim-lspconfig",
    {"nvim-treesitter/nvim-treesitter", opts = {} },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    "folke/zen-mode.nvim",
    "mg979/vim-visual-multi",
}
