return {
  -- INFO: Dev Productivity PLUGINS
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      -- add any custom options here
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        gui_style = {
          fg = "BOLD", -- NONE / BOLD
        },
        highlight = {
          before = "",
          keyword = "fg", -- wide, fg, bg, wide_bg, wide_fg
          after = "",
        },
      }
    end,
    opts = {},
    --  WARN: setting lazy=false overrides current bg
    --
    -- event = "BufRead",
    event = "User AstroFile",
    cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      },
    },
  },
  {
    "vimwiki/vimwiki",
    branch = "dev",
    -- lazy = false,
    -- priority = 1000,
    event = "VeryLazy",
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/",
          syntax = "markdown",
          ext = ".md",
          auto_diary_index = 1,
        },
      }
      -- Use vimwiki filetype only for vimwiki files
      vim.g.vimwiki_global_ext = 0
    end,
  },
  {
    "tpope/vim-eunuch",
    cmd = {
      "Remove",
      "Delete",
      "Move",
      "Chmod",
      "Copy",
      "Mkdir",
      "Cfind",
      "Clocate",
      "Lfind",
      "Wall",
      "SudoWrite",
      "SudoEdit",
    },
    -- event = "User AstroFile",
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    opts = {
      ignore_lsp = { "lua_ls", "gopls" },
    },
    config = function(_, opts) require("project_nvim").setup(opts) end,
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
    -- event = "User AstroFile",
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
  },
  -- INFO: Python Plugins
  {
    "ambv/black",
    -- event = "VeryLazy",
    ft = "python",
  },
  -- INFO: js Plugins
  -- {
  --   "dsznajder/vscode-es7-javascript-react-snippets",
  --   -- event = "VeryLazy",
  --   ft = {
  --     "javascript",
  --     "javascriptreact",
  --     "typescriptreact",
  --     "typescript",
  --   },
  --   build = "yarn install --frozen-lockfile && yarn compile",
  -- },
  -- INFO: AI Plugins
  -- {
  --   "github/copilot.vim"
  -- event = "VeryLazy"
  -- },
  -- INFO:  Go Plugins & Dap
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function(_, opts) require("go").setup(opts) end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts) require("dap-go").setup(opts) end,
  },
  -- Snippets
  {
    "rafamadriz/friendly-snippets",
    -- enabled = false,
  },
  -- INFO: Vim Tmux integration Plugins
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
