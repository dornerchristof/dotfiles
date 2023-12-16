return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {"nvim-tree/nvim-web-devicons"},
	config = function()
		require ("nvim-tree").setup()

		--recommended settings from nvim-tree docu
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true

		vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>")
	end,

}
