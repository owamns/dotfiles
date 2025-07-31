--local highlights = require("nord").bufferline.highlights({
--    italic = true,
--    bold = true,
--})

require("bufferline").setup({
  options = {
    separator_style = "thin",
    show_buffer_close_icons = true,
    show_close_icon = true,
    always_show_bufferline = true,
    diagnostics = "nvim_lsp", -- muestra errores si usas LSP
  },
  highlights = {
    buffer_selected = {
      fg = "#ffffff", -- texto blanco para el buffer activo
      bold = true, -- opcional: en negrita
      italic = false,
    },
  },
})
