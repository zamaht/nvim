return {
	{
		"ThePrimeagen/99",
		config = function()
			local _99 = require("99")

			_99.setup({
				debug = _99.DEBUG,
				type = "print",
				print_on_error = true,
			})

			-- take extra note that i have visual selection only in v mode
			-- technically whatever your last visual selection is, will be used
			-- so i have this set to visual mode so i dont screw up and use an
			-- old visual selection
			--
			-- likely ill add a mode check and assert on required visual mode
			-- so just prepare for it now
			vim.keymap.set("v", "<leader>9v", function()
				_99.visual()
			end)

			--- if you have a request you dont want to make any changes, just cancel it
			vim.keymap.set("n", "<leader>9x", function()
				_99.stop_all_requests()
			end)

			--- This is for searching in the code base
			vim.keymap.set("n", "<leader>9s", function()
				_99.search()
			end)

			--- Using telescope to search with AI
			vim.keymap.set("n", "<leader>9m", function()
				require("99.extensions.telescope").select_model()
			end)

			vim.keymap.set("n", "<leader>9p", function()
				require("99.extensions.telescope").select_provider()
			end)

			--- Opens something, I don't know what
			vim.keymap.set("n", "<leader>9o", function()
				_99.open()
			end)

			--- Opens tutorial window
			vim.keymap.set("n", "<leader>9t", function()
				_99.tutorial()
			end)

			vim.keymap.set("n", "<leader>9l", function()
				require("99").view_logs()
			end)
		end,
	},
}
