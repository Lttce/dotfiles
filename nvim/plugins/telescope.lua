-- telescope.nvim

vim.api.nvim_set_keymap('n', '<c-p>', '<cmd> Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-f>', '<cmd> Telescope live_grep<cr>' , { noremap = true, silent = true })

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = require('telescope.actions').close,
                ['<c-j>'] = require('telescope.actions').move_selection_next,
                ['<c-k>'] = require('telescope.actions').move_selection_previous,
            }
        }
    }
})

