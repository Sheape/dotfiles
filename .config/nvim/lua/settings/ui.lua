local indent = require('indent_blankline')
local nvim_tree = require('nvim-tree')
local lualine = require('lualine')
local keybinding = require('workman')

----* Indent Blankline *----
local indent_config = {
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = {
    "IndentBlanklineIndent1",
  },
}

vim.g.indent_blankline_show_first_indent_level = false

----* Undo Tree *----
vim.g.undotree_WindowLayout = 2

----* Nvim-Tree (File Manager) *----
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
local nvim_tree_config = {
	on_attach = keybinding.nvim_tree_on_attach,
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

nvim_tree.setup(nvim_tree_config)

----* Lualine *----

local colors = {
	red = '#cdd6f4',
	grey = '#181825',
	black = '#1e1e2e',
	white = '#313244',
	light_green = '#6c7086',
	orange = '#fab387',
	green = '#a6e3a1',
	blue = '#80A7EA',
}

local theme = {
	normal = {
		a = { fg = colors.black, bg = colors.blue },
		b = { fg = colors.blue, bg = colors.white },
		c = { fg = colors.white, bg = colors.black },
		z = { fg = colors.white, bg = colors.black },
	},
	insert = { a = { fg = colors.black, bg = colors.orange } },
	visual = { a = { fg = colors.black, bg = colors.green } },
	replace = { a = { fg = colors.black, bg = colors.green } },
}

local vim_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = { bg = "#313244", fg = "#80A7EA" },
}

local space = {
	function()
		return " "
	end,
	color = { bg = colors.black, fg = "#80A7EA" },
}

local filename = {
	'filename',
	color = { bg = "#80A7EA", fg = "#242735" },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = "#313244" },
	separator = { left = "", right = "" },
}

local filetype_tab = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = "#313244" },
}

local branch = {
	'branch',
	color = { bg = "#a6e3a1", fg = "#313244" },
	separator = { left = "", right = "" },
}

local diff = {
	"diff",
	color = { bg = "#313244", fg = "#313244" },
	separator = { left = "", right = "" },
}

local modes = {
	'mode', fmt = function(str) return str:sub(1, 1) end,
	color = { bg = "#fab387		", fg = "#1e1e2e" },
	separator = { left = "", right = "" },
}

local function getLspName()
	local msg = 'No Active Lsp'
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return "  " .. client.name
		end
	end
	return "  " .. msg
end

local dia = {
	'diagnostics',
	color = { bg = "#313244", fg = "#80A7EA" },
	separator = { left = "", right = "" },
}

local lsp = {
	function()
		return getLspName()
	end,
	separator = { left = "", right = "" },
	color = { bg = "#f38ba8", fg = "#1e1e2e" },
}

local lualine_config = {

	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			winbar = 1000,
		}
	},

	sections = {
		lualine_a = {
			--{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
			modes,
			vim_icons,
			--{ 'mode', fmt = function(str) return str:sub(1, 1) end },
		},
		lualine_b = {
			space,

		},
		lualine_c = {

			filename,
			filetype,
			space,
			branch,
			diff,
		},
		lualine_x = {
			space,
		},
		lualine_y = {
		},
		lualine_z = {
			dia,
			lsp,
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	winbar = {},
	inactive_winbar = {},
}

nvim_tree.setup(nvim_tree_config)
lualine.setup(lualine_config)
indent.setup(indent_config)
