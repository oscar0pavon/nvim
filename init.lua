
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("options")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- This imports everything in the lua/plugins/ directory
    { import = "plugins" },
  },
  -- Configure any other settings here
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
})

require("keymaps")

local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Enable clangd using the new built-in config system
vim.lsp.config('clangd', {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  capabilities = capabilities,
  root_markers = { ".git", "compile_commands.json", "compile_flags.txt" },
})

-- Start the server for the current buffer
vim.lsp.enable('clangd')
