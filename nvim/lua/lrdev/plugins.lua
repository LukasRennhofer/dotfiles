local fn = vim.fn

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer = require('packer')
local use = packer.use

packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'morhetz/gruvbox'

  -- LSP Config
  use 'neovim/nvim-lspconfig'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- Debug Adapter Protocol
  use 'mfussenegger/nvim-dap'

  -- GLSL syntax highlighting
  use 'tikhomirov/vim-glsl'

  -- Git integration
  use 'tpope/vim-fugitive'

  if packer_bootstrap then
    packer.sync()
  end
end)
