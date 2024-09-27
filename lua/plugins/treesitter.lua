require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "ruby", "python", "javascript", "go" },
    highlight = {
      enable = true,  -- Ativa o destaque de sintaxe
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  }
