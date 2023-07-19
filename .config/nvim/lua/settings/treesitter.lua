local neorg = require('neorg')
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

local config = {
  load = {
    ["core.defaults"] = {},
    ["core.presenter"] = {
      config = {
				zen_mode = "truezen"
      },
    },
    ["core.export.markdown"] = {
      config = {
        extensions = "all",
      }
    },
    ["core.integrations.treesitter"] = {},
    ["core.concealer"] = {
      config = {
        heading = {
          enabled = true,
          level_1 = {
            enabled = true,
            icon = "◉",
          },
          level_2 = {
            enabled = true,
            icon = "●",
          },
          level_3 = {
            enabled = true,
            icon = "○",
          },
          level_4 = {
            enabled = true,
            icon = "◈",
          },
          level_5 = {
            enabled = true,
            icon = "◆",
          },
          level_6 = {
            enabled = true,
            icon = "◇",
          },
        },
        list = {
          enabled = true,
          level_1 = {
            enabled = true,
            icon = "⟶",
          },
          level_2 = {
            enabled = true,
            icon = "↠",
          },
          level_3 = {
            enabled = true,
            icon = "⟶",
          },
          level_4 = {
            enabled = true,
            icon = "↠",
          },
          level_5 = {
            enabled = true,
            icon = "⟶",
          },
          level_6 = {
            enabled = true,
            icon = "↠",
          },
        },
      }
    }
  }
}

-- parser_configs.norg_meta = {
--   install_info = {
--     url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
--     files = { "src/parser.c" },
--     branch = "main"
--   }
-- }
--
-- parser_configs.norg_table = {
--   install_info = {
--     url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
--     files = { "src/parser.c" },
--     branch = "main"
--   }
-- }

require'nvim-treesitter.configs'.setup({
  ensure_installed = { "norg",
  "norg_meta",
  "norg_table",
  -- "cpp",
  "bash",
  -- "r",
  "rust",
  "lua",
  "json",
  "typescript",
  "javascript",
  "toml",
}, highlight = {
  enable = true,
}})

neorg.setup(config)
