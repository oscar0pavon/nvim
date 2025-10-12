local M = {}

function M.hello_world()
  print("Hello world plugin")
end

local function create_terminal()

    local launch_buffer = vim.api.nvim_create_buf(false, true)
    --local chan = vim.api.nvim_open_term(launch_buffer, {})
    vim.api.nvim_buf_set_option(launch_buffer, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(launch_buffer, 'buflisted', false)
    vim.api.nvim_buf_set_option(launch_buffer, 'swapfile', false)
    vim.api.nvim_buf_set_option(launch_buffer, 'modifiable', false)
    vim.api.nvim_buf_set_option(launch_buffer,"number",false)
    --vim.api.nvim_chan_send(chan,result.stdout)

    local win = vim.api.nvim_open_win(launch_buffer, true, {
        relative = "editor",
        width = 80,
        height = 15,
        row = vim.api.nvim_get_option("lines") - 10,
        col = 5,
        border = "single",
    })
    
  vim.api.nvim_win_set_option(win, "winblend", 0)

  return launch_buffer


end

local function launch()

  local launch_buffer = create_terminal()

  local program_out = vim.loop.new_pipe(false)


  local lines = {}


  local get_data = vim.schedule_wrap(function(error,data)
    if data then
      print("data") 
      for _, line in ipairs(vim.split(data,'\n')) do
        table.insert(lines,line)
      end
    end

      vim.api.nvim_buf_set_option(launch_buffer, 'modifiable', true)
      vim.api.nvim_buf_set_lines(launch_buffer, 0 , -1, false, lines)
      local last_line_number = vim.api.nvim_buf_line_count(launch_buffer)

-- Remove the last line
      vim.api.nvim_buf_set_lines(launch_buffer, 
        last_line_number - 1, last_line_number, true, {})

      vim.api.nvim_buf_set_option(launch_buffer, 'modifiable', false)


  end)

    local handle = vim.loop.spawn("unbuffer", {
      args = { "/root/prufus/prufus" },
    stdio = { nil, program_out, nil } },
    function(code)
      if code == 0 then
       print("Executed successfully")
      else
      print("Error")
      end
    end)

    vim.loop.read_start(program_out,get_data)

end


function M.build()
  print("building...") 

  local result = vim.system({"make"}, {text = true}):wait()

  if result.code == 2 then

    local buf = vim.api.nvim_create_buf(false, true)
    local chan = vim.api.nvim_open_term(buf, {})
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = 80,
        height = 20,
        row = 5,
        col = 5,
        border = "single",
    })
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(buf,"number",false)
    vim.api.nvim_chan_send(chan,result.stderr)
    vim.api.nvim_win_set_option(win, "winblend", 0)

    print("build failed")

  end

  if result.code == 0 then
    launch()
    print("build success")

  end

end

function M.create_command()
  vim.api.nvim_create_user_command(
    "Build",
    function()
      build()
    end,
    {}
    )
end

return M
