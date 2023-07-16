require('gitsigns').setup()

local sign = vim.fn.sign_define

----* LSP Signs *----
sign('DiagnosticSignError', { texthl = 'DiagnosticSignError', text = '', numhl = 'DiagnosticSignError' })
sign('DiagnosticSignWarn', { texthl = 'DiagnosticSignWarn', text = '', numhl = 'DiagnosticSignWarn' })
sign('DiagnosticSignHint', { texthl = 'DiagnosticSignHint', text = '', numhl = 'DiagnosticSignHint' })
sign('DiagnosticSignInfo', { texthl = 'DiagnosticSignInfo', text = '', numhl = 'DiagnosticSignInfo' })


----* Debugger Signs *----
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
