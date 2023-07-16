-- Sets of autocmds.
local exec = vim.api.nvim_exec
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_autogroup

-- Delete all trailing whitespace at the end of the line and empty lines
exec(
	[[
augroup TrimWhitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END
]],
	false
)

-- Prevents creating comment when you create a newline.
cmd([[autocmd BufEnter * set fo-=c fo-=r fo-=o]])

-- Automatically format a file after write
autocmds = {}
function autocmds.formatting_on_save(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
				vim.lsp.buf.format({ async = false })
			end,
		})
	end
end

return autocmds
