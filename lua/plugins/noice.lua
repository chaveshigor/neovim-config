return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    -- add any options here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function ()
    require("noice").setup({
      presets = {
        long_message_to_split = true, -- Divide mensagens longas
      },
      -- Impede o Noice de ser desabilitado ao encontrar erros
      messages = {
        enabled = true,  -- As mensagens continuam sendo exibidas
      },
      lsp = {
        diagnostics = {
          virtual_text = true, -- Para mostrar os erros diretamente
        },
      },
    })

  end
}
