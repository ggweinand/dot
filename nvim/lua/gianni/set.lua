local opt = vim.opt

-- basic settings
opt.encoding = "utf-8"
opt.backspace = "indent,eol,start"
opt.history = 1000

-- display
opt.termguicolors = true
opt.showmatch = true
opt.scrolloff = 3
opt.modelines = 0

-- mark trailing spaces as errors
vim.cmd([[match IncSearch '\s\+$']])

-- fold/wrap
opt.foldenable = false
opt.textwidth = 72
vim.wo.wrap = false
opt.eol = false

-- indentation
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- sidebar
vim.wo.number = false
opt.signcolumn = "no"

-- bottom bar
opt.ruler = true
vim.cmd([[set ruf=%60(%=%#StatusLineNC#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)]])
opt.laststatus = 0

-- backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- search
opt.hlsearch = true
opt.incsearch = true
opt.linebreak = true

-- add '-' as a keyword/fname character
opt.iskeyword:append("-")
opt.isfname:append("@-@")

opt.updatetime = 50

-- minimalist netrw
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
