return {
	"nvim-telescope/telescope.nvim", 
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim",
	{"nvim-telescope/telescope-fzf-native.nvim", 
	build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"},
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<c-p>", builtin.find_files, {})
		vim.keymap.set("n", "<Space><Space>", builtin.oldfiles, {})
		vim.keymap.set("n", "<Space>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})
	end,
}

