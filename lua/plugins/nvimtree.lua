return {
	"nvim-tree/nvim-tree.lua",
	requires = { "nvim-tree/nvim-web-devicons" }, -- Ícones
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			hijack_netrw = false,
			view = {
				width = 30, -- Largura da janela do NvimTree
				side = "left", -- Posição (left ou right)
			},
			filters = {
				git_ignored = false,
				dotfiles = false, -- Exibir arquivos ocultos
			},
		})
	end,
}
