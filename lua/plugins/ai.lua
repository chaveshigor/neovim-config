return {
  {
    'olimorris/codecompanion.nvim',
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim"
    },
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
      cmd = {
        adapter = "copilot"
      }
    },
    -- init = function()
    --   require("plugins.ai-loading"):init()
    -- end,
  },
}
