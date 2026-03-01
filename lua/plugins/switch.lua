return {
  "jakemason/ouroboros.nvim",
  ft = { "c", "cpp", "h", "hpp" },
  config = function()
    require("ouroboros").setup({
      -- Optional: customize which extensions are preferred
      extension_preferences_table = {
        c = { h = 2, hpp = 1 },
        h = { c = 2, cpp = 1 },
      },
    })
  end,
  -- Keybindings to trigger the switch
  keys = {
    { "<C-a>", "<cmd>Ouroboros<cr>", desc = "Switch Source/Header" },
  },
}
