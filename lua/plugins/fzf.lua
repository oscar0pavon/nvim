return {
  {
    "ibhagwan/fzf-lua",
    -- optional: load only when you call a command
    cmd = "FzfLua",
    config = function()
      -- calling setup is optional for default settings
      require("fzf-lua").setup({
        -- you can customize the window look here
	defaults = {
        file_icons = false,
        git_icons = false,
	},
        winopts = {
          height = 0.85,
          width = 0.80,
          preview = { layout = "vertical" },
        },
      })
    end,
  },
}

