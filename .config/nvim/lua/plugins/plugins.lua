return {
  {
    "echasnovski/mini.move",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.move").setup({
        right = "<M-l>",
        down = "<M-j>",
        up = "<M-k>",
        line_left = "<M-h>",
        mappings = {
          left = "<M-h>",
          line_right = "<M-l>",
          line_down = "<M-j>",
          line_up = "<M-k>",
        },
        options = {
          reindent_linewise = true,
        },
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        tmux = { enabled = true },
        kitty = { enabled = true, font = "+4" },
      },
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- disable conform
  { "stevearc/conform.nvim", enabled = false },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      local Util = require("lazyvim.util")
      local colors = {
        [""] = Util.ui.fg("Special"),
        ["Normal"] = Util.ui.fg("Special"),
        ["Warning"] = Util.ui.fg("DiagnosticError"),
        ["InProgress"] = Util.ui.fg("DiagnosticWarn"),
      }
      table.insert(opts.sections.lualine_x, 2, {
        function()
          local icon = require("lazyvim.config").icons.kinds.Copilot
          local status = require("copilot.api").status.data
          return icon .. (status.message or "")
        end,
        cond = function()
          local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
          return ok and #clients > 0
        end,
        color = function()
          if not package.loaded["copilot"] then
            return
          end
          local status = require("copilot.api").status.data
          return colors[status.status] or colors[""]
        end,
      })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "mistricky/codesnap.nvim",
    lazy = "true",
    build = "make",
    cmd = "CodeSnapPreviewOn",
    opts = {
      mac_window_bar = false,
      watermark = "",
      preview_title = "",
    },
  },
  {
    {
      "echasnovski/mini.animate",
      opts = {
        open = {
          enable = false,
        },
        close = {
          enable = false,
        },
      },
    },
  },
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "Not School",
        path = "~/Documents/notes/NonSchoolVault",
      },
      {
        name = "School",
        path = "~/Documents/notes/SchoolVault",
      },
    },

    -- see below for full list of options 👇
  },
  {
    "xiyaowong/transparent.nvim",
  },
}
