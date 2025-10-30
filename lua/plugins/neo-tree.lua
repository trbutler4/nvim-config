return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>-",
			mode = { "n", "v" },
			"<cmd>Neotree toggle<cr>",
			desc = "Toggle Neo-tree",
		},
		{
			"<leader>cw",
			"<cmd>Neotree toggle cwd<cr>",
			desc = "Toggle Neo-tree at working directory",
		},
		{
			"<c-up>",
			"<cmd>Neotree reveal<cr>",
			desc = "Reveal current file in Neo-tree",
		},
	},
	opts = {
		close_if_last_window = true,
		filesystem = {
			hijack_netrw_behavior = "open_default",
			follow_current_file = {
				enabled = true,
			},
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
		},
		window = {
			position = "left",
			width = 30,
		},
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function(_, opts)
		require("neo-tree").setup(opts)

		-- Auto-open neo-tree when starting neovim in a directory
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local arg = vim.fn.argv(0)
				if arg == "" or vim.fn.isdirectory(arg) == 1 then
					vim.cmd("Neotree show")
				end
			end,
		})
	end,
}
