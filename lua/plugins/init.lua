-- Carregar lazy.nvim
vim.opt.rtp:prepend('~/.local/share/nvim/lazy/lazy.nvim')

-- Configurar plugins
require('lazy').setup({
  -- Carregar Catppuccin
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    --lazy = false,
    priority = 1000,
    config = function()
      require('plugins.catppuccin')
    end
  },
  {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    priority = 1000,
    config = function()
      vim.g.startup_disable_on_startup = true
      require('plugins.startup')
    end
  },
  {
    "Mofiqul/dracula.nvim",
    config = function()
      require('plugins.dracula')
    end
  },

  -- Icones
  { 'kyazdani42/nvim-web-devicons' },
  -- Carregar Telescope
  {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.telescope')  -- Arquivo separado
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },  -- Ícones opcionais
    config = function()
      require('plugins.nvimtree')  -- Carregar a configuração em arquivo separado
    end
  },
  { 'christoomey/vim-tmux-navigator' },
  { 'tpope/vim-fugitive' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('plugins.lualine')
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',  -- Atualiza automaticamente os parsers após a instalação
    config = function()
      require('plugins.treesitter')
    end
  },
  { 'vim-ruby/vim-ruby' },
  
})

