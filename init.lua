
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
