return {
  {
    "907th/vim-auto-save",
    enabled = false,
    config = function()
      vim.g.auto_save = 1
      vim.g.auto_save_silent = 1
    end,
  },
}
