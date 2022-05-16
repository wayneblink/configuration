local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '~/.cache/jdtls-workspace' .. project_name

local config = {
	cmd = {
		'java', '-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true', '-Dlog.level=ALL', '-Xms1g',
		'--add-modules=ALL_SYSTEM', '--add-opens',
		'-jar', '/Users/blinky/Library/Java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher.cocoa.macosx.x86_64_1.2.400.v20211117-0650.jar',
		'-configuration', '/Library/Java/jdt-language-server-1.9.0-202203031534/config_mac/',
		'-data', workspace_dir,
	},
	root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
	capabilities = capabilities
}

require('jdtls').start_or_attach(config)
require('jdtls.setup').add_commands()

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', 'K', 'vim.lsp.buf.hover()', opts)
vim.api.nvim_set_keymap('n', 'ga', 'vim.lsp.buf.code_action()', opts)
vim.api.nvim_set_keymap('n', 'gd', 'vim.lsp.buf.definition()', opts)
vim.api.nvim_set_keymap('n', 'gD', 'vim.lsp.buf.declaration()', opts)
vim.api.nvim_set_keymap('n', 'gr', 'vim.lsp.buf.references()', opts)
vim.api.nvim_set_keymap('n', 'gi', 'vim.lsp.buf.implementation()', opts)
vim.api.nvim_set_keymap('n', 'gT', 'vim.lsp.buf.type_definition()', opts)
vim.api.nvim_set_keymap('n', ' dj', 'vim.diagnostic.goto_next()', opts)
vim.api.nvim_set_keymap('n', ' dk', 'vim.diagnostic.goto_prev()', opts)
vim.api.nvim_set_keymap('n', ' dl', '<cmd>Telescope diagnostics<cr>', opts)
vim.api.nvim_set_keymap('n', ' rn', 'vim.lsp.buf.rename()', opts)

vim.api.nvim_set_keymap('n', ' lA', '<cmd>lua require(\'jdtls\').code_action()<cr>', {silent=true})

