lspconfig = require'lspconfig'
completion_callback = require'completion'.on_attach

require'lspinstall'.setup()

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{on_attach=completion_callback}
end
