-- ** Workman Layout ** --
-- Workman keybindings for vim

-- Website: https://workmanlayout.org
-- Github page: https://github.com/workman-layout/Workman

local function keymap(mode, lhs, rhs, opts)
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

keymap("", "J", "y$", opts)
keymap("", "K", "N", opts)
keymap("", "H", "E", opts)
keymap("", "L", "O", opts)
keymap("", "R", "C", opts)
keymap("", "M", "R", opts)
keymap("", "K", "N", opts)
keymap("", "C", "M", opts)

keymap("", "<C-u>", "<C-u>zz", opts)
keymap("", "<C-d>", "<C-d>zz", opts)

-- Copy and pasting buffers
keymap("", "<leader>j", '"+y', opts)
keymap("", "<leader>p", '"+P', opts)

-- Pasting the previous buffer instead of the current one
keymap("x", "p", '"_dP', opts)

keymap("v", "N", ":m '>+1<CR>gv=gv", opts)
keymap("v", "E", ":m '<-2<CR>gv=gv", opts)

-- Window
keymap("n", "<leader>wn", "<cmd>wincmd j<cr>", { noremap = true, silent = true })
keymap("n", "<leader>we", "<cmd>wincmd k<cr>", { noremap = true, silent = true })
keymap("n", "<leader>wy", "<cmd>wincmd h<cr>", { noremap = true, silent = true })
keymap("n", "<leader>wo", "<cmd>wincmd l<cr>", { noremap = true, silent = true })
keymap("n", "<leader>ws", "<cmd>wincmd s<cr>", { noremap = true, silent = true })
keymap("n", "<leader>wv", "<cmd>wincmd v<cr>", { noremap = true, silent = true })
keymap("n", "<leader>wq", "<cmd>wincmd q<cr>", { noremap = true, silent = true })

-- Go to previous/next buffer
keymap("n", "Y", "<C-o>", { noremap = true, silent = true })
keymap("n", "O", "<C-i>", { noremap = true, silent = true })

----* Plugins section *----
----* Telescope/Fuzzy finder *----
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",  { noremap = true, silent = true })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>",    { noremap = true, silent = true })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",  { noremap = true, silent = true })
keymap("n", "<leader>fq", "<cmd>Telescope quickfix<cr>",   { noremap = true, silent = true })

----* Debugger *----
keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>",            { noremap = true, silent = true })
keymap("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>",                      { noremap = true, silent = true })
keymap("n", "<leader>dc", "<cmd>DapContinue<cr>",                              { noremap = true, silent = true })
keymap("n", "<leader>di", "<cmd>DapStepInto<cr>",                              { noremap = true, silent = true })
keymap("n", "<leader>do", "<cmd>DapStepOut<cr>",                               { noremap = true, silent = true })
keymap("n", "<leader>dv", "<cmd>DapStepOver<cr>",                              { noremap = true, silent = true })
keymap("n", "<leader>ds", "<cmd>DapTerminate<cr>",                             { noremap = true, silent = true })
keymap("n", "<leader>dr", "<cmd>lua require('dapui').open({reset = true})<cr>",{ noremap = true, silent = true })

----* Neotest *----
keymap(
	"n",
	"<leader>dn",
	"<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
	{ noremap = true, silent = true }
)

----* LspSaga *----
keymap("n", "gr", "<cmd>Lspsaga rename<cr>",                { noremap = true, silent = true })
keymap("n", "gx", "<cmd>Lspsaga code_action<cr>",           { noremap = true, silent = true })
keymap("n", "E", "<cmd>Lspsaga hover_doc<cr>",              { noremap = true, silent = true })
keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", { noremap = true, silent = true })
keymap("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<cr>",  { noremap = true, silent = true })
keymap("n", "ge", "<cmd>Lspsaga diagnostic_jump_prev<cr>",  { noremap = true, silent = true })
keymap("n", "gs", "<cmd>Lspsaga signature_help<cr>",        { noremap = true, silent = true })
keymap("n", "gd", "<cmd>Lspsaga peek_definition<cr>",       { noremap = true, silent = true })

----* Nvim-tree *----
keymap("n", "<leader>t", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

----* TreeSJ *----
keymap("n", "<leader>gt", "<cmd>TSJToggle<cr>", { noremap = true, silent = true })

----* Undotree *----
keymap("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { noremap = true, silent = true })

workman = {}

workman.comment_config = {
	extra = {
		above = "gcL",
		below = "gcl",
		eol = "gcA",
	},
}

workman.surround_config = {
	keymaps = {
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "js",
		normal_cur = "jss",
		normal_line = "jS",
		normal_cur_line = "jSS",
		visual = "S",
		visual_line = "gS",
		delete = "ds",
		change = "cs",
	},
}

workman.dapui_config = {
	mappings = {
		edit = "E",
		expand = "<Tab>",
		open = "<CR>",
		remove = "d",
		repl = "R",
		toggle = "t",
	},
}

function workman.nvim_tree_on_attach(bufnr)
	local api = require("nvim-tree.api")
	local keymap = vim.keymap.set
	local event = api.events.Event

	-- enter file on creation
	api.events.subscribe(event.FileCreated, function(file)
		vim.cmd("edit " .. file.fname)
	end)

	-- refresh tree on delete
	api.events.subscribe(event.FileRemoved, function()
		api.tree.reload()
	end)

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	local function open_and_focus()
		api.node.open.edit()
		api.tree.close()
	end

	-- custom mappings
	keymap("n", "<Tab>", api.node.open.preview,         opts("Open Preview"))
	keymap("n", "<CR>",  open_and_focus,                opts("Open: on an existing buffer"))
	keymap("n", "l",     api.node.open.edit,            opts("Open"))
	keymap("n", "`",     api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
	keymap("n", "c",     api.fs.create,                 opts("Create"))
	keymap("n", "d",     api.fs.remove,                 opts("Remove"))
	keymap("n", "x",     api.fs.cut,                    opts("Cut"))
	keymap("n", "J",     api.fs.copy.node,              opts("Copy"))
	keymap("n", "jf",    api.fs.copy.filename,          opts("Copy Filename"))
	keymap("n", "ja",    api.fs.copy.absolute_path,     opts("Copy Absolute Path"))
	keymap("n", "jr",    api.fs.copy.relative_path,     opts("Copy Relative Path"))
	keymap("n", "p",     api.fs.paste,                  opts("Paste"))
	keymap("n", "r",     api.fs.rename,                 opts("Rename"))
	keymap("n", "R",     api.tree.reload,               opts("Refresh"))
end

function workman.null_ls_on_attach(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		local keymap = vim.keymap.set
		vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
		keymap("n", "gq", "<cmd>lua vim.lsp.buf.format({ async = false })<CR>", opts) -- Change gq to your keybinding to format the file
	else
		vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
	end
end

return workman
