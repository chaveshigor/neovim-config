vim.g.mapleader = ' '  -- Define a tecla leader como espaço

-- Telescope atalhos
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })

-- Navegação entre janelas no Neovim com Ctrl + setas do teclado
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', { noremap = true, silent = true })

-- Navegação entre janelas do Neovim e panes do tmux com setas
vim.api.nvim_set_keymap('n', '<C-Up>', ':TmuxNavigateUp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':TmuxNavigateDown<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':TmuxNavigateLeft<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':TmuxNavigateRight<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cp', ':let @+ = expand("%")<CR>', { noremap = true, silent = true })

-- Abrir janela lateral com arquivos
vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Abre o menu inicial do neovim
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Startup display")
  end,
})

-- Fecha o buffer atual
vim.api.nvim_set_keymap('n', '<leader>w', ':bd<CR>', { noremap = true, silent = true })

-- Fold
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99

-- Mover na linha
vim.api.nvim_set_keymap('n', '<S-Right>', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Right>', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Right>', '$', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<S-Left>', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Left>', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Left>', '^', { noremap = true, silent = true })

