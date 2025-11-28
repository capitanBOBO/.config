return {
  {
    "shaunsingh/nord.nvim",
  },
  {
    "Mofiqul/dracula.nvim",
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
  },
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function ()
      require("catppuccin").setup({
    flavour = "frappe"
      })
    end
  }
}
