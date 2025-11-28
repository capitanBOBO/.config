return {
	{
		'NvChad/nvim-colorizer.lua',
		opts = {
				filetypes = { "*" },
				user_default_options = {
					RRGGBBAA = true,
					AARRGGBB = true,
					mode = "background"
				},
				buftypes = {},
		}
	},
	{
		'shaunsingh/nord.nvim'
	},
  {
	  'dracula/vim',
	  name = 'dracula'
  },
  { 'nvim-lua/plenary.nvim' },
  {
	  'folke/noice.nvim',
	  event = "VeryLazy",
	  dependencies = {
		  'MunifTanjim/nui.nvim',
		  'rcarriga/nvim-notify'
	  },
	  config = function()
	  	local status, noice = pcall(require, 'noice')
		if (not status or noice == nil) then
		 print('noice error')
		 return
		end

		noice.setup {
		  lsp = {
		    -- override markdown rendering so that cmp and other plugins use Treesitter
		    override = {
		      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
		      ["vim.lsp.util.stylize_markdown"] = true,
		      ["cmp.entry.get_documentation"] = true,
		    },
		  },
		  -- you can enable a preset for easier configuration
		  presets = {
		    bottom_search = true, -- use a classic bottom cmdline for search
		    command_palette = true, -- position the cmdline and popupmenu together
		    long_message_to_split = true, -- long messages will be sent to a split
		    inc_rename = false, -- enables an input dialog for inc-rename.nvim
		    lsp_doc_border = false, -- add a border to hover docs and signature help
		  },
		}
	  end
  },
  {
	'mhinz/vim-startify',
	config = function()
		vim.cmd([[
			source ~/.config/nvim/lua/plugins/vimscripts/startify.vim
		]])
	end
  },
  {
	  'liuchengxu/vim-which-key',
	  config = function()
		  vim.cmd([[
		  	source ~/.config/nvim/lua/plugins/vimscripts/whichkey.vim
		  ]])
	  end
  },
  {
	  'nvim-lualine/lualine.nvim',
	  dependencies = {
		  'nvim-tree/nvim-web-devicons'
	  },
	  config = function ()
		  local status, lualine = pcall(require, 'lualine')
		  if (not status) then return end
		  lualine.setup {
			  sections = {
				  lualine_x = {
					  'filetype'
				  }
			  }
		  }
	  end
  },
  {
	  'akinsho/bufferline.nvim',
	  dependencies = 'nvim-tree/nvim-web-devicons',
	  config = function ()
	  	local status, bufferline = pcall(require, 'bufferline')
		if (not status) then return end
		bufferline.setup {
			options = {
				show_buffer_style = true,
				separator_style = "slant",
				offsets = {
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left"
				}
			}
		}
	  end
  },
  {

  }
}
