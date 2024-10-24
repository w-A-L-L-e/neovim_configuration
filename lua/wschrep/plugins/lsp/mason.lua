return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      -- https://github.com/williamboman/mason-lspconfig.nvim
      ensure_installed = {
        "html",
        "cssls",
        "volar", -- vue
        "tsserver", -- we want volar to take this over for both vue and typescript
        "lua_ls",
        "graphql",
        "emmet_ls",
        "pyright", -- python
        "rubocop",
        "clangd", -- c++
        -- "svelte",
        -- "java-language-server"
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d", -- js linter
        "isort", -- python formatter
        "ruff", -- python linter (faster and replaces black+pylint)
        -- "black", -- python formatter
        -- "pylint", -- python linter
      },
    })
  end,
}
