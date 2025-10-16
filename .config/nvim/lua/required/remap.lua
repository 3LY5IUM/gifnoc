vim.g.mapleader = ","
vim.g.localmapleader = ","
vim.keymap.set('n', "<leader><CR>", vim.cmd.Ex)
vim.keymap.set('i', "jh", "<ESC>", { noremap = true })
vim.keymap.set('v', "jh", "<ESC>", { noremap = true })

vim.diagnostic.config({ severity_sort = true })

local virtual_text_enabled = true
vim.keymap.set('n', "<leader>dt", function()
	virtual_text_enabled = not virtual_text_enabled
	vim.diagnostic.config({ virtual_text = virtual_text_enabled })
end, { noremap = true, silent = true, desc = "toggles lsp info display" })

-- Minimal LSP keymaps and setup

local opts = { buffer = bufnr, remap = false }
-- Go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

-- Go to implementation
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

-- Hover documentation
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

-- Show references
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

vim.keymap.set('n','<leader>l',function() vim.diagnostic.setloclist({open=true}) end,{desc='Diagnostics → loclist'})
vim.keymap.set('n','<leader>q', function() vim.diagnostic.setqflist({ open = true }) end, { desc = 'Diagnostics → quickfix' })


vim.keymap.set('n', ']e', function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

vim.keymap.set('n', '[e', function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)


