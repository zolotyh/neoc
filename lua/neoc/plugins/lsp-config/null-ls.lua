local function on_attach(_, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

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
require("null-ls").setup({
    on_attach = on_attach,
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint_d,
        require("null-ls").builtins.code_actions.eslint_d,
        require("null-ls").builtins.formatting.eslint_d,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.formatting.prettier_d_slim,
    },
})
