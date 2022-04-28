local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silent = true }

    buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) --> jumps to the definition of the symbol under the cursor
    buf_set_keymap("n", "<leader>lh", ":lua vim.lsp.buf.hover()<CR>", opts) --> information about the symbol under the cursos in a floating window
    buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) --> lists all the implementations for the symbol under the cursor in the quickfix window

    buf_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts) --> rename using Lspsaga

    buf_set_keymap(
        "n",
        "<leader>ac",
        "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
        opts
    ) --> selects a code action available at the current cursor position

    buf_set_keymap(
        "v",
        "<leader>ac",
        ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>",
        opts
    ) --> selects a code action available at the current cursor position
    buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
    buf_set_keymap(
        "n",
        "<leader>d",
        ":lua vim.diagnostic.open_float()<CR>",
        opts
    )
    buf_set_keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    buf_set_keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    buf_set_keymap(
        "n",
        "<leader>lq",
        ":lua vim.diagnostic.setloclist()<CR>",
        opts
    )
    buf_set_keymap("n", "<leader>ff", ":lua vim.lsp.buf.formatting()<CR>", opts) --> formats the current buffer
    buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
    buf_set_keymap(
        "n",
        "<C-u>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>",
        {}
    )
    buf_set_keymap(
        "n",
        "<C-d>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>",
        {}
    )
end

local servers = {
    "bashls",
    "pyright",
    "tsserver",
    "emmet_ls",
    "sumneko_lua",
    "ltex",
    "null-ls",
    -- "eslint",
}

---@diagnostic disable-next-line: undefined-global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end

lsp_installer.on_server_ready(function(server)
    -- Specify the default options which we'll use to setup all servers
    local default_opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

   if server.name == "tsserver" then
        default_opts.displayPartsForJSDoc = true
    end


    server:setup(default_opts)
end)

local eslint = {
    lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" },
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true,
    parseJson = {
        errorsRoot = "[0].messages",
        line = "line",
        column = "column",
        endLine = "endLine",
        endColumn = "endColumn",
        message = "[eslint] ${message} [${ruleId}]",
        security = "severity",
    },
    securities = {
        [2] = "error",
        [1] = "warning",
    },
}

local function eslint_config_exists()
    local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

    if not vim.tbl_isempty(eslintrc) then
        return true
    end

    if vim.fn.filereadable("package.json") then
        if
            vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"]
        then
            return true
        end
    end

    return false
end

lspconfig.efm.setup({
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.goto_definition = false
    end,
    root_dir = function()
        if not eslint_config_exists() then
            return nil
        end
        return vim.fn.getcwd()
    end,
    settings = {
        languages = {
            javascript = { eslint },
            javascriptreact = { eslint },
            ["javascript.jsx"] = { eslint },
            typescript = { eslint },
            ["typescript.tsx"] = { eslint },
            typescriptreact = { eslint },
        },
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
    },
})
