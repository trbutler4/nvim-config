

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' },
      keys = {
        {"<leader>f", "<cmd>Telescope find_files<cr>", desc = "Telescope"},
      },
      config = function() 
          require("telescope").setup()
      end,
}
