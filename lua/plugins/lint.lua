return {
  {
    'esmuellert/nvim-eslint',
    config = function()
      require('nvim-eslint').setup({
        bin = "eslint_d",
        diagnostics_trigger = "BufWritePost", -- roda ao salvar
        working_dir = { mode = "auto" },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "eslint_d" },
        go = { "goimports", "gofmt" }
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true
      },
    },
  }
}
