return {
  "ray-x/go.nvim",
  "ray-x/guihua.lua",
  "preservim/vim-pencil",
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  {"theHamsta/nvim-dap-virtual-text"},
  {"leoluz/nvim-dap-go"},

  -- Git related plugins
  {"tpope/vim-fugitive"},
  {"nvim-lualine/lualine.nvim"}, -- Fancier statusline
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {"numToStr/Comment.nvim"}, -- "gc" to comment visual regions/lines
  {"tpope/vim-sleuth"}, -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  {"nvim-telescope/telescope-symbols.nvim"},
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
  {
  "folke/twilight.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

}
