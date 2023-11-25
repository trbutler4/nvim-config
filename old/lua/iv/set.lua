-- general config stuff


-- disbaled netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers
vim.opt.nu = true 
vim.opt.relativenumber = true

-- tab stuff 
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true 

vim.opt.smartindent = true

-- disable line wraps 
vim.opt.wrap = false 


-- no vim backups, give undotree long undo history 
vim.opt.swapfile = false 
vim.opt.backup = false 
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- searching stuff 
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- view offset 
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- space is map leader 
vim.g.mapleader = " "

-- everforest transparent bg
vim.g.everforest_transparent_background = 1

-- lsp stuff
vim.lsp.set_log_level("off")

-- adding cairo filetype 
vim.filetype.add({
    extension = {
        cairo = 'cairo'
    }
})


