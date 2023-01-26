_G.a   = vim.api
_G.c   = vim.cmd
_G.d   = vim.diagnostic
_G.g   = vim.g
_G.l   = vim.lsp
_G.O   = vim.opt
_G.S   = vim.schedule
_G.tc  = vim.tbl_contains
_G.npc = vim.F.npcall

require("colors")
require("options")
S(function()
require("utils")
require("keymaps")
require("autocmds")
end)

return {
	{ "nvim-tree/nvim-web-devicons", lazy = false },
	{ "feline-nvim/feline.nvim", lazy = false,
		config = function()
			local lsp = require("feline.providers.lsp")
			local lsp_severity = d.severity
			local icons = { left = "", right = " ", main = "  ", vi_mode = " ", position = " " }
			local components = { active = { {}, {}, {} }, inactive = { {}, {}, {} } }
			components.active[1][1] = {
				provider = icons.main,
				hl = { fg = colors.black2, bg = colors.blue },
				right_sep = {
					str = icons.right,
					hl = { fg = colors.blue, bg = colors.lightbg },
				},
			}
			components.active[1][2] = {
				provider = function()
					local filename = f.expand("%:t")
					local icon = require("nvim-web-devicons").get_icon(filename, f.expand("%:e"))
					return icon and (" "..icon.." "..filename.." ") or " "
				end,
				enabled = function() return a.nvim_win_get_width(0) > 70 end,
				hl = { fg = colors.white, bg = colors.lightbg },
				right_sep = {
					str = icons.right,
					hl = { fg = colors.lightbg, bg = colors.lightbg2 },
				},
			}
			components.active[1][3] = {
				provider = function() return "  "..f.fnamemodify(f.getcwd(), ":t").." " end,
				enabled = function() return a.nvim_win_get_width(0) > 80 end,
				hl = { fg = colors.grey_fg, bg = colors.lightbg2 },
				right_sep = {
					str = icons.right,
					hi = { fg = colors.lightbg2, bg = colors.black2 },
				},
			}
			components.active[1][4] = {
				provider = function() return require("nvim-navic").get_location() end,
				enabled = function()
					local module = npc(require, "nvim-navic")
					return module and module.is_available()
				end,
				hl = { fg = colors.grey_fg },
			}
			components.active[1][5] = {
				provider = "diagnostic_errors",
				enabled = function() return lsp.diagnostics_exist(lsp_severity.ERROR) end,
				hl = { fg = colors.red },
				icon = "  ",
			}
			components.active[1][6] = {
				provider = "diagnostic_warnings",
				enabled = function() return lsp.diagnostics_exist(lsp_severity.WARN) end,
				hl = { fg = colors.yellow },
				icon = "  ",
			}
			components.active[1][7] = {
				provider = "diagnostic_hints",
				enabled = function() return lsp.diagnostics_exist(lsp_severity.HINT) end,
				hl = { fg = colors.grey_fg },
				icon = "  ",
			}
			components.active[1][8] = {
				provider = "diagnostic_info",
				enabled = function() return lsp.diagnostics_exist(lsp_severity.INFO) end,
				hl = { fg = colors.green },
				icon = "  ",
			}
			components.active[3][1] = {
				provider = function()
					local last_search = f.getreg("/")
					if not last_search or last_search == "" then return "" end
					local searchcount = f.searchcount({ maxcount = 0 })
					return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ") "
				end,
				enabled = function() return vim.v.hlsearch == 1 end,
				hl = { fg = colors.dark_purple, bg = colors.black2 },
			}
			components.active[3][2] = {
				provider = function() return l.get_active_clients() and "  LSP" or "" end,
				enabled = function() return a.nvim_win_get_width(0) > 70 end,
				hl = { fg = colors.grey_fg, bg = colors.black2 },
			}
			components.active[3][3] = {
				provider = "git_branch",
				enabled = function() return a.nvim_win_get_width(0) > 70 end,
				hl = { fg = colors.grey_fg, bg = colors.black2 },
				icon = "  ",
			}
			components.active[3][4] = {
				provider = "git_diff_added",
				hl = { fg = colors.green, bg = colors.black2 },
				icon = "  ",
			}
			components.active[3][5] = {
				provider = "git_diff_changed",
				hl = { fg = colors.yellow, bg = colors.black2 },
				icon = "  ",
			}
			components.active[3][6] = {
				provider = "git_diff_removed",
				hl = { fg = colors.baby_pink, bg = colors.black2 },
				icon = "  ",
			}
			components.active[3][7] = {
				provider = " "..icons.left,
				hl = { fg = colors.one_bg2, bg = colors.black2 },
			}
			local mode_colors = {
				["n"] = { "NORMAL", colors.red },
				["no"] = { "N-PENDING", colors.red },
				["i"] = { "INSERT", colors.darkpurple },
				["ic"] = { "INSERT", colors.darkpurple },
				["t"] = { "TERMINAL", colors.green },
				["nt"] = { "T-PENDING", colors.green },
				["v"] = { "VISUAL", colors.cyan },
				["V"] = { "V-LINE", colors.cyan },
				["\22"] = { "V-BLOCK", colors.cyan },
				["R"] = { "REPLACE", colors.orange },
				["Rv"] = { "V-REPLACE", colors.orange },
				["s"] = { "SELECT", colors.blue },
				["S"] = { "S-LINE", colors.blue },
				["\19"] = { "S-BLOCK", colors.blue },
				["c"] = { "COMMAND", colors.pink },
				["cv"] = { "COMMAND", colors.pink },
				["ce"] = { "COMMAND", colors.pink },
				["r"] = { "PROMPT", colors.teal },
				["rm"] = { "MORE", colors.teal },
				["r?"] = { "CONFIRM", colors.teal },
				["!"] = { "SHELL", colors.green },
			}
			components.active[3][8] = {
				provider = icons.left,
				hl = function() return { fg = mode_colors[a.nvim_get_mode().mode][2], bg = colors.one_bg2 } end,
			}
			components.active[3][9] = {
				provider = icons.vi_mode,
				hl = function() return { fg = colors.black2, bg = mode_colors[a.nvim_get_mode().mode][2] } end,
			}
			components.active[3][10] = {
				provider = function() return " "..mode_colors[a.nvim_get_mode().mode][1].." " end,
				hl = function() return { fg = mode_colors[a.nvim_get_mode().mode][2], bg = colors.one_bg } end,
			}
			components.active[3][11] = {
				provider = icons.left,
				enabled = function() return a.nvim_win_get_width(0) > 90 end,
				hl = { fg = colors.grey, bg = colors.one_bg },
			}
			components.active[3][12] = {
				provider = icons.left,
				enabled = function() return a.nvim_win_get_width(0) > 90 end,
				hl = { fg = colors.green, bg = colors.grey },
			}
			components.active[3][13] = {
				provider = icons.position,
				enabled = function() return a.nvim_win_get_width(0) > 90 end,
				hl = { fg = colors.black, bg = colors.green },
			}
			components.active[3][14] = {
				provider = "position",
				hl = { fg = colors.green, bg = colors.one_bg },
			}
			components.active[3][15] = {
				provider = function()
					local current_line = f.line(".")
					if current_line == 1 then return " ﬢﬢ"
					elseif current_line == f.line("$") then return "ﬠﬠﬠ"
					end
					local result, _ = math.modf((current_line / f.line("$")) * 100)
					return " "..result.."%%"
				end,
				enabled = function() return a.nvim_win_get_width(0) > 90 end,
				hl = { fg = colors.green, bg = colors.one_bg },
			}
			require("feline").setup({
				theme = { fg = colors.grey_fg, bg = colors.black2 },
				components = components,
				force_inactive = {}
			})
		end
	},
	{ "akinsho/bufferline.nvim", lazy = false,
		config = {
			options = {
				separator_style = "thin",
				diagnostics = "nvim_lsp",
				custom_filter = function(buf)
					local ignored = { "dap-repl" }
					return not tc(ignored, a.nvim_buf_get_option(buf, "filetype"))
				end,
			},
			highlights = {
				background = { fg = colors.grey_fg, bg = colors.black2 },
				buffer_selected = { fg = colors.white, bg = colors.black, bold = true },
				buffer_visible = { fg = colors.light_grey, bg = colors.black2 },
				error = { fg = colors.light_grey, bg = colors.black2 },
				error_diagnostic = { fg = colors.light_grey, bg = colors.black2 },
				close_button = { fg = colors.light_grey, bg = colors.black2 },
				close_button_visible = { fg = colors.light_grey, bg = colors.black2 },
				close_button_selected = { fg = colors.red, bg = colors.black },
				fill = { fg = colors.grey_fg, bg = colors.black2 },
				indicator_selected = { fg = colors.black, bg = colors.black },
				modified = { fg = colors.red, bg = colors.black2 },
				modified_visible = { fg = colors.red, bg = colors.black2 },
				modified_selected = { fg = colors.green, bg = colors.black },
				separator = { fg = colors.black2, bg = colors.black2 },
				separator_visible = { fg = colors.black2, bg = colors.black2 },
				separator_selected = { fg = colors.black2, bg = colors.black2 },
				tab = { fg = colors.light_grey, bg = colors.one_bg3 },
				tab_selected = { fg = colors.black2, bg = colors.blue },
				tab_close = { fg = colors.red, bg = colors.black },
	} } },
		"nvim-lua/plenary.nvim", lazy = false,
	{ "lewis6991/gitsigns.nvim", lazy = false, config = { trouble = true } },
	{ "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate",
			config = function() require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				ensure_installed = "all"
	}) end },
	{ "lukas-reineke/indent-blankline.nvim", lazy = false, config = {
			char = "▏",
			show_current_context = true,
			show_trailing_blankline_indent = false,
			show_first_indent_level = false,
			buftype_exclude = { "terminal" },
			filetype_exclude = { "help", "terminal", "dashboard", "packer", "lspinfo", "TelescopePrompt", "TelescopeResults" }
	} },
	{ "norcalli/nvim-colorizer.lua", lazy = false,
		config = { ["*"] = { names = false } }
	},
	{	"luukvbaal/statuscol.nvim", lazy = false,
		config = { foldfunc = "builtin", separator = "│", relculright = true, setopt = true }
	},
	{ "luukvbaal/nnn.nvim",
		lazy = false,
		cond = function()
			local buf = a.nvim_buf_get_name(0)
			return buf == "" or f.isdirectory(buf)
		end,
		config = function()
			local nnn = require("nnn")
			nnn.setup({
				explorer = { cmd = "nnn -Go", session = "shared", side = "topleft", tabs = true },
				picker = { cmd = "tmux new-session nnn -GPp", style = { border = "rounded" } },
				replace_netrw = "explorer",
				windownav = { left = "<C-h>", right = "<C-l>" },
				auto_open = { setup = "explorer", tabpage = "explorer", empty = true },
				auto_close = true,
				offset = true,
				quitcd = "tcd",
				mappings = {
					{ "<C-t>", nnn.builtin.open_in_tab },      -- open file(s) in tab
					{ "<C-s>", nnn.builtin.open_in_split },    -- open file(s) in split
					{ "<C-v>", nnn.builtin.open_in_vsplit },   -- open file(s) in vertical split
					{ "<C-y>", nnn.builtin.copy_to_clipboard },-- copy file(s) to clipboard
					{ "<C-w>", nnn.builtin.cd_to_path },       -- cd to file directory
					{ "<C-p>", nnn.builtin.open_in_preview },  -- open file in preview split keeping nnn focused
					{ "<C-e>", nnn.builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
				},
			})
		end,
	},
	-- { "folke/noice.nvim",
	-- 	event = "CursorHold",
	-- 	dependencies = { "MunifTanjim/nui.nvim" },
	-- 	config = true,
	-- },
	{ "neovim/nvim-lspconfig", event = "BufReadPost",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{	"folke/neodev.nvim", ft = "lua", config = { library = { plugins = false, runtime = false } } },
			{ "SmiteshP/nvim-navic", event = "CursorHold",
				config = { separator = "  ", icons = { ["container-name"] = " " } }
			},
		},
		config = function()
			f.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError" })
			f.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticHint" })
			f.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
			f.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
			l.handlers["textDocument/hover"] = l.with(l.handlers.hover, { border = "rounded" })
			l.handlers["textDocument/signatureHelp"] = l.with(l.handlers.signature_help, { border = "rounded" })
			l.buf.rename = {
				float = function()
					local currName = f.expand("<cword>")
					local tshl = vim.treesitter.get_captures_at_cursor(0)
					if tshl and #tshl > 0 then
						tshl = "@"..tshl[#tshl]
						local allowed = { "@variable", "@function.builtin", "@function.call", "@function", "@field", "@property" }
						if not tc(allowed, tshl) then return end
					else return end

					local buf = a.nvim_create_buf(false, true)
					a.nvim_buf_set_lines(buf, 0, 1, false, { currName })
					local win = a.nvim_open_win(buf, true, {
						title = "New Name",
						title_pos = "center",
						style = "minimal",
						border = "rounded",
						relative = "cursor",
						focusable = true,
						width = 25,
						height = 1,
						row = 2,
						col = 1
					})
					a.nvim_win_set_option(win, "winhighlight", "Normal:"..tshl)

					local map_opts = { noremap = true, silent = true, buffer = 0 }
					map("i", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
					map("n", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
					map("i", "<CR>", "<cmd>stopinsert | lua l.buf.rename.apply('"..currName.."',"..win..")<CR>", map_opts)
					map("n", "<CR>", "<cmd>stopinsert | lua l.buf.rename.apply('"..currName.."',"..win..")<CR>", map_opts)
				end,
				apply = function(curr, win)
					local newName = vim.trim(f.getline("."))
					a.nvim_win_close(tonumber(win), true)
					if #newName > 0 and newName ~= curr then
						local params = l.util.make_position_params()
						params.newName = newName
						l.buf_request(0, "textDocument/rename", params, function(err, res, ctx)
							if err then vim.notify(("Error running lsp query 'rename': "..err), vim.log.levels.ERROR) end
							if res and res.changes then
								local msg = ""
								for file, change in pairs(res.changes) do
									local new = change[1].newText
									msg = msg..("%d changes -> %s"):format(#change, file:gsub("file://",""):gsub(f.getcwd(),".")).."\n"
									msg = msg:sub(1, #msg - 1)
									vim.notify(msg, vim.log.levels.INFO, { title = ("Rename: %s -> %s"):format(f.expand("<cword>"), new) })
								end
							end
							l.util.apply_workspace_edit(res, l.get_client_by_id(ctx.client_id).offset_encoding)
						end)
					end
				end
			}
			d.config( { virtual_text = false, float = { show_header = false, border = "rounded" } })
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.sumneko_lua.setup({ capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { disable = { "missing-parameter", "param-type-mismatch", "cast-local-type" }},
						telemetry = { enable = false },
					}
				}
			})
			lspconfig.texlab.setup( { capabilities = capabilities })
			capabilities.offsetEncoding = { "utf-16" }
			lspconfig.clangd.setup({ capabilities = capabilities })
			local win = require("lspconfig.ui.windows")
			local _default_opts = win.default_opts
			win.default_opts = function(options)
				 local opts = _default_opts(options)
				 opts.border = "rounded"
				 return opts
			end
		end,
	},
	{	"jose-elias-alvarez/null-ls.nvim", event = "CursorHold",
		config = function()
			local ls = require("null-ls")
			local sources = {
				ls.builtins.formatting.shfmt,
				ls.builtins.diagnostics.shellcheck,
				ls.builtins.diagnostics.vale.with({ args = '--config="$XDG_CONFIG_HOME/vale/vale.ini"' }),
			}
			ls.setup({ sources = sources })
		end,
	},
	{	url = "https://gitlab.com/yorickpeterse/nvim-dd.git", name = "nvim-dd", event = "CursorHold", config = { timeout = 1 }},
	{	"folke/trouble.nvim", event = "CursorHold",
		config = {
			auto_open = true,
			auto_close = true,
			padding = false,
			signs = { error = "", warning = "", hint = "", information = "", other = "", },
			track_cursor = true,
		}
	},
	{	"ray-x/lsp_signature.nvim", event = "CursorHold", config = { doc_lines = 0, hint_enable = false } },
	{ "j-hui/fidget.nvim", event = "CursorHold", config = true },
	{	"rcarriga/nvim-notify", event = "CursorHold",
		config = function()
			require("notify").setup({ max_width = 40 })
			vim.notify = require("notify")
		end
	},
	{ "hrsh7th/nvim-cmp", event = "CursorHold",
		config = function()
			local icons = {
				Text = "", Method = "", Function = "", Constructor = "", Field = "ﰠ",
				Variable = "", Class = "ﴯ", Interface = "", Module = "", Property = "ﰠ",
				Unit = "塞", Value = "", Enum = "", Keyword = "", Snippet = "",
				Color = "", File = "", Reference = "", Folder = "", EnumMember = "",
				Constant = "", Struct = "פּ", Event = "", Operator = "", TypeParameter = "",
			}
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args) require("luasnip").lsp_expand(args.body) end,
				},
				window = {
					completion = cmp.config.window.bordered({ winhighlight = "" }),
					documentation = cmp.config.window.bordered({ winhighlight = "" }),
				},
				mapping = {
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							f.feedkeys(a.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
						else fallback()
						end
					end, { "i", "c" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then cmp.select_prev_item()
						elseif require("luasnip").jumpable(-1) then
							f.feedkeys(a.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
						else fallback()
						end
					end, { "i", "c" })
					,
					["<C-o>"] = cmp.mapping(function(fallback)
						local fallback_key = a.nvim_replace_termcodes("<Tab>", true, true, true)
						local resolved_key = vim.fn["copilot#Accept"](fallback)
						if fallback_key == resolved_key then
							cmp.confirm({ select = true })
						else
							a.nvim_feedkeys(resolved_key, "n", true)
						end
					end),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "nvim_lua" },
					{ name = "buffer", keyword_length = 5 },
					{ name = "path" },
					{ name = "latex_symbols" },
				},
				formatting = {
					format = function(_, item)
						item.kind = icons[item.kind]
						return item
					end,
					fields = { "kind", "abbr", "menu" }
				}
			})
			cmp.setup.cmdline({ "/", "?" }, { sources = { { name = "buffer" } } })
			cmp.setup.cmdline(":", { sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }) })
			cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		end,
	},
	{	"L3MON4D3/LuaSnip", event = "CursorHold", dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI", })
			require("luasnip/loaders/from_vscode").lazy_load()
		end,
	},
	{ "saadparwaiz1/cmp_luasnip", event = "CursorHold", },
	{ "hrsh7th/cmp-nvim-lua", event = "CursorHold", },
	{ "hrsh7th/cmp-cmdline", event = "CursorHold", },
	{ "hrsh7th/cmp-buffer", event = "CursorHold", },
	{ "hrsh7th/cmp-path", event = "CursorHold", },
	{ "kdheepak/cmp-latex-symbols", event = "CursorHold", },
	{	"windwp/nvim-autopairs", event = "CursorHold", config = true },
	{ "kylechui/nvim-surround", event = "CursorHold", config = true },
	{ "andymass/vim-matchup", event = "CursorHold",
		config = function()
			g.matchup_matchparen_offscreen = { method = "popup" }
			require("nvim-treesitter.configs").setup({ matchup = { enable = true }})
		end
	},
	{	"numToStr/Comment.nvim", event = "CursorHold", config = true },
	{
		"folke/which-key.nvim", event = "CursorHold",
		config = function()
			local wk = require("which-key")
			wk.setup({ icons = { separator = "➡" } })
			wk.register({}, {})
		end,
	},
	{ "github/copilot.vim", cmd = "Copilot" },
	{ "mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.configurations.python = { {
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				pythonPath = function() return "/usr/bin/python" end
			}}
			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb-vscode",
				name = "lldb"
			}
			dap.configurations.c = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function() return f.input("Path to executable: ", f.getcwd() .. "/", "file") end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
					runInTerminal = false,
				},
				{
					name = "Attach",
					type = "lldb",
					request = "attach",
					pid = require("dap.utils").pick_process,
					args = {},
				},
			}
			dap.listeners.after.event_initialized["dapui_config"] = function()
				require("trouble").setup({
					auto_open = false,
					auto_close = true,
					padding = false,
					height = 5,
					signs = { error = "", warning = "", hint = "", information = "", other = "", },
					track_cursor = true,
				})
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				require("trouble").setup({
					auto_open = true,
					auto_close = true,
					padding = false,
					height = 5,
					signs = { error = "", warning = "", hint = "", information = "", other = "", },
					track_cursor = true,
				})
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
			f.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
			f.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
			f.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
			f.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticHint", linehl = "", numhl = "" })
			f.sign_define("DapStopped", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
		end
	},
	{	"rcarriga/nvim-dap-ui",
		 config = {
		 	layouts = {
		 		{
		 			elements = { "scopes", "breakpoints", "stacks", "watches" },
		 			size = 40,
		 			position = "left"
		 		},
		 		{
		 			elements = { "repl", "console" },
		 			size = 10,
		 			position = "bottom"
		 		}},
		 	}
	},
	{	"theHamsta/nvim-dap-virtual-text", config = true },
	{ "lervag/vimtex", cmd = "VimtexInverseSearch", ft = "tex",
		config = function() g.vimtex_view_method = "zathura" end
	},
	{ "TimUntersberger/neogit",
		cmd = "NeoGit",
		dependencies = { "sindrets/diffview.nvim" },
		config = {
				disable_commit_confirmation = true,
				signs = { section = { "", "" }, item = { "", "" } },
				integrations = { diffview = true },
			}
	},
	{ "nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<Esc>"] = require("telescope.actions").close,
							["<C-h>"] = "which_key",
						},
					},
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
				},
				pickers = { fd = { find_command = { "fd", ".", "~", "--type", "f", "-H" } } },
			})
			require("telescope").load_extension("fzf")
		end,
	},
	{	"Pocco81/true-zen.nvim", cmd = "TZAtaraxis", config = true },
	{ "vimwiki/vimwiki", cmd = "VimwikiIndex",
		config = function() g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } } end
	},
	{	"michaelb/sniprun", build = "bash ./install.sh", cmd = { "SnipRun", "SnipInfo"} }
}
