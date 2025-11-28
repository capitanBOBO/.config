return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'tsakirist/telescope-lazy.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
			}
		},
		config = function ()
			local status, n = pcall(require, 'telescope')
			if (not status) then return end

			n.setup {
				  pickers = {
				    find_files = {
				      theme = "ivy",
				      hidden = true
				    },
				    grep_string = {
				      theme = "ivy",
				      hidden = true
				    },
				    current_buffer_fuzzy_find = {
				      theme = "ivy"
				    },
				    live_grep = {
				      theme = "ivy",
				      hidden = true
				    },
				    oldfiles = {
				      theme = "ivy",
				      hidden = true
				    },
				    buffers = {
				      theme = "ivy",
				      hidden = true
				    }
				  },
				  extensions = {
					  fzf = {
						  fuzzy = true,
						  override_generic_sorter = true,
						  override_file_sorter = true,
						  case_mode = "smart_case",
					  }
				  }
			}

			n.load_extension('lazy')

		end
	}
}
