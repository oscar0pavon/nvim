if empty(glob('~/.config/nvim/autoload/plug.vim'))
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/autoload/plugs')

  Plug 'neovim/nvim-lspconfig'

  " Themes
  Plug 'joshdick/onedark.vim'

  " statusline
  Plug 'itchyny/lightline.vim'

  " VS Code like intellisense and language-servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug '/root/.config/nvim/cdev'


  " Auto pairs for (), [], "", '', {}
  Plug 'jiangmiao/auto-pairs'

  " for better syntax highlighting
  
  
  "Plug 'sheerun/vim-polyglot'
  "Plug 'uiiaoo/java-syntax.vim' " for java

  " FUZZY FINDER file finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " NERDTree file explorer
  "Plug 'preservim/nerdtree'

  " git tracker plugin
  Plug 'airblade/vim-gitgutter'

  " indent line
"  Plug 'Yggdroot/indentLine'

  Plug 'numToStr/Comment.nvim' 
  
  Plug 'nvim-treesitter/nvim-treesitter-context' 
  
  Plug 'nvim-treesitter/playground' 

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  
  
  "Plug 'xuhdev/vim-latex-live-preview'

  "Plug 'hrsh7th/nvim-cmp'
  "Plug 'hrsh7th/cmp-nvim-lsp'
  "Plug 'habamax/vim-godot'
  "Plug 'L3MON4D3/LuaSnip'
  Plug 'mfussenegger/nvim-dap'

  " Plug '/root/.config/nvim/gdev'

  Plug '/root/.config/nvim/prufus'
  

call plug#end()

lua require('Comment').setup()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
