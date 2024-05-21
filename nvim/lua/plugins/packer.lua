local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  -- My plugins here
  use("nvim-lua/plenary.nvim")

  -- Icons
  use("nvim-tree/nvim-web-devicons")

  -- Colors
  use("norcalli/nvim-colorizer.lua")

  -- Start nvim
  use("startup-nvim/startup.nvim")

  -- Lualine
  use("nvim-lualine/lualine.nvim")

  -- Bufferline
  use("akinsho/bufferline.nvim")

  -- Theme
  use("shaunsingh/nord.nvim")

  -- Autopairs
  use("windwp/nvim-autopairs")

  -- Tree
  use("nvim-tree/nvim-tree.lua")

  -- Telescope
  use("nvim-telescope/telescope.nvim")

  -- Indent blankline
  use("lukas-reineke/indent-blankline.nvim")

  -- CMP
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-nvim-lsp")

  -- Snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("WhoIsSethDaniel/mason-tool-installer.nvim")
  use("antosha417/nvim-lsp-file-operations")
  use("folke/neodev.nvim")

  -- Formatting
  use("stevearc/conform.nvim")

  -- Nvim-lint
  use("mfussenegger/nvim-lint")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
