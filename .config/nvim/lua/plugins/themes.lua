return {
  {
    { "typicode/bg.nvim", lazy = false },
  },

  {
    "rebelot/kanagawa.nvim",
  },

  {
    "rose-pine/neovim",
  },

  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      })
    end,

    -- optionally set the colorscheme within lazy config
    init = function()
      vim.cmd("colorscheme poimandres")
    end,
  },

  -- make kanagawa the default theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  }
}
