-- nvim-lsp

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(
    function(server)
        local opts = {
        }
        opts.on_attach = on_attach
        opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
        server:setup(opts)
    end
)

