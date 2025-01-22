return {
  "startup-nvim/startup.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim"
  },
  priority = 1000,
  config = function()
    vim.g.startup_disable_on_startup = true
    require('startup').setup({
      theme = "dashboard"
    })
  end
}

