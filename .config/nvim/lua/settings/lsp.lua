---* Imports *---
local neodev = require("neodev") -- Neodev should come first before lspconfig
local mason = require("mason")
local mason_lsp_package = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local fidget = require("fidget")
local null_ls = require("null-ls")
local workman = require("workman")
-- Uncomment this if you want format on save
-- local autocmd = require("settings/autocmds")
-- local dap_vscode_js = require("dap-vscode-js")
local debugger = require("dap")
local debugger_ui = require("dapui")
local lspsaga = require("lspsaga")
local neotest = require("neotest")

---* Main LSP Server Configuration *---

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		-- Create your keybindings here...
	end,
})

local mason_lspconfig = {
	ensure_installed = {
		-- Replace these with whatever servers you want to install
		-- LSP
		"bashls",
		"clangd",
		"jsonls",
		"lua_ls",
		"pyright",
		"rust_analyzer",
		"r_language_server",
		"tsserver",
		"typst_lsp",
		"marksman",
	},
	automatic_installation = true,
}

local handler = {
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = lsp_capabilities,
		})
	end,
	-- lspconfig['eslint'].setup({
	--   capabilities = lsp_capabilities,
	--   settings = {
	--     nodePath = os.getenv("HOME")..'./local/share/nvim/mason/packages/eslint/node_modules'
	--   }
	-- })
}

---* Visual loading screen w/ fidget *---
local fidget_config = {
	text = {
		spinner = "meter",
		commenced = "Initialized",
	},
	align = {
		bottom = false,
		top = true,
		right = true,
	},
	window = {
		blend = 100,
	},
}

---* Linting & Formatting *---
local formatter = null_ls.builtins.formatting
local linter = null_ls.builtins.diagnostics

local lint_config = {
	-- Uncomment this down below if you want format on save
	-- on_attach = autocmd.formatting_on_save,
	on_attach = workman.null_ls_on_attach,
	debug = false,
	ensure_installed = {
		-- Linters
		"pyre", -- Yes ik ik, proprietary facebook is here ._.
		"selene",
		"shellcheck",

		-- Formatter
		"beautysh",
		"black",
		"clangformat",
		"prettierd",
		"stylua",
	},
	sources = {
		linter.selene,
		-- linter.shellcheck,
		linter.editorconfig_checker,
    formatter.mdformat,
		formatter.black,
		-- formatter.shfmt.with({ extra_args = { "-ci", "-bn" } }),
    formatter.shellharden,
		formatter.prettierd,
		formatter.stylua,
	},
}

---* Debugging *---

debugger.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		args = {
			"/home/sheape/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
			"${port}",
		},
	},
}

for _, language in ipairs({ "typescript", "javascript " }) do
	debugger.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
	}
end

local debugger_ui_config = {
	mappings = workman.dapui_config.mappings,
}

----* Neotest *----
local neotest_config = {
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "custom.jest.config.ts",
			env = { CI = true },
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),
	},
}

----* Lspsaga *----
local lspsaga_config = {
	ui = {
		devicon = true,
		kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
	},
}

neodev.setup()
mason.setup()
mason_lsp_package.setup(mason_lspconfig)
mason_lsp_package.setup_handlers(handler)
lspsaga.setup(lspsaga_config)
fidget.setup(fidget_config)
null_ls.setup(lint_config)
-- dap_vscode_js.setup(vscode_js_config)
debugger_ui.setup(debugger_ui_config)
neotest.setup(neotest_config)
