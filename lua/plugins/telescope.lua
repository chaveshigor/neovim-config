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
					"--hidden",
					"--no-ignore",
					"--glob", "!**/.git/*",
					"--glob", "!**/node_modules/*",
					"--glob", "!**/vendor/*",
					"--glob", "!**/.cache/*",
					"--glob", "!**/.npm/*",
					"--glob", "!**/.cargo/*",
					"--glob", "!**/.rbenv/*",
					"--glob", "!**/.local/share/*",
				},
				prompt_prefix = "> ",
				selection_caret = "> ",
				entry_prefix = "  ",
				sorting_strategy = "ascending",
			},

			pickers = {
				find_files = {
					hidden = true,
					find_command = { "rg", "--files", "--hidden", "--no-ignore",
						"--glob", "!**/.git/*",
						"--glob", "!**/node_modules/*",
						"--glob", "!**/vendor/*",
						"--glob", "!**/.cache/*",
						"--glob", "!**/.npm/*",
						"--glob", "!**/.cargo/*",
						"--glob", "!**/.rbenv/*",
						"--glob", "!**/.local/share/*",
					},
				},
			},
		})
	end,
}
