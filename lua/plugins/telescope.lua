return {
	"nvim-telescope/telescope.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden", -- ADICIONADO: busca conteúdo dentro de arquivos ocultos
					"--no-ignore",
					"--glob",
					"!**/.git/*",
					"--glob",
					"!**/node_modules/*",
					"--glob",
					"!**/vendor/*",
				},
				prompt_prefix = "> ",
				selection_caret = "> ",
				entry_prefix = "  ",
				sorting_strategy = "ascending",
			},

			pickers = {
				find_files = {
					-- Isso garante que o buscador de nomes de arquivos mostre os ocultos
					hidden = true,
					-- Opcional: não listar a pasta .git aqui também
					find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*", "--glob", "!**/vendor/*" },
				},
			},
		})
	end,
}
