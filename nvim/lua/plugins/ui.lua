return {
  {
    "mhinz/vim-startify",
    enabled = false,
    event = "VimEnter",
    config = function()
      vim.cmd([[
			source ~/.config/nvim/lua/plugins/vimscripts/startify.vim
		]])
    end,
  },
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          { section = "header", padding = 1 },
          -- { pane = 2, section = "terminal", cmd = "fortune -s | cowsay" },
          -- { pane = 2, section = "terminal", cmd = "", height = 8 },
          { icon = " ", title = 'Projects', section = "projects", indent = 2, padding = 2 },
          { icon = " ", title = 'Recent files', section = "recent_files", indent = 2, padding = 2 },
          { section = "keys", padding = 1, gap = 1 },
          { section = "startup" }
        },
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            -- { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config files", action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.expand('~/.config') })" },
            -- { icon = " ", key = "c", desc = "Config", action = ":find ~/.config" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          }
        }
      }
    }
  }
}
