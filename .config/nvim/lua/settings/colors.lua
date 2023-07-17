local colorizer = require('colorizer')
local catppuccin = require('catppuccin')

local exclude = {
  '*',
  '!vim',
}

local catppuccin_config = {
  flavour = 'mocha',
  transparent_background = true,
  dim_inactive = {
    enabled = false,
    shade = 'dark',
    percentage = 0.20
  },
  custom_highlights = function(colors)
    return {
      Normal = { bg = colors.base, ctermbg = 'none' },
      IndentBlanklineIndent1 = { fg = colors.surface0 }
      -- Comment = { fg = colors. }
    }
  end,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    fidget = true,
		mason = true,
		treesitter = true,
		lsp_saga = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		dap = {
			enabled = true,
			enable_ui = true
		}
  }
}

colorizer.setup(exclude)
catppuccin.setup(catppuccin_config)
