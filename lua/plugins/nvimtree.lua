-- Configurar NvimTree
require('nvim-tree').setup({
  hijack_netrw = false,
  view = {
    width = 30, -- Largura da janela do NvimTree
    side = 'left', -- Posição (left ou right)
  },
  filters = {
    git_ignored = false,
    dotfiles = false  -- Exibir arquivos ocultos
  }
})

-- Atalho para abrir o NvimTree
vim.api.nvim_set_keymap(
  'n', '<C-e>', ':NvimTreeToggle<CR>',
  { noremap = true, silent = true }
)

