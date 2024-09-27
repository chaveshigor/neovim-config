-- Autocomandos
--vim.cmd([[
--  augroup FormatOnSave
--    autocmd!
--    autocmd BufWritePost *.lua,*.py,*.rb lua vim.lsp.buf.formatting_sync(nil, 100)
--  augroup END
--]])

