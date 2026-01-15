return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("dap").set_log_level("DEBUG")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		main = "dapui",
		config = function()
			local dap = require("dap")

			require("dapui").setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				require("dapui").open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				require("dapui").close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				require("dapui").close()
			end

			vim.keymap.set("n", "<F5>", dap.continue)
			vim.keymap.set("n", "<F10>", dap.step_over)
			vim.keymap.set("n", "<F11>", dap.step_into)
			vim.keymap.set("n", "<F12>", dap.step_out)

			vim.keymap.set("n", "<leader>p", dap.toggle_breakpoint)
			vim.keymap.set("n", "<leader>P", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end)

			vim.keymap.set("n", "<leader>dr", dap.repl.open)
			vim.keymap.set("n", "<leader>du", require("dapui").toggle)
			vim.keymap.set("n", "<leader>dt", function()
				require("dap-go").debug_test()
			end, { desc = "Debug Go test" })
		end,
	},

	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-go").setup()
		end,
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = true,
	},
}
