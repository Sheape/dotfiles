local workman = require("workman")
local comment = require("Comment")
local align = require("mini.align")
local surround = require("nvim-surround")
local treesj = require('treesj')
local todo_comments = require('todo-comments.config')

local keybindings = {
	toggler = {
		line = "gcc",
		block = "gcm",
	},

	op = {
		line = "gc",
		block = "gm",
	},

	-- NOTE: Will be overriden by workman
	extra = {
		-- Add a comment below/above.
		above = "gcO",
		below = "gco",
		-- Add a comment at the end of the line.
		eol = "gcA",
	},
}

local todo_comments_config = {}

local comment_config = {
	padding = true,
	toggler = keybindings.toggler,
	opleader = keybindings.op,
	extra = workman.comment_config.extra, -- Change to keybindings.extra if you want qwerty

	mappings = {
		-- opleader and toggler
		basic = true,
		-- Enables/disables extra
		extra = true,
		extended = false,
	},
}

local align_config = {}
local surround_config = {
	keymaps = workman.surround_config.keymaps
}

local treesj_config = {
  use_default_keymaps = false,
  langs = {typescript = {}}
}

comment.setup(comment_config)
surround.setup(surround_config)
align.setup(align_config)
treesj.setup(treesj_config)
todo_comments.setup(todo_comments_config);
