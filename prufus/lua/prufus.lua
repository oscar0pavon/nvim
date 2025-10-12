local M = {}

function M.hello_world()
  print("Hello world plugin")
end

function launch()
    local handle = vim.loop.spawn("./prufus", { args = { nil }, stdio = { nil, nil, nill } }, function(code)
    if code == 0 then
      print("Executed successfully")
    else
      print("Error")
    end
  end)
end

local function handle_make_result(result)
  if result.code == 0 then
    print("Make command succeeded!")
    launch()
  else
    print("Make command failed with exit code: " .. result.code)

    --io.write(result.stdout .. "\n")
    return
    -- You can also access stdout/stderr from result.stdout and result.stderr
  end
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
