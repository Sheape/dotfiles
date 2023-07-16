-- ** Keymaps ** --

-- General keymaps for both plugins and vim without the need of modifying
-- through workman layout.

-- local opts = { noremap = true }

local pdfviewer = "zathura" -- Change your pdfviewer here.
local docout = "%:p:r" .. ".pdf"
local term = "st" -- Terminal emulator

function keymap(mode, lhs, rhs, opts)
  return vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Remapping Leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yanking whole buffer
-- keymap("n", "<leader>ya", ":%y<cr>", { noremap = false, silent = true })

-- make sure to have your Makefile in that directory :D
keymap("n", "<leader>cc", ":make<cr>", {})

-- A very complicated but automated way of compiling and opening the
-- compiled document if it's not open.
-- Particularly for neatroff (however this could work with any groff or even
-- latex so long as you have a Makefile for them.)
keymap("n", "<leader>cd", ":!make clean && make; pgrep -a " .. pdfviewer ..
" | grep " .. docout .. " || " .. term .. " -e " .. pdfviewer .. " " .. docout ..
"& <CR>", {})

