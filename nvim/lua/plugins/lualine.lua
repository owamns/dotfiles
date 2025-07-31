-- lua/plugins/lualine.lua
local function setup_lualine(theme)
  -- Paletas de colores por tema
  local colors = {
    tokyonight = {
      bg = "#1a1b26",
      fg = "#c0caf5",
      blue = "#7aa2f7",
      green = "#9ece6a",
      cyan = "#7dcfff",
      red = "#f7768e",
      darkblue = "#24283b",
      violet = "#bb9af7",
    },
    kanagawa = {
      bg = "#1f1f28",
      fg = "#dcd7ba",
      blue = "#7fb4ca",
      green = "#98bb6c",
      cyan = "#7aa89f",
      red = "#ff5d62",
      darkblue = "#252535",
      violet = "#957fb8",
    },
    nightfox = {
      bg = "#192330",
      fg = "#cdcecf",
      blue = "#81b29a",
      green = "#9ec08c",
      cyan = "#88c0d0",
      red = "#e06c75",
      darkblue = "#212e3f",
      violet = "#c4a7e7",
    },
    onedark = {
      bg = "#282c34",
      fg = "#abb2bf",
      blue = "#61afef",
      green = "#98c379",
      cyan = "#56b6c2",
      red = "#e06c75",
      darkblue = "#21252b",
      violet = "#c678dd",
    },
    material = {
      bg = "#1c2526",
      fg = "#b0bec5",
      blue = "#4fc1ff",
      green = "#88b369",
      cyan = "#4dd0e1",
      red = "#f06292",
      darkblue = "#2e3b3b",
      violet = "#b39ddb",
    },
  }

  -- Tema base de Lualine (adaptado de tu Darcula)
  local lualine_theme = {
    normal = {
      a = { fg = colors[theme].bg, bg = colors[theme].blue },
      b = { fg = colors[theme].fg, bg = colors[theme].darkblue },
      c = { fg = colors[theme].fg, bg = colors[theme].bg },
    },
    insert = {
      a = { fg = colors[theme].bg, bg = colors[theme].green },
    },
    visual = {
      a = { fg = colors[theme].bg, bg = colors[theme].cyan },
    },
    replace = {
      a = { fg = colors[theme].bg, bg = colors[theme].red },
    },
    inactive = {
      a = { fg = colors[theme].fg, bg = colors[theme].bg },
      b = { fg = colors[theme].fg, bg = colors[theme].bg },
      c = { fg = colors[theme].fg, bg = colors[theme].bg },
    },
  }

  require("lualine").setup({
    options = {
      theme = lualine_theme,
      section_separators = "",
      component_separators = "",
    },
  })
end

-- Exportar la función para usarla en Themery
return { setup_lualine = setup_lualine }
