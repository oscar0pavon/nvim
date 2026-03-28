
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/site")

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end


vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

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


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc", "objcpp" },
  callback = function()
    vim.lsp.enable("clangd")
  end,
})

local function clangd_switch_source_header()
local bufnr = vim.api.nvim_get_current_buf()
local params = { uri = vim.uri_from_bufnr(bufnr) }
vim.lsp.buf_request(bufnr, 'textDocument/switchSourceHeader', params, function(err, result)
if err then vim.notify("LSP Error: " .. tostring(err), vim.log.levels.ERROR) return end
    if not result then vim.notify("Matching file not found", vim.log.levels.WARN) return end
        vim.api.nvim_command("edit " .. vim.uri_to_fname(result))
    end)
end

 -- Map Ctrl+a to this function
vim.keymap.set('n', '<C-a>', clangd_switch_source_header, { desc = 'Switch Source/Header' })

vim.opt.clipboard = "unnamedplus"

