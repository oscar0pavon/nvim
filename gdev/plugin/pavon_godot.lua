local luasnip = require 'luasnip'
local cmp = require 'cmp'

luasnip.config.setup()


cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end, 
  },
  mapping = cmp.mapping.preset.insert {
     ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }, 
  },
  sources = {
     { name = 'nvim_lsp' },
     { name = 'luasnip' }
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force',
  capabilities, require('cmp_nvim_lsp').default_capabilities())
capabilities = require('cmp_nvim_lsp').default_capabilities()
--capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

require('lspconfig').gdscript.setup(capabilities)

-- require('nvim-treesitter.configs').setup {
--   indent = { enable = false }
-- }

vim.cmd('LspStart')

local dap = require 'dap'
dap.adapters.godot = {
  type = "server",
  host = '127.0.0.1',
  port = 6006, 
}

dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
  }
}


local buffer_options = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buffer_options)


vim.keymap.set('n', '<F1>', dap.continue)
vim.keymap.set('n', '<F2>', dap.restart)
vim.keymap.set('n', '<F3>', dap.terminate)
