return {

  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/.config/nvim/",
        "~/works/SmartGift/code/sgb-workspace/*",
        "~/works/SmartGift/code/send-with-smartgift/*",
        "~/works/kyrosmobile/ecosh/backend",
        "~/works/kyrosmobile/ecosh/frontend",
        "~/works/sonicdigital/51nsights/app/",
        "~/works/sonicdigital/51nsights/51nsights-frontend",
        "~/works/poc/",
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },
}
