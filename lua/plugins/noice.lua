-- return {
--   "folke/noice.nvim",
--   event = "VeryLazy",
--   enabled = true,
--   opts = {
--     -- add any options here
--   },
--   dependencies = {
--     "MunifTanjim/nui.nvim",
--     "rcarriga/nvim-notify",
--   },
--   config = function ()
--     require("noice").setup({
--       presets = {
--         long_message_to_split = true, -- Divide mensagens longas
--       },
--       -- Impede o Noice de ser desabilitado ao encontrar erros
--       messages = {
--         enabled = true,  -- As mensagens continuam sendo exibidas
--       },
--       lsp = {
--         diagnostics = {
--           virtual_text = true, -- Para mostrar os erros diretamente
--         },
--       },
--       views = {
--         cmdline_popup = {
--           position = {
--             row = "50%",
--             col = "50%",
--           },
--           size = {
--             width = 60,
--             height = "auto",
--           },
--           zindex = 200,  -- Aumentar o zindex para garantir que o popup fique na frente
--         },
--         popupmenu = {
--           backend = "cmp",
--           zindex = 210,  -- Certifique-se de que menus popup não sejam cobertos
--         },
--         messages = {
--           enabled = true,
--           view = "mini",  -- Use "mini" ou "split" para mensagens visíveis
--           zindex = 220,  -- Aumente para garantir que mensagens importantes estejam visíveis
--         },
--       },
--     })
--
--   end
-- }
--
return {
  {"rcarriga/nvim-notify"},  -- para mensagens flutuantes
  {"stevearc/dressing.nvim"}, -- para inputs e seleção
  {"VonHeikemen/fine-cmdline.nvim"}, -- para cmdline
}

