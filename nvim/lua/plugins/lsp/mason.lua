local servers = {
  "dockerls",
  "clangd",
  "pyright",
  --"csharp_ls",
}

local settings = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

require("mason").setup(settings)

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "prettier",
    "stylua",
  },
})
