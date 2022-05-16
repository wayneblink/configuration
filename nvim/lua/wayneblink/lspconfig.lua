local nvim_lsp = require('lspconfig')
local servers = { 'tsserver', 'gopls', 'jdtls' }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
	vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, {buffer=0})
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {buffer=0})
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=0})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
	vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, {buffer=0})
	vim.keymap.set('n', ' dj', vim.diagnostic.goto_next, {buffer=0})
	vim.keymap.set('n', ' dk', vim.diagnostic.goto_prev, {buffer=0})
	vim.keymap.set('n', ' dl', '<cmd>Telescope diagnostics<cr>', {buffer=0})
	vim.keymap.set('n', ' rn', vim.lsp.buf.rename, {buffer=0})
end

require("nvim-lsp-installer").setup{}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup{
		capabilities = capabilities,
		on_attach = on_attach
	}
end
