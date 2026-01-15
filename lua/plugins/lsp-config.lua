-- Lista de servidores para o Mason garantir a instalação
local servers = { "ts_ls", "html", "lua_ls", "ruby_lsp", "gopls" }

return {
  -- Gerenciador de pacotes (agora sob a organização mason-org)
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ui = { border = "rounded" },
    },
  },

  -- Ponte entre Mason e lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = servers,
      -- Nota: Na v2.0+, o mason-lspconfig foca no novo vim.lsp.config nativo
    },
  },

  -- Configuração Principal do LSP (Neovim 0.11+)
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local lspconfig = require("lspconfig")
      local blink = require("blink.cmp")

      -- Função on_attach para centralizar seus atalhos
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end

      -- As capacidades do Blink são injetadas automaticamente
      local capabilities = blink.get_lsp_capabilities()

      -- Configuração dos servidores via novo sistema vim.lsp.config
      for _, lsp in ipairs(servers) do
        local config = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        -- Configurações específicas para Go
        if lsp == "gopls" then
          config.settings = {
            gopls = {
              gofumpt = true,
              analyses = { unusedparams = true, shadow = true },
              staticcheck = true,
              completeUnimported = true,
            },
          }
        end

        -- Aplica a configuração usando o novo padrão
        lspconfig[lsp].setup(config)
      end
    end,
  },
}
