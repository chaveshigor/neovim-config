local servers = { "lua", "ruby", "python", "javascript", "go", "typescript", "tsx" }
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  configs = function()
    require('nvim-treesitter/nvim-treesitter').install(servers)
    require('nvim-treesitter/nvim-treesitter').setup {
      install_dir = vim.fn.stdpath('data') .. '/ts_servers',
      indent = {
        enable = true,
      },
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = servers,
      callback = function() vim.treesitter.start() end,
    })
  end
}
