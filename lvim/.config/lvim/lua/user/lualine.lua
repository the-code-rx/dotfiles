local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.sections.lualine_c = { components.lsp, components.diagnostics }
lvim.builtin.lualine.sections.lualine_x = { components.python_env }
