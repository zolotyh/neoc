local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
  formatting.eslint_d.with({
    filetypes = {
      filetypes = {
        "typescript", "javascript", "typescript.tsx", "javascript.jsx",
        "typescriptreact", "javascriptreact", "vue"
      }
    }
  }),
  formatting.autopep8,
  formatting.stylua,
  formatting.clang_format,
  formatting.lua_format
}

null_ls.setup({ sources = sources })
