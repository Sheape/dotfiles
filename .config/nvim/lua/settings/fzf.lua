local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
-- local workman = require("workman")

local vimgrep_args = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_args, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_args, "--glob")
table.insert(vimgrep_args, "!**/.git/*")

local telescope_config = {
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_args,
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
}

telescope.setup(telescope_config)
