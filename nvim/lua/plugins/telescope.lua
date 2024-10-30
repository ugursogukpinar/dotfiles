return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",

      "tpope/vim-fugitive",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-media-files.nvim",
        config = function()
          require("telescope").load_extension("media_files")
        end,
      },
      {
        "isak102/telescope-git-file-history.nvim",
        config = function()
          require("telescope").load_extension("git_file_history")
        end,
      },
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
    },
    extensions = {},
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top", horizontal = { preview_cutoff = 0 } },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    },
    config = function()
      -- Load the extensions
    end,
  },
}
