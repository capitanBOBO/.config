return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		ft = "netrw",
		cmd = "Neotree",
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				window = {
					position = "left",
					width = 30,
				},
				buffers = {
					follow_current_file = {
						enabled = true,
					},
				},
				git_status = {
					window = {
						position = "float",
					},
				},
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
					hijack_netrw_behavior = "open_current",
					use_libuv_file_watcher = true,
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_by_name = {
							"node_modules",
						},
						never_show = {
							".DS_Store",
							"thumbs.db",
						},
					},
				},
			})
		end,
	},
}
