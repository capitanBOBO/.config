return {
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{
		'hrsh7th/nvim-cmp',
		config = function()
			local status, cmp = pcall(require, 'cmp')
			if (not status or cmp == nil) then
				print('cmp error')
				return
			end

			local has_words_before = function()
			  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
			  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			local luasnip = require('luasnip')
			local lspkind = require('lspkind')
			cmp.setup {
				mapping = {
					["<C-n>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-p>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<Esc>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.abort()
						else
							fallback()
						end
					end)
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end
				},
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'buffer' },
					{ name = 'path' }
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol_text',
						symbol_map = {
						      Text = "",
						      Method = "",
						      Function = "",
						      Constructor = "",
						      Field = "ﰠ",
						      Variable = "",
						      Class = "ﴯ",
						      Interface = "",
						      Module = "",
						      Property = "ﰠ",
						      Unit = "塞",
						      Value = "",
						      Enum = "",
						      Keyword = "",
						      Snippet = "",
						      Color = "",
						      File = "",
						      Reference = "",
						      Folder = "",
						      EnumMember = "",
						      Constant = "",
						      Struct = "פּ",
						      Event = "",
						      Operator = "",
						      TypeParameter = ""
						    }
					})
				}
			}

			vim.cmd[[
				set completeopt=menuone,noinsert,noselect
				highlight! default link CmpItemKind CmpItemMenuDefault
			]]

		end
	},
	{ 'onsails/lspkind.nvim' },
	{
		'glepnir/lspsaga.nvim',
	--	opt = true,
		branch = "main",
		event = 'LspAttach',
		config = function()
			local saga = require("lspsaga")
			saga.setup({})
		end,

	}
}
