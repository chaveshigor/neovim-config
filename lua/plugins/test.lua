return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-go", -- Adaptador específico para Go
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-go")({
						experimental = {
							test_table = true, -- Suporte a table-driven tests (comum em Go)
						},
						root_files = { "go.mod", ".git" },
						args = { "-v" }, -- Roda com verbose por padrão
					}),
				},

				log_level = vim.log.levels.DEBUG,
			})

			-- Atalhos para rodar os testes (sem debug)
			local neotest = require("neotest")
			vim.keymap.set("n", "<leader>tr", function()
				neotest.run.run()
			end, { desc = "Rodar Teste Próximo" })

			vim.keymap.set("n", "<leader>tf", function()
				neotest.run.run(vim.fn.expand("%"))
			end, { desc = "Rodar Arquivo Atual" })

			vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "Resumo dos Testes" })
			vim.keymap.set("n", "<leader>to", neotest.output.open, { desc = "Ver Saída do Teste" })
		end,
	},
}
