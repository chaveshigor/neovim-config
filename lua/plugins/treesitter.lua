return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',  -- Atualiza automaticamente os parsers após a instalação
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "lua", "ruby", "python", "javascript", "go", "vue", "dart" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      fold = {
        enable = true
      }
    }
  end
}


