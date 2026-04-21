return {
	{
		"mrcjkb/rustaceanvim",
		version = "^7", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "stylua", "biome", "cssls", "clangd", "ruff" },
			})

			vim.keymap.set("n", "<leader>pm", ":Mason<CR>", { desc = "Open Mason manager" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- :h vim.lsp.buf -> shows the all the functions that can be used to communicate with the lsp

			-- Specify how the border looks like
			local border = {
				{ "┌", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "┐", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "┘", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "└", "FloatBorder" },
				{ "│", "FloatBorder" },
			}

			-- Add the border on hover and on signature help popup window
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			-- Add border to the diagnostic popup window
			vim.diagnostic.config({
				virtual_text = {
					prefix = "↪ ", -- Could be '●', '▎', 'x', '■', , 
				},
				float = { border = border },
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- LSP servers
			vim.lsp.config("rust_analyzer", {
				-- Server-specific settings. See `:help lsp-quickstart`
				settings = {
					["rust-analyzer"] = {
						diagnostics = {
							enabled = false,
						},
					},
				},
				capabilities = capabilities,
				handlers = handlers,
			})
			-- Python lsp
			vim.lsp.config("jedi_language_server", {
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.lsp.config("pyls", {
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.lsp.config("bashls", {
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.lsp.config("tsgo", {
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.lsp.config("bash_ls", {
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.lsp.config("postgres_lsp", {
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.lsp.config("cssls", {
				capabilities = capabilities,
				handlers = handlers,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "shows the status of the hovered elt" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "go to implementation" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "show references" })
			vim.keymap.set("n", "gri", vim.lsp.buf.rename, { desc = "rename references " })
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "go to type definition" })
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "add folder to a workspace" })
			vim.keymap.set(
				"n",
				"<leader>wd",
				vim.lsp.buf.remove_workspace_folder,
				{ desc = "remove folder to a workspace" }
			)
			vim.keymap.set("n", "<leader>wl", vim.lsp.buf.list_workspace_folders, { desc = "show workspace folders" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename reference" })
			vim.keymap.set("n", "<leader>gt", vim.lsp.buf.typehierarchy, { desc = "show type hierarchy" })
			vim.keymap.set("n", "<leader>go", vim.lsp.buf.outgoing_calls, { desc = "show outgoing calls" })
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.incoming_calls, { desc = "show incoming calls" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "perform code actions" })

			vim.o.updatetime = 250
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				callback = function()
					vim.diagnostic.open_float(nil, { focus = false })
				end,
			})

			vim.api.nvim_create_autocmd("BufWrite", {
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end,
	},
}
