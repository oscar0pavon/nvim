local opt = vim.opt

opt.number = true

opt.tabstop = 4      -- Number of spaces a <Tab> in the file counts for
opt.shiftwidth = 4   -- Number of spaces to use for each step of (auto)indent
opt.expandtab = true -- Use spaces instead of tabs
opt.softtabstop = 4  -- Number of spaces a <Tab> counts for while editing


vim.opt.smartindent = true   -- Insert indents automatically in C-style code
vim.opt.autoindent = true    -- Copy indent from current line when starting a new one
vim.opt.wrap = false         -- Don't wrap long lines (better for reading C logic)

vim.opt.ignorecase = true    -- Ignore case in search patterns
vim.opt.smartcase = true     -- ...unless the search has a capital letter
vim.opt.incsearch = true     -- Show search results as you type
vim.opt.hlsearch = false     -- Hide highlight after search (keeps screen clean)

vim.opt.termguicolors = true -- Enable 24-bit RGB colors for OneDark
vim.opt.signcolumn = "yes"   -- Always show the column for LSP errors/warnings
vim.opt.updatetime = 250     -- Faster completion and hover displays (standard is 4000ms)
vim.opt.scrolloff = 8        -- Keep 8 lines above/below cursor (don't let cursor hit top/bottom)
vim.opt.colorcolumn = "80"   -- Visual guide to keep C lines under 80 chars

vim.opt.undofile = true      -- Save undo history to a file
vim.opt.swapfile = false     -- Don't create annoying .swp files
vim.opt.backup = false       -- Don't create backup files

