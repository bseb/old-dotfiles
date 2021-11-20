local coq = require "coq"
require'lspconfig'.pyright.setup{
    coq.lsp_ensure_capabilities{}
}
require'lspconfig'.gopls.setup{
    coq.lsp_ensure_capabilities{}
}
