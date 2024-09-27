require("startup").setup({
  theme = "dashboard"
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Startup display")  -- Abre o NvimTree automaticamente
  end,
})

