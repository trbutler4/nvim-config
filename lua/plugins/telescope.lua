

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' },
      keys = {
        { "<Space>ff", "<cmd>Telescope find_files<cr>", desc = "File picker" },
        { "<Space>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<Space>fb", "<cmd>Telescope buffers<cr>", desc = "Buffer picker" },
        { "<Space>fh", "<cmd>Telescope help_tags<cr>", desc = "Help file picker" },
      },
}
