-- nvim-cmp

local cmp = require('cmp')

vim.opt.completeopt = {"menu", "menuone", "noselect"}

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    mapping = {
        -- ['<tab>'] = cmp.mapping.select_next_item(),
        -- ['<s-tab>'] = cmp.mapping.select_prev_item(),
        -- ['<cr>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
    })
})

