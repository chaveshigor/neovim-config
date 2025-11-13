return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  options = {
    separator_style = "slant",
    numbers = "ordinal"
  },
  config = function()
    require('bufferline').setup{}
  end
}
