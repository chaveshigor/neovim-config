return {
  'rebelot/kanagawa.nvim',
  config = function()
    require('kanagawa')
    vim.cmd("colorscheme kanagawa-wave")
  end
}
