local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-x>"] = actions.select_horizontal, -- horizontal split
        ["<C-v>"] = actions.select_vertical, -- vertical split
        ["<C-t>"] = actions.select_tab, -- new tab
      },
      n = { -- si usas modo normal en Telescope
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
      },
    },
  },
})
