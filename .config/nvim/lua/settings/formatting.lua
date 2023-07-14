-- Auto-compiling with groff
vim.api.nvim_exec([[
augroup groffcomp
    autocmd!
    autocmd BufWritePost *.ms !
augroup END
]], true)
