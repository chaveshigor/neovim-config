return {
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa')
      vim.cmd("colorscheme kanagawa-wave")
    end
  },
  { "Mofiqul/dracula.nvim" },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = "mocha",
        integrations = {
          telescope = true,
          nvimtree = true,
        },
      })
    end
  }
}
