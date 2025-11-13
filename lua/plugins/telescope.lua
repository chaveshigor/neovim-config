return {
  'nvim-telescope/telescope.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup{
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--no-ignore',
          '--hidden',
          '--glob',
          '!.git/',
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        file_ignore_patterns = { "%.log$", "node_modules" },
      }
    }
  end
}


