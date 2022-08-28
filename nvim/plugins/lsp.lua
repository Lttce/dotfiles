-- nvim-lsp
require('mason-lspconfig').setup_handlers {
    function(server_name)

        local opts = {}

        -- Config each servers
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

        if server_name == 'emmet_ls' then
            opts.filetypes = { 'html', 'css', 'typescriptreact' }
        end

        if server_name == 'sumneko_lua' then
            opts.settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        end

        local node_root_dir = require('lspconfig').util.root_pattern("package.json")
        local is_node_repo = node_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil

        if server_name == "tsserver" then
            if not is_node_repo then
                return
            end
            opts.root_dir = node_root_dir
        elseif server_name == "eslint" then
            if not is_node_repo then
                return
            end
            opts.root_dir = node_root_dir
        elseif server_name == 'denols' then
            if is_node_repo then
                return
            end
            opts.root_dir =
            require('lspconfig').util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json")
        end

        -- Key mapping
        opts.on_attach = function(_, bufnr)
            local function buf_set_keymap(...)
                vim.api.nvim_buf_set_keymap(bufnr, ...)
            end

            local buf_opts = { noremap = true, silent = true }
            buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', buf_opts)
            buf_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>', buf_opts)
            buf_set_keymap('n', '<space>r', '<cmd>TroubleToggle lsp_references<CR>', buf_opts)
            buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', buf_opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', buf_opts)
        end

        -- enable nvim-cmp
        opts.update_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

        -- launch server
        require('lspconfig')[server_name].setup(opts)
    end
}
