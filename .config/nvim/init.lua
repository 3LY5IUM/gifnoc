require("required.remap")
require("required.lazy")

local vim = vim
vim.g.have_nerd_font = true
vim.g.relativenumbers = true


-- init.lua
-- Converted from .vimrc with preserved comments
vim.opt.mouse = 'a'
vim.opt.history = 6900
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest,full'
vim.opt.incsearch = true

-- vim.opt.syntax = 'on'
-- vim.opt.filetype.plugin = 'on'
-- vim.opt.filetype.indent = 'on'


vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'LSP hover' })
  end,
})



vim.opt.tabstop=2
vim.opt.showmatch = true
vim.opt.matchtime = 7
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand('~/.vim/backups')
vim.opt.updatecount = 100
vim.opt.autoindent = true
vim.opt.linebreak = true
vim.opt.showbreak = '\\'
vim.opt.virtualedit = ''
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.magic = true
vim.opt.ruler = true
vim.opt.foldcolumn = '1'
vim.opt.listchars = { tab = '>–', trail = '-' }
vim.opt.tags = vim.fn.expand('~/.vim/tags')
vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'
vim.opt.wildignore = '*.swp,*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx'
-- vim.opt.nocompatible = true
vim.opt.visualbell = true
vim.opt.title = true
vim.opt.confirm = true
-- vim.opt.noerrorbells = true
vim.opt.smartindent = true
vim.opt.report = 0
vim.opt.encoding = 'utf-8'
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
-- vim.opt.noshowmode = true
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true
vim.opt.splitright = true

-- Restore Cursor Position
vim.api.nvim_create_autocmd('BufReadPost', {
	group = vim.api.nvim_create_augroup('RestoreCursor', { clear = true }),
	callback = function()
		if vim.fn.line("'\"") >= 1 and vim.fn.line("'\"") <= vim.fn.line('$') then
			vim.cmd('normal! g`"')
		end
	end
})

-- Key Mappings
vim.keymap.set('n', '<F4>', ':w !date<CR>')
vim.keymap.set('n', '<F2>', ':IndentLinesToggle<CR>')
vim.keymap.set('n', '<F5>', ':set list!<CR>')
vim.keymap.set('i', '<F5>', '<C-o>:set list!<CR>')
vim.keymap.set('c', '<F5>', '<C-c>:set list!<CR>')
vim.keymap.set('n', '<F3>', ':noh<CR>')
vim.keymap.set('n', '<F6>', ':setlocal spell! spelllang=en_us<CR>')



-- Color Scheme
vim.cmd.colorscheme('substrata_insp')


vim.opt.winborder = 'rounded'
-- vim.opt.completeopt = "menu,fuzzy,menuone,noinsert,popup"
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
vim.lsp.enable({ "lua_ls", "clangd", "awk_ls", "clangd", "dockerls", "jdtls", "jqls", "pyright", "bashls" })
