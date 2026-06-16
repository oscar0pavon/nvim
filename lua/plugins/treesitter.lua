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
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-context").setup({
        enable = true, -- Enable this plugin
        max_lines = 3, -- How many lines the window should span
        min_window_height = 0, -- Minimum editor window height to enable context
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if max_lines is exceeded
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
      })
    end
  }

}

