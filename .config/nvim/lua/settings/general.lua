vim.o.termguicolors = true

-- Plugins config
require("settings/lsp")
require("settings/fzf")
require("settings/treesitter")
require("settings/completion")
require("settings/autocmds")
require("settings/utils")
require("settings/colors")
require("settings/ui")
require("settings/signs") -- Signs must be last

-- Remove highlight when searching
vim.o.hlsearch = false

-- Tab indentation / Side stuff
vim.bo.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.softtabstop = 4
vim.g.shiftwidth = 4
vim.g.expandtab = true
vim.bo.smartindent = true
vim.wo.signcolumn = "yes"

-- Relative number and nu
vim.wo.relativenumber = false -- BUG: Set this to true when neovide#1634 got fixed.
vim.o.number = true

-- No wrapping for consistent relative number
vim.wo.wrap = true

-- Make unused buffer hidden or persistent until vim is closed
vim.o.hidden = true

-- Storage
vim.o.swapfile = false
--local HOME = ":!echo $HOME"
vim.o.undodir = "/home/sheape/.cache/nvim/undo"
vim.bo.undofile = true

-- Movements
vim.o.scrolloff = 6
vim.wo.scrolloff = 6

-- For autocompletion with nvim-cmp
vim.o.completeopt = "menu,menuone,noselect"

-- Sets the limit of characters per line and a visible aligner
vim.o.colorcolumn = "80"
vim.bo.textwidth = 80

-- Colorscheme and fonts
-- vim.o.termguicolors = true
vim.api.nvim_command "colorscheme catppuccin-mocha"
-- vim.g.aqua_bold = 1
-- vim.g.aqua_transparency = 1
-- vim.g.aquarium_style = "dark"

-- For neovide/gui options
vim.o.guifont = "JetBrainsMono Nerd Font:h14:w14"
vim.g.neovide_transparency = 0.8
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_animation_length = 0.07
vim.g.neovide_floating_blur_amount_x = 0.0
vim.g.neovide_floating_blur_amount_y = 0.0

-- For python plugins (idk why anyone would do this)
-- vim.g.python_host_prog = '/usr/bin/python2'
-- vim.g.python3_host_prog = '/usr/bin/python'
-- vim.cmd([[
-- let g:python_host_prog = "/usr/bin/python2"
-- let g:python3_host_prog = "/usr/bin/python"
-- ]])

-- Adjusts the color of the comments to have a little more contrast.
-- Also removes background for opacity and blur to kick in.
-- All highlights must be defined here.
vim.cmd([[
hi Normal guibg=#20202a ctermbg=none
hi LineNr guibg=none ctermbg=none
hi Folded guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none
hi SpecialKey guibg=none ctermbg=none
hi VertSplit guibg=none ctermbg=none
hi SignColumn guibg=none ctermbg=none
hi EndOfBuffer guibg=none ctermbg=none
hi Comment guifg=#4C5369
hi DiagnosticError ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=#EBB9B9
hi DiagnosticWarn ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#E6DFB8
hi DiagnosticInfo ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#B8DEEB
hi DiagnosticHint ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#B1DBA4
hi IndentBlanklineIndent1 guifg=#313449
]]
)
