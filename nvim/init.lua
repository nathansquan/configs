---------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------

require("user.plugins")
require("user.options")
require("user.keymaps")

require("lualine").setup()
require("nvim-web-devicons").setup({
	--globally enable default icons (default to false)
	--will get overriden by `get_icons` option
	default = true,
})

require("user.gitsigns")
require("user.telescope")
require("user.nvim-treesitter")
require("user.nvim-lspconfig")
require("user.nvim-cmp")
require("user.null-ls")
require("user.indent-blankline")
require("user.Comment")
require("user.zepl")
require("user.nvim-tree")
-- Compile Packer each time init.lua is written
vim.cmd([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]])
