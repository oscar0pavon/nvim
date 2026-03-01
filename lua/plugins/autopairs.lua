return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- Use Treesitter to check for pairs
        ts_config = {
          lua = { "string" }, -- Don't add pairs in lua string nodes
          c = { "string", "comment" }, -- Don't autopair inside C comments
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
          map = "<M-e>", -- Alt-e to wrap a word in pairs quickly
        },
      })
    end,
  },
}
