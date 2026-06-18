
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/site")

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

require("options")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- This imports everything in the lua/plugins/ directory
    { import = "plugins" },
    { "nvim-lua/plenary.nvim" }
  },
  -- Configure any other settings here
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
})

require("keymaps")


vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    source = "if_many", -- Shows 'clangd' only if multiple sources exist
    prefix = '●',       -- Custom icon anchor for the hint
  },
  severity_sort = true, -- Always show errors before warnings
})

require("clangd")

vim.filetype.add({
  extension = {
    h = 'c',
  },
})

vim.filetype.add({
  extension = {
    s = "fasm", -- Replace "asm" with "nasm", "gas", "mips", etc. if needed
  },
})



