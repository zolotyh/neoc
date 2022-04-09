vim.cmd([[au BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)]])

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap(
    "n",
    "<space>e",
    "<cmd>lua vim.diagnostic.open_float()<CR>",
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "[d",
    "<cmd>lua vim.diagnostic.goto_prev()<CR>",
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "]d",
    "<cmd>lua vim.diagnostic.goto_next()<CR>",
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "<space>q",
    "<cmd>lua vim.diagnostic.setloclist()<CR>",
    opts
)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gD",
        "<cmd>lua vim.lsp.buf.declaration()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gd",
        "<cmd>lua vim.lsp.buf.definition()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "K",
        "<cmd>lua vim.lsp.buf.hover()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gi",
        "<cmd>lua vim.lsp.buf.implementation()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<C-k>",
        "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<Leader>wa",
        "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<Leader>wr",
        "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<Leader>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<Leader>D",
        "<cmd>lua vim.lsp.buf.type_definition()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<Leader>rn",
        "<cmd>lua vim.lsp.buf.rename()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<Leader>ac",
        "<cmd>lua vim.lsp.buf.code_action()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gr",
        "<cmd>lua vim.lsp.buf.references()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<Leader>f",
        "<cmd>lua vim.lsp.buf.formatting()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<Leader>e",
        "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
        opts
    )
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
    "bashls",
    "pyright",
    "emmet_ls",
    "sumneko_lua",
    "ltex",
    "eslint",
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

local buf_map = function(bufnr, mode, lhs, rhs, local_opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, local_opts or {
        silent = true,
    })
end

lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        -- local ts_utils = require("nvim-lsp-ts-utils")
        -- ts_utils.setup({})
        -- ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
})

lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
})

-- lspconfig.efm.setup {
--   init_options = {documentFormatting = true},
--   filetypes = {"lua"},
--   settings = {
--     rootMarkers = {".git/"},
--     languages = {
--       lua = {
--         {
--           formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb --tab-width=2 --indent-width=2",
--           formatStdin = true
--         }
--       }
--     }
--   }
-- }

if not configs.ls_emmet then
    configs.ls_emmet = {
        default_config = {
            cmd = { "ls_emmet", "--stdio" },
            filetypes = {
                "html",
                "css",
                "scss",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "haml",
                "xml",
                "xsl",
                "pug",
                "slim",
                "sass",
                "stylus",
                "less",
                "sss",
                "hbs",
                "handlebars",
            },
            root_dir = function(_)
                return vim.loop.cwd()
            end,
            settings = {},
        },
    }
end

lspconfig.ls_emmet.setup({ capabilities = capabilities })
