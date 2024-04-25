return {
    {
        "neovim/nvim-lspconfig"
    },
    {
        "nvim-treesitter/nvim-treesitter"
    },
    {
        "ms-jpq/coq_nvim",
        opts = {
            lazy = false
        }
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
}
