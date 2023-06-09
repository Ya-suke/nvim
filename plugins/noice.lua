return {
  { "rcarriga/nvim-notify", init = false, config = true },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        view = "cmdline",
        format = {
          cmdline = { pattern = "^:", icon = "󱂂", lang = "vim" }, --  , 󰮾, 󱂂  v-furigana,󱂁, 󰘳, 󰇝, 󰮎
        },
      },
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true,              -- enables the Noice messages UI
        view = "notify",             -- default view for messages
        view_error = "notify",       -- view for errors
        view_warn = "notify",        -- view for warnings
        view_history = "messages",   -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      },
      lsp = {
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
      },
      routes = {
        { filter = { event = "msg_show", find = "%d+L,%s%d+B" },        opts = { skip = true } }, -- skip save notifications
        { filter = { event = "msg_show", find = "^%d+ more lines$" },   opts = { skip = true } }, -- skip paste notifications
        { filter = { event = "msg_show", find = "^%d+ fewer lines$" },  opts = { skip = true } }, -- skip delete notifications
        { filter = { event = "msg_show", find = "^%d+ lines yanked$" }, opts = { skip = true } }, -- skip yank notifications
      },
      presets = { long_message_to_split = true },
    },
  },
}
