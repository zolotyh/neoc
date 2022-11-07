local neoc = require("neoc.core")

require("neoc.options")
require("neoc.plugins")
require("neoc.keymaps")
require("neoc.plugins.lsp-config.null-ls")
require("neoc.plugins.lsp-config.language-servers")
require("neoc.plugins.lsp-config.lspsaga")
require("neoc.plugins.lsp-config.completion")


neoc.init()
