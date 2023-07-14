-- ** Workman Layout ** --
-- Workman keybindings for vim

-- Website: https://workmanlayout.org
-- Github page: https://github.com/workman-layout/Workman

function keymap(mode, lhs, rhs, opts)
  return vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Movements
local opts = { noremap = true }

keymap("", "n", "j", opts)
keymap("", "e", "k", opts)
keymap("", "y", "h", opts)
keymap("", "o", "l", opts)

keymap("", "j", "y", opts)
keymap("", "k", "n", opts)
keymap("", "h", "e", opts)
keymap("", "l", "o", opts)
keymap("", "r", "c", opts)
keymap("", "m", "r", opts)
keymap("", "k", "n", opts)
keymap("", "c", "m", opts)

keymap("", "N", "J", opts)
keymap("", "E", "K", opts)
keymap("", "Y", "H", opts)
keymap("", "O", "L", opts)

keymap("", "J", "Y", opts)
keymap("", "K", "N", opts)
keymap("", "H", "E", opts)
keymap("", "L", "O", opts)
keymap("", "R", "C", opts)
keymap("", "M", "R", opts)
keymap("", "K", "N", opts)
keymap("", "C", "M", opts)

-- Window
keymap("n", "<c-w>n", ":wincmd j<cr>", { noremap = true, silent = true })
keymap("n", "<c-w>e", ":wincmd k<cr>", { noremap = true, silent = true })
keymap("n", "<c-w>y", ":wincmd h<cr>", { noremap = true, silent = true })
keymap("n", "<c-w>o", ":wincmd l<cr>", { noremap = true, silent = true })
keymap("n", "<c-w>k", ":wincmd n<cr>", { noremap = true, silent = true })
keymap("n", "<c-w>l", ":wincmd o<cr>", { noremap = true, silent = true })
