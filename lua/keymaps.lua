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
-- Próximo buffer
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
-- Buffer anterior
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Ir para buffer específico (1 a 9)
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, ':BufferLineGoToBuffer ' .. i .. '<CR>', { noremap = true, silent = true })
end

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

-- Git abrir PR
vim.api.nvim_set_keymap('n', '<leader>pr', ":lua require('scripts.git').open_pr_from_commit()<CR>", { noremap = true, silent = true })

-- Debugger
local dap = require("dap")

vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "Continuar execução" })
vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Passo sobre" })
vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Entrar" })
vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "Sair" })
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Alternar Breakpoint" })
vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end, { desc = "Abrir REPL" })
vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Alternar DAP UI" })
vim.keymap.set("n", "<leader>dD", function()
  require("dap").clear_breakpoints()
  print("Todos os breakpoints foram removidos")
end, { desc = "Remover todos os breakpoints" })

vim.keymap.set("n", "<leader>dt", function()
  dap.run({
    type = "go",
    name = "Debug Teste",
    request = "launch",
    mode = "test",
    program = vim.fn.expand("%"), -- Arquivo atual
  })
end, { desc = "Debugar Teste Atual" })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- IA
vim.keymap.set("n", "<leader>ia", ':CodeCompanionActions<CR>', { noremap = true, silent = true })

-- REPLACE
vim.keymap.set("n", "<leader>rc", ":lua require('spectre.actions').run_current_replace()", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ra", ":lua require('spectre.actions').run_replace()", { noremap = true, silent = true })

