return {
  {
    "Saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = {
        preset = 'none', -- We will define our own for clarity
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        
        -- Use Enter to confirm the selection
        ['<CR>'] = { 'accept', 'fallback' },

        -- Use Tab to cycle through the list
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },

        -- Scroll documentation window
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      },
      completion = {
        menu = { auto_show = true },
        ghost_text = { enabled = true }, -- Shows a "preview" of the code
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },
}


