local keymap = vim.keymap

-- Tab handling
keymap.set("n", ",,", ":tabnew<CR>", { desc = "New Tab" , silent = true } )
keymap.set("n", "zz", "gT", { desc = "Next Tab" , silent = true } )
keymap.set("n", "mm", "gt", { desc = "Prev Tab" , silent = true } )
