
-- misc configuration stuff
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- general configuration
vim.cmd([[
    set nocompatible
    set number
    set autoindent
    set expandtab
    set tabstop=4
    set shiftwidth=4
    let mapleader="\<SPACE>"
    set noswapfile
    set termguicolors
    set background=dark
    let g:everforest_background = 'soft'
    let g:everforest_better_performance = 1
    colorscheme everforest
    set colorcolumn=100
]])

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'	        -- packer manges itself
    use 'nvim-lualine/lualine.nvim'         -- status line for nvim
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig' 	        -- language server support
    use 'nvim-telescope/telescope.nvim'     -- fuzzy finder
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'kyazdani42/nvim-tree.lua'          -- file tree
    use 'nvim-tree/nvim-web-devicons'       -- file type icons
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'              -- autocomplete for native lsp
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'mcauley-penney/tidy.nvim'          -- remove whitespace at EOF on save
    use 'github/copilot.vim'             -- github copilot
    use 'sainnhe/everforest'                -- everforest theme
    use 'folke/tokyonight.nvim'             -- tokyonight theme
    use 'catppuccin/nvim'                   -- catppuccin theme
    use 'sbdchd/neoformat'                  -- auto format files
    use 'windwp/nvim-autopairs'             -- auto pair brackets etc.
    use 'dinhhuy258/git.nvim'               -- integrate git commands into nvim
    use 'lewis6991/gitsigns.nvim'           -- git decorations
    use "iamcco/markdown-preview.nvim"     -- markdown preview
    --use "glendir/lspsaga.nvim"

end)


-- set up language support stuff
require('mason').setup()
require('mason-lspconfig').setup() -- must be done after 'mason'

-- Set up lspconfig. (must be done after mason-lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup {
	capabilities = capabilities
}
require('lspconfig').pyright.setup {
	capabilities = capabilities
}
require('lspconfig').tsserver.setup {
	capabilities = capabilities
}
require('lspconfig').solidity.setup {
	capabilities = capabilities,
}
require('lspconfig').rust_analyzer.setup {
    capabilities = capabilities,
}

-- set up additional lsp features
--require('lspsaga').setup()

-- set up for Git stuff
require('git').setup()
require('gitsigns').setup()

-- set up auto pairs
require('nvim-autopairs').setup()

-- set up tidy
require("tidy").setup({
	filetype_exclude = { "markdown", "diff" },
})

-- setup nvim tree and icons
require('nvim-tree').setup()
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true } )
require('nvim-web-devicons').setup()
require('lualine').setup()

-- setup keybinds for magma
vim.cmd([[
	nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
	nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
	xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
	nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
	nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
	nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

	let g:magma_automatically_open_output = v:false
	let g:magma_image_provider = "ueberzug"
]])

-- setup for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- setup nvim-cmp
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
})
