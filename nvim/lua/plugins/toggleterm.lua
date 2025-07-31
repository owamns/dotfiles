local toggleterm = require("toggleterm")

toggleterm.setup({
  direction = "horizontal",
  float_opts = {
    border = "curved",
  },
})

-- Mapeo para <leader>t
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })

-- Salir de terminal con <Esc>
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
