return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- The new way: call setup directly on the main module
      require("nvim-treesitter").setup({
        -- 1. Languages you want
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown" },
        
        sync_install = false, 
        auto_install = true,  -- This is the "magic" line for scratch configs
        -- 2. Enable the high-performance highlighting
        highlight = { 
          enable = true, 
        },

        -- 3. Better indentation for C code
        indent = { enable = true },
      })
    end,
  },
}

