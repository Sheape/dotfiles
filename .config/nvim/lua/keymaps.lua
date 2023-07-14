-- ** Keymaps ** --

-- General keymaps for both plugins and
-- vim without the need of modifying
-- through workman layout.

-- local opts = { noremap = true }

function keymap(mode, lhs, rhs, opts)
  return vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Remapping Leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yanking whole buffer
keymap("n", "<leader>ya", ":%y<cr>", { noremap = false, silent = true })
