-- nvim-cmp

local cmp = require('cmp')

vim.opt.completeopt = {"menu", "menuone", "noselect", "noinsert"}

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        },{
        { name = 'buffer' },
        },{
        { name = 'nvim_lsp_signature_help' },
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

cmp.setup.cmdline('/', {
    sources = {
        { name = 'nvim_lsp_document_symbol' },
    },
})

