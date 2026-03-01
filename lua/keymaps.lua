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
