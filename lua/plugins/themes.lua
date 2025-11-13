return {
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa')
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
  },
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.opt.termguicolors = true
      require('tokyonight')
      vim.cmd("colorscheme tokyonight-storm")
    end
  }
}
