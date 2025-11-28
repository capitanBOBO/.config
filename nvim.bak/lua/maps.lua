local keymap = vim.keymap

-- Split
keymap.set('n', 'sw', '<C-w>w')
keymap.set('n', 'sv', '<C-w>v')
keymap.set('n', 'ss', '<C-w>s')
keymap.set('n', 'sc', '<C-w>c')

-- Navigation
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sl', '<C-w>l')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sk', '<C-w>k')

-- Resize
keymap.set('n', 's<left>', '<C-w>5<')
keymap.set('n', 's<right>', '<C-w>5>')
keymap.set('n', 's<up>', '<C-w>5+')
keymap.set('n', 's<down>', '<C-w>5-')
keymap.set('n', 's=', '<C-w>=')

-- Buffer change
local function newBuffer()
	vim.cmd('enew | Startify')
end

keymap.set('n', 'b]', ':BufferLineCycleNext<Return>', { silent = true })
keymap.set('n', 'b[', ':BufferLineCyclePrev<Return>', { silent = true })
keymap.set('n', 'b.', ':BufferLineMoveNext<Return>', { silent = true })
keymap.set('n', 'b,', ':BufferLineMovePrev<Return>', { silent = true })
keymap.set('n', 'bn', newBuffer, { silent = true })

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

