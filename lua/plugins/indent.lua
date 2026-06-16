return {
  {
    "saghen/blink.indent",
    event = "BufReadPost",
    opts = {
      -- Global settings
      char = "│", 
      
      -- C-specific configuration overrides
      filetypes = {
        c = {
          -- Uses listchars.space settings for static whitespace characters
          char = "│",
        },
        cpp = {
          char = "│",
        }
      }
    },
    config = function(_, opts)
      require("blink.indent").setup(opts)
    end,
  }
}

