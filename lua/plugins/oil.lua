return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>-",
			mode = { "n", "v" },
			"<cmd>Oil<cr>",
			desc = "Open oil at the current file",
		},
		{
			"<leader>cw",
			"<cmd>Oil .<cr>",
			desc = "Open oil in nvim's working directory",
		},
		{
			"<c-up>",
			"<cmd>Oil<cr>",
			desc = "Open oil file manager",
		},
	},
	lazy = false,
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = false,
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, ".")
				end,
				is_always_hidden = function(name, bufnr)
					return false
				end,
				sort = {
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},
			float = {
				padding = 2,
				max_width = 0,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
				override = function(conf)
					return conf
				end,
			},
			preview = {
				max_width = 0.9,
				min_width = { 40, 0.4 },
				width = nil,
				max_height = 0.9,
				min_height = { 5, 0.1 },
				height = nil,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
			},
			progress = {
				max_width = 0.9,
				min_width = { 40, 0.4 },
				width = nil,
				max_height = { 10, 0.9 },
				min_height = { 5, 0.1 },
				height = nil,
				border = "rounded",
				minimized_border = "none",
				win_options = {
					winblend = 0,
				},
			},
		})
		
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function(data)
				if vim.fn.isdirectory(data.file) == 1 then
					vim.cmd.cd(data.file)
					require("oil").open()
				end
			end,
		})
	end,
}