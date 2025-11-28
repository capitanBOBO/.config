vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.mouse = 'a'
vim.opt.updatetime = 100
vim.opt.wildmenu = true
vim.opt.clipboard = 'unnamed'
vim.opt.guifont = { "JetBrainsMono Nerd Font Mono", "h15" }
vim.opt.shell = 'zsh'
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false
vim.opt.path:append { '**' }
vim.opt.smarttab = true
vim.cmd('set noswapfile')

vim.opt.winblend = 0
vim.opt.hlsearch = true
vim.opt.cursorline = true
vim.opt.wildoptions = 'pum'
vim.opt.termguicolors = true
vim.opt.pumblend = 5
vim.opt.completeopt = 'menu'
vim.cmd('syntax enable')
vim.cmd('colorscheme nord')
local function autoSave()
	local mode = vim.fn.mode()
	if mode == 'n' then
		vim.cmd('wa')
	end
end

--vim.api.nvim_create_autocmd({"ModeChanged", "TextChanged"}, {
--	callback = autoSave
--})
--
--vim.api.nvim_create_autocmd("InsertLeave", {
--	command = "set nopaste"
--})
--
--vim.api.nvim_create_autocmd("ModeChanged", {
--	command = "nohlsearch"
--})

-- vim.opt.formatoptions:append { 'r' }

if vim.g.neovide then
	vim.g.neovide_hide_mouse_when_typing = false
	vim.g.neovide_cursor_animation_length = 0
end
