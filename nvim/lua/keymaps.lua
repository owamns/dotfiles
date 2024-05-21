-- Telescole
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

vim.keymap.set('n', '<leader>fw', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)


-- Nvim-Tree
vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
