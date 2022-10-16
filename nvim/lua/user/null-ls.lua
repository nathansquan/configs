----------------------------------------------------------
-- Null-ls configuration file
-----------------------------------------------------------

-- Plugin: jose-elias-alvarez/null-ls.nvim

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		-- prefer_local to point to installations of black in venv
		formatting.black.with({
			prefer_local = "bin/",
		}),
		-- `stylua` should be set up as callable from command line (be in '$PATH')
		formatting.stylua,
	},
})
