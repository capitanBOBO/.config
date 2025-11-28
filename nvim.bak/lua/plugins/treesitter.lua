return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function ()
		local status, ts = pcall(require, 'nvim-treesitter.configs')
		if (not status) then
			return
		end

		ts.setup {
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				'swift',
				'javascript',
				'tsx',
				'json',
				'dart',
				'vim',
				'bash',
				'lua',
				'regex',
				'markdown',
				'markdown_inline'
			},
			autotag = {
				enable = true
			}
		}
	end
}
