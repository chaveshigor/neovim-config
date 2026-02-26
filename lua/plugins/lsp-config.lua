-- Lista de servidores para o Mason garantir a instalação
local servers = { "vtsls", "html", "lua_ls", "ruby_lsp", "gopls" }

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
			automatic_enable = false, -- Gerenciado via vim.lsp.enable() explicitamente
		},
	},

	-- Configuração Principal do LSP (Neovim 0.11+)
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
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

			-- Configurações globais para todos os servidores
			vim.lsp.config("*", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Configurações específicas para Ruby (usa shim do mise para respeitar .ruby-version)
			vim.lsp.config("ruby_lsp", {
				cmd = { vim.env.HOME .. "/.local/share/mise/shims/ruby-lsp" },
			})

			-- Configurações específicas para Go
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						gofumpt = true,
						analyses = { unusedparams = true, shadow = true },
						staticcheck = true,
						completeUnimported = true,
					},
				},
			})

			-- Ativa todos os servidores
			for _, lsp in ipairs(servers) do
				vim.lsp.enable(lsp)
			end
		end,
	},
}
