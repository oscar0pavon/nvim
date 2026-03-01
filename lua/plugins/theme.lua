return {
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- Load this first
    config = function()
      require("onedark").setup({
        -- Choose your flavor: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
        style = "darker", 
        transparent = false, -- Set to true if you want a transparent background
        term_colors = true,
        ending_tildes = false, -- Show the ~ characters at the end of the buffer
      })
      require("onedark").load()
    end,
  },
}
