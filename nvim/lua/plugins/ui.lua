return {
  {
    "mhinz/vim-startify",
    enabled = true,
    event = "VimEnter",
    config = function()
      vim.cmd([[
			source ~/.config/nvim/lua/plugins/vimscripts/startify.vim
		]])
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
    event = "VimEnter",
    config = function()
      local logo = [[
        ███╗   ██╗██╗   ██╗██╗███╗   ███╗
        ████╗  ██║██║   ██║██║████╗ ████║
        ██╔██╗ ██║██║   ██║██║██╔████╔██║
        ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]
      require("dashboard").setup({
        theme = "Hyper",
        config = {
          shortcut = {
            { desc = "􀣋 Dotfiles", group = "label", action = "Neotree ~/.config/ position=current", key = "c" },
          },
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
