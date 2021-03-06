-- nvim-lsp

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local lsp_installer = require('nvim-lsp-installer')

lsp_installer.on_server_ready(
    function(server)
        local opts = {}

        -- Config each servers
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

        if server.name == 'emmet_ls' then
            opts.filetypes = { 'html', 'css', 'typescriptreact' }
        end

        if server.name == 'sumneko_lua' then
            opts.settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        end

        opts.on_attach = on_attach
        opts.update_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        server:setup(opts)
    end
)
