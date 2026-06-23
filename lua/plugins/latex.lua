-- ~/.config/nvim/lua/plugins/vimtex.lua
return {
  "lervag/vimtex",
  lazy = false, -- VimTeX recommends not lazy-loading
  init = function()
    -- Use Zathura as the PDF viewer
    vim.g.vimtex_view_method = "zathura"

    -- Set latexmk as the default compiler engine
    vim.g.vimtex_compiler_method = "latexmk"

    -- Configure compiler options (enable SyncTeX for backward/forward search)
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "build", -- Keeps your project root clean from auxiliary files
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
      },
    }
  end
}
