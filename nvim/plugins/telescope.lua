-- telescope.nvim

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd> Telescope find_files<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<c-f>', '<cmd> Telescope live_grep<cr>' , { noremap = true, silent = true })

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<ESC>'] = require('telescope.actions').close,
                ['<C-j>'] = require('telescope.actions').move_selection_next,
                ['<C-k>'] = require('telescope.actions').move_selection_previous,
            }
        }
    }
})

