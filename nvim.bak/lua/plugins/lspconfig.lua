return {
	{
		'neovim/nvim-lspconfig',
		config = function()
			local status, n = pcall(require, 'lspconfig')
			if (not status) then
  				print("lspconfig error")
  				return
			end
			local protocol = require('vim.lsp.protocol')

			local on_attach = function(_, bufnr)
			    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
			    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

			    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

			    local opts = { noremap = true, silent = true }
			    buf_set_keymap('n', 'cD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
			    buf_set_keymap('n', 'cd', ':Lspsaga preview_definition<CR>', opts)
			    buf_set_keymap('n', 'ci', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
			    buf_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', opts)
			end

			protocol.CompletionItemKind = {
			  '', -- Text
			  '', -- Method
			  '', -- Function
			  '', -- Constructor
			  '', -- Field
			  '', -- Variable
			  '', -- Class
			  'ﰮ', -- Interface
			  '', -- Module
			  '', -- Property
			  '', -- Unit
			  '', -- Value
			  '', -- Enum
			  '', -- Keyword
			  '﬌', -- Snippet
			  '', -- Color
			  '', -- File
			  '', -- Reference
			  '', -- Folder
			  '', -- EnumMember
			  '', -- Constant
			  '', -- Struct
			  '', -- Event
			  'ﬦ', -- Operator
			  '', -- TypeParameter
			}

			local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

			n.lua_ls.setup {
			  on_attach = on_attach,
			  settings = {
			    Lua = {
			      diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			      },

			      workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			      },
			    },
			  },
			}
			n.bashls.setup {
				on_attach = on_attach,
				capabilities = capabilities
			}
			n.sourcekit.setup {}
			n.dartls.setup {}
			n.ts_ls.setup {
				on_attach = on_attach,
				capabilities = capabilities
			}
			n.pyright.setup {}
		end
	}
}
