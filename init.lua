
local vimrc = vim.fn.stdpath("config") .. "/nvimconfig.vim"
vim.cmd.source(vimrc)

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

if file_exists('project.godot') then
  vim.fn.serverstart './godothost'
  local main_file = vim.fn.getcwd() .. '/source_code/main.gd'
  if main_file then
    --vim.cmd('e' .. main_file)
  end
  --local pavon_godot_config = vim.fn.stdpath("config") .. "/gdev/plugin/pavon_godot.lua"
  --vim.cmd.source(pavon_godot_config)
end


local prufus = require('prufus')

prufus.create_command()

vim.keymap.set('n', '<C-s>', ":w<CR>", {noremap = true, silent = true, desc = "Save file"})
vim.keymap.set('n', '<M-e>', prufus.build)



require('nvim-treesitter.configs').setup {
  -- ... other nvim-treesitter configurations ...
  context_commentstring = {
    enable = true,
    enable_autocmd = false, -- Set to true to automatically update commentstring on filetype change
  },
  context = {
    enable = true,
    throttle = true, -- Throttle context updates for performance
    max_lines = 0, -- 0 means unlimited lines of context
    patterns = {
      -- Customize patterns for C if needed, otherwise default patterns are used
      -- For example, to show function definitions, loops, etc.
      c = {
        'function_definition',
        'for_statement',
        'while_statement',
        'if_statement',
        'struct_specifier',
        'union_specifier',
        'enum_specifier',
      },
    },
    separator = "─", -- Character to use as a separator
    zindex = 20, -- Z-index for the floating window
    -- Options for highlighting
    highlight = {
      enable = true,
      -- You can link TreesitterContext to a specific highlight group
      -- For example, to link it to NormalFloat:
      -- TreesitterContext = "NormalFloat",
      -- TreesitterContextLineNumber = "LineNr",
      -- TreesitterContextSeparator = "FloatBorder",
    },
  },
}
