return {
  { "rcarriga/nvim-notify", init = false, config = true },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = { view = "cmdline" },
      messages = { view_search = false },
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
