-- lua/plugins/theme.lua
require("themery").setup({
  themes = {
    -- TokyoNight
    {
      name = "TokyoNight Night",
      colorscheme = "tokyonight-night",
      before = [[
        vim.g.tokyonight_style = 'night'
        require('tokyonight').setup({})
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('tokyonight')
      ]],
    },
    {
      name = "TokyoNight Storm",
      colorscheme = "tokyonight-storm",
      before = [[
        vim.g.tokyonight_style = 'storm'
        require('tokyonight').setup({})
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('tokyonight')
      ]],
    },
    {
      name = "TokyoNight Moon",
      colorscheme = "tokyonight-moon",
      before = [[
        vim.g.tokyonight_style = 'moon'
        require('tokyonight').setup({})
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('tokyonight')
      ]],
    },
    -- Kanagawa
    {
      name = "Kanagawa Wave",
      colorscheme = "kanagawa-wave",
      before = [[
        require('kanagawa').setup({ theme = 'wave' })
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('kanagawa')
      ]],
    },
    {
      name = "Kanagawa Dragon",
      colorscheme = "kanagawa-dragon",
      before = [[
        require('kanagawa').setup({ theme = 'dragon' })
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('kanagawa')
      ]],
    },
    -- Nightfox
    {
      name = "Nightfox",
      colorscheme = "nightfox",
      before = [[
        require('nightfox').setup({})
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('nightfox')
      ]],
    },
    {
      name = "Duskfox",
      colorscheme = "duskfox",
      before = [[
        require('nightfox').setup({})
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('nightfox')
      ]],
    },
    {
      name = "Nordfox",
      colorscheme = "nordfox",
      before = [[
        require('nightfox').setup({})
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('nightfox')
      ]],
    },
    {
      name = "Terafox",
      colorscheme = "terafox",
      before = [[
        require('nightfox').setup({})
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('nightfox')
      ]],
    },
    {
      name = "Carbonfox",
      colorscheme = "carbonfox",
      before = [[
        require('nightfox').setup({})
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('nightfox')
      ]],
    },
    -- OneDark
    {
      name = "OneDark",
      colorscheme = "onedark",
      before = [[
        require('onedark').setup({ style = 'dark' })
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('onedark')
      ]],
    },
    -- Material
    {
      name = "Material Darker",
      colorscheme = "material",
      before = [[
        vim.g.material_style = 'darker'
        require('material').setup({})
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('material')
      ]],
    },
    {
      name = "Material Palenight",
      colorscheme = "material",
      before = [[
        vim.g.material_style = 'palenight'
        require('material').setup({})
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('material')
      ]],
    },
    {
      name = "Material Deep Ocean",
      colorscheme = "material",
      before = [[
        vim.g.material_style = 'deep ocean'
        require('material').setup({})
      ]],
      after = [[
        require('plugins.lualine').setup_lualine('material')
      ]],
    },
  },
  livePreview = true,
})
