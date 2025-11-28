return {
	{
		'lewis6991/gitsigns.nvim',
		config = function ()
			local status, gs = pcall(require, 'gitsigns')
			if (not status) then
				print("gitsigns error")
				return
			end
			gs.setup {}
		end
	}
}
