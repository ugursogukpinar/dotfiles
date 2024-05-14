return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 10000,
    opts = {
      style = "storm",
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
}
