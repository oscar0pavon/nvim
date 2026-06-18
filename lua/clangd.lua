
local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "h", "cpp", "objc", "objcpp" },
  callback = function()
    vim.lsp.enable("clangd")
    vim.treesitter.start()
  end,
})


-- Enable clangd using the new built-in config system
vim.lsp.config('clangd', {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  capabilities = capabilities,
  root_markers = { ".git", "compile_commands.json", "compile_flags.txt" },
})

function clangd_switch_source_header()
local bufnr = vim.api.nvim_get_current_buf()
local params = { uri = vim.uri_from_bufnr(bufnr) }
vim.lsp.buf_request(bufnr, 'textDocument/switchSourceHeader', params, function(err, result)
if err then vim.notify("LSP Error: " .. tostring(err), vim.log.levels.ERROR) return end
    if not result then vim.notify("Matching file not found", vim.log.levels.WARN) return end
        vim.api.nvim_command("edit " .. vim.uri_to_fname(result))
    end)
end


vim.keymap.set('n', '<C-a>', clangd_switch_source_header, { desc = 'Switch Source/Header' })
