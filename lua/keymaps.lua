local keymap = vim.keymap

-- Tab handling
keymap.set("n", ",,", ":tabnew<CR>", { desc = "New Tab" , silent = true } )
keymap.set("n", "zz", "gT", { desc = "Next Tab" , silent = true } )
keymap.set("n", "mm", "gt", { desc = "Prev Tab" , silent = true } )

-- fzf 
local fzf = require("fzf-lua")
keymap.set("n", ",1", fzf.git_files, { desc = "Project git files" , silent = true } )
keymap.set("n", ",2", fzf.live_grep, { desc = "Search in files on the project" , silent = true } )
keymap.set("n", ",3", fzf.files, { desc = "Show all files in project" , silent = true } )

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }

    -- Go to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, 
      { desc = 'LSP: [G]oto [D]efinition', buffer = event.buf })

    -- Go to declaration (useful in C for header files)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, 
      { desc = 'LSP: [G]oto [D]eclaration', buffer = event.buf })

    -- Show hover in a floating window (already K, but here if you want to remap)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
})
