require("mason").setup()

local null_ls = require("null-ls")


require("mason-null-ls").setup({
  ensure_installed = {
    'jq', 'stylua', 'codespell'
  },
  automatic_setup = true,
  automatic_installation = true,
})

require 'mason-null-ls'.setup_handlers {
    function(source_name, methods)
      -- all sources with no handler get passed here
      -- Keep original functionality of `automatic_setup = true`
      require('mason-null-ls.automatic_setup')(source_name, methods)
    end,
    stylua = function()
      null_ls.register(null_ls.builtins.formatting.stylua)
    end,
    codespell = function()
      null_ls.register(null_ls.builtins.diagnostics.codespell)
    end,
    jq = function()
      null_ls.register(null_ls.builtins.formatting.jq)
    end
}

null_ls.setup()


local lspconfig = require("mason-lspconfig");

lspconfig.setup({
  ensure_installed = {
    "tsserver",
  },
}
)


local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end


-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})




local function on_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
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
  buf_set_keymap("n", "<leader>ff", ":lua vim.lsp.buf.format { async = true }<CR>", opts) --> formats the current buffer
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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.setup_handlers {
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },

      capabilities = capabilities,
    }
  end,
  ["eslint"] = function()
    require("lspconfig")["eslint"].setup {
      filetype = {
        "typescript",
        "javascript"
      }
    }
  end,
  ["sumneko_lua"] = function()
    require("lspconfig")["sumneko_lua"].setup {
        settings = {
        Lua = {
          diagnostics = {
            globals = {
              "vim",
              "it",
              "describe",
              "before_each",
              "after_each",
            }
          }
        }
      }
    }
  end,
}
