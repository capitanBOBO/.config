-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

-- Split
keymap.set("n", "sw", "<C-w>w")
keymap.set("n", "sv", "<C-w>v")
keymap.set("n", "ss", "<C-w>s")
keymap.set("n", "sc", "<C-w>c")

-- Navigation
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sk", "<C-w>k")

-- Resize
keymap.set("n", "s<right>", "<C-w>5<")
keymap.set("n", "s<left>", "<C-w>5>")
keymap.set("n", "s<down>", "<C-w>5+")
keymap.set("n", "s<up>", "<C-w>5-")
keymap.set("n", "s=", "<C-w>=")

-- Buffer change
local function newBuffer()
  vim.cmd("enew | Startify")
end

keymap.set("n", "b]", ":BufferLineCycleNext<Return>", { silent = true })
keymap.set("n", "b[", ":BufferLineCyclePrev<Return>", { silent = true })
keymap.set("n", "b.", ":BufferLineMoveNext<Return>", { silent = true })
keymap.set("n", "b,", ":BufferLineMovePrev<Return>", { silent = true })
-- keymap.set("n", "bn", newBuffer, { silent = true })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Which key keymaps
keymap.set("n", "<leader>bn", newBuffer, { silent = true, desc = "New buffer" })
keymap.set("n", "<leader>fs", ":w<Return>", { silent = true, desc = "Save file" })
keymap.set("n", "<leader>fq", ":wq<Return>", { silent = true, desc = "Save and quit" })
keymap.set("n", "<leader>be", ":Telescope buffers<Return>", { silent = true, desc = "Buffer explorer" })

keymap.set("i", "<A-Right>", "<C-o>e", { desc = "Move to end of next word (insert mode)" })
keymap.set("i", "<A-Left>", "<C-o>b", { desc = "Move to start of previous word (insert mode)" })
keymap.set("i", "<C-Right>", "<C-o>$", { desc = "Move to end of line (insert mode)" })
keymap.set("i", "<C-Left>", "<C-o>0", { desc = "Moce to start of line (insert mode)" })

keymap.set("n", "<A-Right>", "e", { desc = "Move to end of next word (normal mode)" })
keymap.set("n", "<A-Left>", "b", { desc = "Move to start of previous word (normal mode)" })
keymap.set("n", "<C-Right>", "$", { desc = "Move to end of line (normal mode)" })
keymap.set("n", "<C-Left>", "0", { desc = "Moce to start of line (normal mode)" })

-- Flutter
keymap.set(
  "n",
  "<leader>F",
  ":Telescope flutter commands<CR>",
  { noremap = true, silent = true, desc = "Flutter tools commands" }
)
