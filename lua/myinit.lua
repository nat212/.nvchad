local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Earthfile",
  command = "set filetype=Earthfile",
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "build.earth",
  command = "set filetype=Earthfile",
})

vim.opt.relativenumber = true
vim.opt.scrolloff = 16
vim.opt.clipboard = ""
