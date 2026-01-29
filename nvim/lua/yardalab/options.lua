local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Clipboard (funguje v Codespaces + SSH)
opt.clipboard = "unnamedplus"

-- Misc
opt.wrap = false
opt.scrolloff = 8
opt.mouse = "a"
