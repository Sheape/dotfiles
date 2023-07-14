-- Plugins config
require("settings/lualine")
require("settings/plugins")
require("settings/gitsigns")
require("settings/neorg")
-- require("settings/formatting")


-- Remove highlight when searching
vim.o.hlsearch = false

-- Tab indentation / Side stuff
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.wo.signcolumn = "yes"

-- Relative number and nu
vim.wo.relativenumber = true
vim.o.number = true

-- No wrapping for consistent relative number
vim.wo.wrap = false

-- Make unused buffer hidden or persistent until vim is closed
vim.o.hidden = true

-- Storage
vim.o.swapfile = false
vim.o.undodir = "/home/sheape/.cache/nvim/undo"
vim.bo.undofile = true

-- Movements
vim.o.scrolloff = 6
vim.wo.scrolloff = 6
