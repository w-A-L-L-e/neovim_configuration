-- pin versions used during install for nvim to work goodd when switching envs
vim.g.python3_host_prog = "/home/wschrep/.pyenv/bin/python"

-- auto detect for nodejs is working fine (no pin needed)
-- vim.g.node_host_prog = "/home/wschrep/.nvm/versions/node/v18.20.3/bin/node"

-- disable perl provider so that :checkhealth does not give errors
vim.g.loaded_perl_provider = 0

-- enable these possibly if you only have 16 colors
-- vim.opt.termguicolors = true
-- vim.opt.cursorlineopt = "number"

-- load all other plugins now
-- to reset/reinstall entire environment just remove ~/.local/share/nvim
require("wschrep.core")
require("wschrep.lazy")

-- Disable ESLint LSP server and hide virtual text in Neovim
-- Add this to your init.lua or init.vim file
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible,
  })
end)
