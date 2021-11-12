vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = { tab = "  ", extends = "", precedes = "" }
vim.opt.title = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.hidden = true
vim.opt.shortmess:append("sI")
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.shell = "/bin/sh"
vim.opt.lazyredraw = true
vim.opt.mouse = "a"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.showmode = false

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } }

_G.colors = {
	red  = "#BF616A", teal   = "#97B7D7", one_bg  = "#373D49", lightbg   = "#3B4252", blue         = "#81A1C1",
	cyan = "#5E81AC", black  = "#2E3440", orange  = "#D08770", one_bg2   = "#434C5E", foreground   = "#E5E9F0",
	grey = "#4B515D", green  = "#A3BE8C", purple  = "#8FBCBB", one_bg3   = "#4C566A", light_grey   = "#646A76",
	line = "#3A404C", white  = "#D8DEE9", yellow  = "#EBCB8B", lightbg2  = "#393F4B", dark_purple  = "#B48EAD",
	pink = "#D57780", black2 = "#343A46", grey_fg = "#606672", baby_pink = "#DE878F", darker_black = "#2A303C",
}

require("impatient")
require("packer_compiled")
require("packer").startup({
	function(use)
		use("lewis6991/impatient.nvim")
		use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })
		use("nathom/filetype.nvim")
		use("kyazdani42/nvim-web-devicons")
		use({
			"famiu/feline.nvim",
			config = function()
				local lsp = require("feline.providers.lsp")
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
						local filename = vim.fn.expand("%:t")
						local extension = vim.fn.expand("%:e")
						local icon = require("nvim-web-devicons").get_icon(filename, extension)
						if icon == nil then return " " end
						return " "..icon.." "..filename.." "
					end,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 70 end,
					hl = { fg = colors.white, bg = colors.lightbg },
					right_sep = {
						str = icons.right,
						hl = { fg = colors.lightbg, bg = colors.lightbg2 },
					},
				}
				components.active[1][3] = {
					provider = function()
						local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						return "  "..dir_name.." "
					end,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 80 end,
					hl = { fg = colors.grey_fg, bg = colors.lightbg2 },
					right_sep = {
						str = icons.right,
						hi = { fg = colors.lightbg2, bg = colors.black2 },
					},
				}
				components.active[1][4] = {
					provider = function() return require("nvim-gps").get_location() end,
					enabled = function()
						local module = vim.F.npcall(require, "nvim-gps")
						return module and module.is_available()
					end,
					hl = { fg = colors.grey_fg },
				}
				components.active[1][5] = {
					provider = "diagnostic_errors",
					enabled = function() return lsp.diagnostics_exist("Error") end,
					hl = { fg = colors.red },
					icon = "  ",
				}
				components.active[1][6] = {
					provider = "diagnostic_warnings",
					enabled = function() return lsp.diagnostics_exist("Warning") end,
					hl = { fg = colors.yellow },
					icon = "  ",
				}
				components.active[1][7] = {
					provider = "diagnostic_hints",
					enabled = function() return lsp.diagnostics_exist("Hint") end,
					hl = { fg = colors.grey_fg },
					icon = "  ",
				}
				components.active[1][8] = {
					provider = "diagnostic_info",
					enabled = function() return lsp.diagnostics_exist("Inormation") end,
					hl = { fg = colors.green },
					icon = "  ",
				}
				components.active[2][1] = {
					provider = function()
						local Lsp = vim.lsp.util.get_progress_messages()[1]
						if Lsp then
							local msg = Lsp.message or ""
							local percentage = Lsp.percentage or 0
							local title = Lsp.title or ""
							local spinners = { "", "", "" }
							local success_icon = { "", "", "" }
							local ms = vim.loop.hrtime() / 1000000
							local frame = math.floor(ms / 120) % 3
							if percentage >= 70 then
								return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
							else
								return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
							end
						end
						return ""
					end,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 80 end,
					hl = { fg = colors.green },
				}
				components.active[3][1] = {
					provider = function()
						if next(vim.lsp.buf_get_clients()) ~= nil then
							return "  LSP"
						else
							return ""
						end
					end,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 70 end,
					hl = { fg = colors.grey_fg, bg = colors.black2 },
				}
				components.active[3][2] = {
					provider = "git_branch",
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 70 end,
					hl = { fg = colors.grey_fg, bg = colors.black2 },
					icon = "  ",
				}
				components.active[3][3] = {
					provider = "git_diff_added",
					hl = { fg = colors.green, bg = colors.black2 },
					icon = "  ",
				}
				components.active[3][4] = {
					provider = "git_diff_changed",
					hl = { fg = colors.yellow, bg = colors.black2 },
					icon = "  ",
				}
				components.active[3][5] = {
					provider = "git_diff_removed",
					hl = { fg = colors.baby_pink, bg = colors.black2 },
					icon = "  ",
				}
				components.active[3][6] = {
					provider = " "..icons.left,
					hl = { fg = colors.one_bg2, bg = colors.black2 },
				}
				local mode_colors = {
					["n"] = { "NORMAL", colors.red },
					["no"] = { "N-PENDING", colors.red },
					["i"] = { "INSERT", colors.darkpurple },
					["ic"] = { "INSERT", colors.darkpurple },
					["t"] = { "TERMINAL", colors.green },
					["v"] = { "VISUAL", colors.cyan },
					["V"] = { "V-LINE", colors.cyan },
					[""] = { "V-BLOCK", colors.cyan },
					["R"] = { "REPLACE", colors.orange },
					["Rv"] = { "V-REPLACE", colors.orange },
					["s"] = { "SELECT", colors.blue },
					["S"] = { "S-LINE", colors.blue },
					[""] = { "S-BLOCK", colors.blue },
					["c"] = { "COMMAND", colors.pink },
					["cv"] = { "COMMAND", colors.pink },
					["ce"] = { "COMMAND", colors.pink },
					["r"] = { "PROMPT", colors.teal },
					["rm"] = { "MORE", colors.teal },
					["r?"] = { "CONFIRM", colors.teal },
					["!"] = { "SHELL", colors.green },
				}
				components.active[3][7] = {
					provider = icons.left,
					hl = function() return { fg = mode_colors[vim.fn.mode()][2], bg = colors.one_bg2 } end,
				}
				components.active[3][8] = {
					provider = icons.vi_mode,
					hl = function() return { fg = colors.black2, bg = mode_colors[vim.fn.mode()][2] } end,
				}
				components.active[3][9] = {
					provider = function() return " "..mode_colors[vim.fn.mode()][1].." " end,
					hl = function() return { fg = mode_colors[vim.fn.mode()][2], bg = colors.one_bg } end,
				}
				components.active[3][10] = {
					provider = icons.left,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 90 end,
					hl = { fg = colors.grey, bg = colors.one_bg },
				}
				components.active[3][11] = {
					provider = icons.left,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 90 end,
					hl = { fg = colors.green, bg = colors.grey },
				}
				components.active[3][12] = {
					provider = icons.position,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 90 end,
					hl = { fg = colors.black, bg = colors.green },
				}
				components.active[3][13] = {
					provider = "position",
					hl = { fg = colors.green, bg = colors.one_bg },
				}
				components.active[3][14] = {
					provider = function()
						local current_line = vim.fn.line(".")
						local total_line = vim.fn.line("$")
						if current_line == 1 then return "ﬢﬢ"
						elseif current_line == vim.fn.line("$") then return "ﬠﬠﬠ"
						end
						local result, _ = math.modf((current_line / total_line) * 100)
						return " "..result.."%%"
					end,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 90 end,
					hl = { fg = colors.green, bg = colors.one_bg },
				}
				require("feline").setup({
					colors = { fg = colors.grey_fg, bg = colors.black2 },
					components = components,
				})
			end,
		})
		use({
			"akinsho/bufferline.nvim",
			config = function()
				require("bufferline").setup({
					options = {
						separator_style = "thin",
						diagnostics = "nvim_lsp",
						custom_filter = function(buf)
							if vim.api.nvim_buf_get_option(buf, "filetype") ~= "nnn" then return true end
						end,
					},
					highlights = {
						background = { guifg = colors.grey_fg, guibg = colors.black2 },
						buffer_selected = { guifg = colors.white, guibg = colors.black, gui = "bold", },
						buffer_visible = { guifg = colors.light_grey, guibg = colors.black2 },
						error = { guifg = colors.light_grey, guibg = colors.black2 },
						error_diagnostic = { guifg = colors.light_grey, guibg = colors.black2 },
						close_button = { guifg = colors.light_grey, guibg = colors.black2 },
						close_button_visible = { guifg = colors.light_grey, guibg = colors.black2 },
						close_button_selected = { guifg = colors.red, guibg = colors.black },
						fill = { guifg = colors.grey_fg, guibg = colors.black2 },
						indicator_selected = { guifg = colors.black, guibg = colors.black },
						modified = { guifg = colors.red, guibg = colors.black2 },
						modified_visible = { guifg = colors.red, guibg = colors.black2 },
						modified_selected = { guifg = colors.green, guibg = colors.black },
						separator = { guifg = colors.black2, guibg = colors.black2 },
						separator_visible = { guifg = colors.black2, guibg = colors.black2 },
						separator_selected = { guifg = colors.black2, guibg = colors.black2 },
						tab = { guifg = colors.light_grey, guibg = colors.one_bg3 },
						tab_selected = { guifg = colors.black2, guibg = colors.blue },
						tab_close = { guifg = colors.red, guibg = colors.black },
					},
				})
			end,
		})
		use("nvim-lua/plenary.nvim")
		use({
			"lewis6991/gitsigns.nvim",
			config = function() require("gitsigns").setup() end
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("nvim-treesitter.configs").setup({
					highlight = { enable = true },
					ensure_installed = {
						"bash", "bibtex", "c", "cmake", "cpp", "css", "dockerfile", "go", "html", "java",
						"javascript", "json", "lua", "perl", "php", "python", "r", "regex", "rust",
						"toml", "typescript", "verilog", "vim", "yaml",
					},
				})
			end,
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("indent_blankline").setup({
					char = "▏",
					show_trailing_blankline_indent = false,
					show_first_indent_level = false,
					buftype_exclude = { "terminal" },
					filetype_exclude = { "help", "terminal", "dashboard", "packer", "lspinfo", "TelescopePrompt", "TelescopeResults" }
				})
			end,
		})
		use({
			"norcalli/nvim-colorizer.lua",
			config = function() require("colorizer").setup({ "*" }, { names = false }) end,
		})
		-- use("mcchrish/nnn.vim")
		use({
			"~/dev/nnn.nvim",
			config = function()
				local builtin = require("nnn").builtin
				require("nnn").setup({
					explorer = { cmd = "nnn -Go", session = "shared", side = "topleft", tabs = true },
					picker = { cmd = "tmux new-session nnn -GPp", style = { border = "rounded" } },
					replace_netrw = "picker",
					windownav = { left = "<C-h>", right = "<C-l>" },
					auto_open = { setup = "picker", tabpage = "explorer", empty = true, ft_ignore = { "gitcommit" }
				},
				auto_close = true,
				mappings = {
					{ "<C-t>", builtin.open_in_tab },      -- open file(s) in tab
					{ "<C-s>", builtin.open_in_split },    -- open file(s) in split
					{ "<C-v>", builtin.open_in_vsplit },   -- open file(s) in vertical split
					{ "<C-y>", builtin.copy_to_clipboard },-- copy file(s) to clipboard
					{ "<C-w>", builtin.cd_to_path },       -- cd to file directory
					{ "<C-p>", builtin.open_in_preview },  -- open file in preview split keeping nnn focused
					{ "<C-e>", builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
				},
			})
		end,
	})
	use({
		"SmiteshP/nvim-gps",
		event = "CursorHold",
		config = function()
			require("nvim-gps").setup({
				separator = "  ",
				icons = {["container-name"] = " "}
			})
			end,
	})
	use({ "folke/lua-dev.nvim", after = "nvim-gps" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "lua-dev.nvim" })
	use({
		"neovim/nvim-lspconfig",
		after = "cmp-nvim-lsp",
		config = function()
			vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticHint" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
			vim.lsp.handlers["textDocument/rename"] = function(err, result)
				if err then vim.notify(("Error running lsp query 'rename': "..err), vim.log.levels.ERROR) end
				if result and result.changes then
					local msg = ""
					for f, c in pairs(result.changes) do
						local new = c[1].newText
						msg = msg..("%d changes -> %s"):format(#c, f:gsub("file://",""):gsub(vim.fn.getcwd(),".")).."\n"
						msg = msg:sub(1, #msg - 1)
						vim.notify(msg, vim.log.levels.INFO, { title = ("Rename: %s -> %s"):format(vim.fn.expand("<cword>"), new) })
					end
				end
				vim.lsp.util.apply_workspace_edit(result)
			end
			vim.lsp.buf.rename = {
				float = function()
					local currName = vim.fn.expand("<cword>")
					local tshl = require("nvim-treesitter-playground.hl-info").get_treesitter_hl()
					if tshl and #tshl > 0 then
						local ind = tshl[#tshl]:match("^.*()%*%*.*%*%*")
						tshl = tshl[#tshl]:sub(ind + 2, -3)
					end

					local win = require('plenary.popup').create(currName, {
						title = "New Name",
						style = "minimal",
						borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
						relative = "cursor",
						borderhighlight = "FloatBorder",
						titlehighlight = "Title",
						highlight = tshl,
						focusable = true,
						width = 25,
						height = 1,
						line = "cursor+2",
						col = "cursor-1"
					})

					local map_opts = { noremap = true, silent = true }
					vim.api.nvim_buf_set_keymap(0, "i", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
					vim.api.nvim_buf_set_keymap(0, "n", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
					vim.api.nvim_buf_set_keymap(0, "i", "<CR>", "<cmd>stopinsert | lua vim.lsp.buf.rename.apply('"..currName..","..win.."')<CR>", map_opts)
					vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<cmd>stopinsert | lua vim.lsp.buf.rename.apply('"..currName..","..win.."')<CR>", map_opts)
				end,
				apply = function(curr, win)
					local newName = vim.trim(vim.fn.getline('.'))
					vim.api.nvim_win_close(win, true)
					if #newName > 0 and newName ~= curr then
						local params = vim.lsp.util.make_position_params()
						params.newName = newName
						vim.lsp.buf_request(0, "textDocument/rename", params)
					end
				end
			}
			vim.diagnostic.config( { virtual_text = false, float = { show_header = false, border = "rounded" } })
			local function on_attach(client, bufnr)
				local function bufmap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local opts = { noremap = true, silent = true }
				bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				bufmap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				bufmap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
				bufmap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
				bufmap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
				bufmap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
				bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename.float()<CR>", opts)
				bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
				bufmap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>", opts)
				bufmap("n", "gx", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
				bufmap("n", "gz", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
				bufmap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
				bufmap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
				bufmap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
				require("illuminate").on_attach(client)
			end
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
			lspconfig.bashls.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.clangd.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.sumneko_lua.setup(require("lua-dev").setup({
				lspconfig = { on_attach = on_attach, capabilities = capabilities, cmd = { "lua-language-server" } }
			}))
			lspconfig.texlab.setup( { on_attach = on_attach, capabilities = capabilities })
			vim.defer_fn(function() vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %' end, 0)
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		after = "nvim-lspconfig",
		config = function()
			local ls = require("null-ls")
			local sources = {
				ls.builtins.formatting.shfmt,
				ls.builtins.formatting.lua_format,
				ls.builtins.diagnostics.shellcheck,
				ls.builtins.diagnostics.vale,
			}
			ls.config({ sources = sources })
			require("lspconfig")["null-ls"].setup({})
		end,
	})
	use({
		"https://gitlab.com/yorickpeterse/nvim-dd.git",
		after = "null-ls.nvim",
		config = function()
			require("dd").setup({ timeout = 1 })
		end
	})
	use({
		"folke/trouble.nvim",
		after = "nvim-dd.git",
		config = function()
			require("trouble").setup({
				auto_open = true,
				auto_close = true,
				padding = false,
				height = 5,
				signs = { error = "", warning = "", hint = "", information = "", other = "", },
			})
		end,
	})
	use({
		"ray-x/lsp_signature.nvim",
		after = "trouble.nvim",
		config = function() require("lsp_signature").setup({ doc_lines = 0, hint_enable = false }) end,
	})
	use({
		"RRethy/vim-illuminate",
		after = "lsp_signature.nvim",
	})
	use({
		"karb94/neoscroll.nvim",
		after = "vim-illuminate",
		config = function()
			require("neoscroll").setup()
			require("neoscroll.config").set_mappings({ ["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "150" } } })
			require("neoscroll.config").set_mappings({ ["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "150" } } })
		end,
	})
	use({
		"~/dev/stabilize.nvim",
		after = "neoscroll.nvim",
		config = function() require("stabilize").setup({ forcemark = "f", nested = "QuickFixCmdPost,User LspDiagnosticsChanged" }) end,
	})
	use({ "nvim-treesitter/playground", after = "stabilize.nvim" })
	use({
		"rcarriga/nvim-notify",
		after = "playground",
		config = function()
			vim.notify = require("notify")
		end
	})
	use({
		"antoinemadec/FixCursorHold.nvim",
		after = "nvim-notify",
	})
	use({ "rafamadriz/friendly-snippets", event = { "InsertEnter", "CmdlineEnter" } })
	use({
		"hrsh7th/nvim-cmp",
		after = "friendly-snippets",
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
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "nvim_lua" },
					{ name = "buffer", keyword_length = 5 },
					{ name = "path" },
					{ name = "latex_symbols" },
				},
				experimental = { ghost_text = true },
				snippet = {
					expand = function(args) require("luasnip").lsp_expand(args.body) end,
				},
				formatting = {
					format = function(entry, item)
						item.kind = icons[item.kind].." "..item.kind
						item.menu = ({
							buffer = "[BUF]",
							latex_symbols = "[TEX]",
							luasnip = "[SNIP]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[LUA]",
							path = "",
						})[entry.source.name]
						return item
					end,
				},
				mapping = {
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
						else fallback()
						end
					end, { "i", "c" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then cmp.select_prev_item()
						elseif require("luasnip").jumpable(-1) then
							vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
						else fallback()
						end
					end, { "i", "c" })
				}
			})
			cmp.setup.cmdline = cmp.setup.cmdline
			cmp.setup.cmdline('/', { sources = { { name = 'buffer' } } })
			cmp.setup.cmdline(':', { sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }) })
		end,
	})
	use({
		"L3MON4D3/LuaSnip",
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI", })
			require("luasnip/loaders/from_vscode").lazy_load()
		end,
	})
	use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
	use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" })
	use({ "hrsh7th/cmp-cmdline", after = "cmp-nvim-lua" })
	use({ "hrsh7th/cmp-buffer", after = "cmp-cmdline" })
	use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
	use({ "kdheepak/cmp-latex-symbols", after = "cmp-path" })
	use({
		"windwp/nvim-autopairs",
		after = "cmp-latex-symbols",
		config = function()
			require("nvim-autopairs").setup()
			require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		end,
	})
	use({
		"blackCauldron7/surround.nvim",
		after = "nvim-autopairs",
		config = function() require("surround").setup({ mappings_style = "sandwich" }) end,
		setup = function() vim.defer_fn(function() require("packer").loader("surround.nvim") end, 0) end
	})
	use({
		"numToStr/Comment.nvim",
		after = "surround.nvim",
		config = function() require("Comment").setup() end,
	})
	use({
		"folke/which-key.nvim",
		after = "Comment.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup()
			wk.register({}, {})
		end,
	})
	use({ "wbthomason/packer.nvim", cmd = { "PackerSync", "PackerClean" } })
	use({
		"lervag/vimtex",
		cmd = "VimtexInverseSearch",
		ft = "tex",
		config = function() vim.g.vimtex_view_method = "zathura" end
	})
	use({
		"sindrets/diffview.nvim",
		cmd = "Neogit",
	})
	use({
		"TimUntersberger/neogit",
		after = "diffview.nvim",
		config = function()
			require("neogit").setup({
				disable_commit_confirmation = true,
				signs = { section = { "", "" }, item = { "", "" } },
				integrations = { diffview = true },
			})
		end
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		cmd = "Telescope",
		run = "make"
	})
	use({
		"nvim-telescope/telescope.nvim",
		after = "telescope-fzf-native.nvim",
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
				pickers = { fd = { find_command = { "fd", ".", "/home/luuk", "--type", "f", "-H" } } },
			})
			require("telescope").load_extension("fzf")
		end,
	})
	use({
		"Pocco81/TrueZen.nvim",
		cmd = "TZAtaraxis",
		config = function() require("true-zen").setup({ integrations = { feline = true, nvim_bufferline = true } }) end
	})
	use({
		"vimwiki/vimwiki",
		cmd = "VimwikiIndex"
	})
	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		cmd = { "SnipRun", "SnipInfo"}
	})
end,
config = {
	compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua',
	display = {
		prompt_border = "rounded",
		open_fn = function() return require("packer.util").float({ border = "rounded" }) end
	},
},
})

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then options = vim.tbl_extend("force", options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<Esc>", "<cmd>noh<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<A-x>", "<C-x>")
map("n", "<A-a>", "<C-a>")
map("n", "<S-t", "<cmd>enew<CR>")
map("n", "<C-t>b", "<cmd>tabnew<CR>")
map("n", "<A-Tab>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<A-S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
map("n", "<leader>zz", "<cmd>TZAtaraxis<CR>")
map("n", "<leader>zf", "<cmd>TZFocus<CR>")
map("n", "<leader>zm", "<cmd>TZMinimalist<CR>")
map("n", "<leader>ra", ":%s//g<Left><Left>")
map("n", "<leader>da", "ggVGd")
map("n", "<C-a>", "GVgg")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "k", "(v:count > 5 ? (\"m'\" . v:count1) : \"\") . (v:count || mode(1)[0:1] == \"no\" ? \"\" : \"g\") . \"k\"", { expr = true })
map("n", "j", "(v:count > 5 ? (\"m'\" .v:count1) : \"\") . (v:count || mode(1)[0:1] == \"no\" ? \"\" : \"g\") . \"j\"", { expr = true })
map("n", "<leader>k", "<cmd>m .-2<CR>==")
map("n", "<leader>j", "<cmd>m .+1<CR>==")
map("v", "K", "<cmd>m '<-2<CR>gv=gv")
map("v", "J", "<cmd>m '>+1<CR>gv=gv")
map("i", "<C-k>", "<Esc><cmd>m .-2<CR>==")
map("i", "<C-j>", "<Esc><cmd>m .+1<CR>==")
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "!", "!<C-g>u")
map("i", "?", "?<C-g>u")
map("n", "<C-A-n>", "<cmd>NnnExplorer %:p:h<CR>")
map("t", "<C-A-n>", "<cmd>NnnExplorer<CR>")
map("n", "<C-A-p>", "<cmd>NnnPicker %:p:h<CR>")
map("t", "<C-A-p>", "<cmd>NnnPicker<CR>")
map("n", "<leader>ff", "<cmd>Telescope fd<CR>")
map("n", "<leader>fgf", "<cmd>Telescope git_files<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<leader>fgb", "<cmd>Telescope git_branches<CR>")
map("n", "<leader>fgc", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>xx", "<cmd>TroubleToggle<CR>")
map("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>")
map("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<CR>")
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>")
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>")
map("n", "<leader>xg", "<cmd>lua vimgrepprompt()<CR>")
map("n", "gR", "<cmd>TroubleToggle lsp_references<CR>")
map("n", "<C-A-j>", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<CR>")
map("n", "<C-A-k>", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<CR>")
map("n", "<leader>gc", "<cmd>Neogit<CR>")

vim.cmd([[
augroup MyAutoCommands
autocmd!
autocmd Filetype sh setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Focuslost * silent! update
autocmd InsertLeave,CursorHold * silent! update
autocmd QuickFixCmdPost [^l]* lua TroubleQuickFixPost("quickfix")
autocmd QuickFixCmdPost l* lua TroubleQuickFixPost("loclist")
autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup="IncSearch", timeout=1000 })
autocmd BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufRead,BufWrite /run/user/1000/neomutt* lua vim.schedule(function() require("true-zen.main").main(4, "toggle") end)
augroup end
]])

function _G.put(...) print(vim.inspect(...)) end

function _G.TroubleQuickFixPost(mode)
	require("trouble.providers").get(vim.api.nvim_get_current_win(),
	vim.api.nvim_get_current_buf(), function(items)
		if #items > 0 then require("trouble").open({ mode = mode }) end
	end, { mode = mode })
end

function _G.vimgrepprompt()
	local pattern = vim.fn.input("vimgrep pattern: ")
	if pattern and pattern ~= "" then
		local ok = vim.F.npcall(vim.cmd, "vimgrep /"..pattern.."/j %")
		vim.schedule(function() print(ok and " " or "No results") end)
	end
end

vim.g.terminal_color_0  = colors.black
vim.g.terminal_color_1  = colors.red
vim.g.terminal_color_2  = colors.green
vim.g.terminal_color_3  = colors.yellow
vim.g.terminal_color_4  = colors.blue
vim.g.terminal_color_5  = colors.dark_purple
vim.g.terminal_color_6  = colors.cyan
vim.g.terminal_color_7  = colors.foreground
vim.g.terminal_color_8  = colors.one_bg3
vim.g.terminal_color_9  = colors.red
vim.g.terminal_color_10 = colors.green
vim.g.terminal_color_11 = colors.yellow
vim.g.terminal_color_12 = colors.blue
vim.g.terminal_color_13 = colors.dark_purple
vim.g.terminal_color_14 = colors.cyan
vim.g.terminal_color_15 = colors.purple

local ns = vim.api.nvim_create_namespace("nord")
local function hl(name, val)
	vim.api.nvim_set_hl(ns, name, val)
end

vim.cmd("hi Normal guifg="..colors.foreground.." guibg="..colors.black)
hl("NormalFloat", { fg = colors.foreground, bg = colors.black })
hl("FloatBorder", { fg = colors.lightbg })
hl("Bold", { bold = true })
hl("Debug", { fg = colors.pink })
hl("Directory", { fg = colors.blue })
hl("Error", { fg = colors.black, bg = colors.pink })
hl("ErrorMsg", { fg = colors.pink, bg = colors.black })
hl("Exception", { fg = colors.pink })
hl("FoldColumn", { fg = colors.teal, bg = colors.lightbg })
hl("Folded", { fg = colors.one_bg3, bg = colors.lightbg })
hl("IncSearch", { fg = colors.blue })
hl("Macro", { fg = colors.pink })
hl("MatchParen", { bg = colors.lightbg })
hl("ModeMsg", { fg = colors.green })
hl("MoreMsg", { fg = colors.green })
hl("Question", { fg = colors.blue })
hl("Search", { fg = colors.blue })
hl("Substitute", { fg = colors.lightbg, bg = colors.yellow })
hl("SpecialKey", { fg = colors.one_bg3 })
hl("TooLong", { fg = colors.pink })
hl("Underlined", { fg = colors.pink })
hl("Visual", { bg = colors.one_bg2 })
hl("VisualNOS", { fg = colors.pink })
hl("WarningMsg", { fg = colors.pink })
hl("WildMenu", { fg = colors.pink, bg = colors.yellow })
hl("Title", { fg = colors.blue })
hl("Conceal", { fg = colors.blue, bg = colors.black })
hl("Cursor", { fg = colors.black, bg = colors.white })
hl("NonText", { fg = colors.one_bg3 })
hl("LineNr", { fg = colors.grey })
hl("SignColumn", { fg = colors.one_bg3 })
hl("StatusLineNC", { fg = colors.one_bg3, underline = true })
hl("StatusLine", { fg = colors.one_bg2, underline = true })
hl("VertSplit", { fg = colors.one_bg2 })
hl("ColorColumn", { bg = colors.lightbg })
hl("CursorColumn", { bg = colors.lightbg })
hl("CursorLine", { bg = colors.lightbg })
hl("CursorLinenr", { fg = colors.white, bg = colors.black })
hl("QuickFixLine", { bg = colors.lightbg })
hl("Pmenu", { fg = colors.one_bg })
hl("PmenuSbar", { fg = colors.one_bg2 })
hl("PmenuSel", { fg = colors.green })
hl("PmenuThumb", { fg = colors.blue })
hl("TabLine", { fg = colors.one_bg3, bg = colors.lightbg })
hl("TabLineFill", { fg = colors.one_bg3, bg = colors.lightbg })
hl("TabLineSel", { fg = colors.green, bg = colors.lightbg })

-- Standard syntax highlighting
hl("Boolean", { fg = colors.orange })
hl("Character", { fg = colors.pink })
hl("Comment", { fg = colors.grey_fg, italic = true })
hl("Conditional", { fg = colors.green })
hl("Constant", { fg = colors.cyan })
hl("Define", { fg = colors.dark_purple })
hl("Delimiter", { fg = colors.dark_purple })
hl("Float", { fg = colors.orange })
hl("Function", { fg = colors.yellow })
hl("Identifier", { fg = colors.teal })
hl("Include", { fg = colors.blue })
hl("Keyword", { fg = colors.green })
hl("Label", { fg = colors.yellow })
hl("Number", { fg = colors.orange })
hl("Operator", { fg = colors.white })
hl("PreProc", { fg = colors.yellow })
hl("Repeat", { fg = colors.cyan })
hl("Special", { fg = colors.orange })
hl("SpecialChar", { fg = colors.dark_purple })
hl("Statement", { fg = colors.green })
hl("StorageClass", { fg = colors.yellow })
hl("String", { fg = colors.pink })
hl("Structure", { fg = colors.dark_purple })
hl("Tag", { fg = colors.yellow })
hl("Todo", { fg = colors.yellow, bg = colors.lightbg })
hl("Type", { fg = colors.yellow })
hl("Typedef", { fg = colors.yellow })

-- Diff highlighting
hl("DiffAdd", { fg = colors.green, bg = colors.lightbg })
hl("DiffChange", { fg = colors.one_bg3, bg = colors.lightbg })
hl("DiffDelete", { fg = colors.pink, bg = colors.lightbg })
hl("DiffText", { fg = colors.blue, bg = colors.lightbg })
hl("DiffAdded", { fg = colors.green, bg = colors.black })
hl("DiffFile", { fg = colors.pink, bg = colors.black })
hl("DiffNewFile", { fg = colors.green, bg = colors.black })
hl("DiffLine", { fg = colors.blue, bg = colors.black })
hl("DiffRemoved", { fg = colors.pink, bg = colors.black })

-- Git highlighting
hl("gitcommitOverflow", { fg = colors.pink })
hl("gitcommitSummary", { fg = colors.green })
hl("gitcommitComment", { fg = colors.one_bg3 })
hl("gitcommitUntracked", { fg = colors.one_bg3 })
hl("gitcommitDiscarded", { fg = colors.one_bg3 })
hl("gitcommitSelected", { fg = colors.one_bg3 })
hl("gitcommitHeader", { fg = colors.dark_purple })
hl("gitcommitSelectedType", { fg = colors.blue })
hl("gitcommitUnmergedType", { fg = colors.blue })
hl("gitcommitDiscardedType", { fg = colors.blue })
hl("gitcommitBranch", { fg = colors.orange, bold = true })
hl("gitcommitUntrackedFile", { fg = colors.yellow })
hl("gitcommitUnmergedFile", { fg = colors.pink, bold = true })
hl("gitcommitDiscardedFile", { fg = colors.pink, bold = true })
hl("gitcommitSelectedFile", { fg = colors.green, bold = true })

-- Mail highlighting
hl("mailQuoted1", { fg = colors.yellow })
hl("mailQuoted2", { fg = colors.green })
hl("mailQuoted3", { fg = colors.dark_purple })
hl("mailQuoted4", { fg = colors.teal })
hl("mailQuoted5", { fg = colors.blue })
hl("mailQuoted6", { fg = colors.yellow })
hl("mailURL", { fg = colors.blue })
hl("mailEmail", { fg = colors.blue })

hl("EndOfBuffer", { fg = colors.black })
hl("NnnNormal", { bg = colors.darker_black })
hl("NvimInternalError", { fg = colors.red })
hl("GitSignsAdd", { fg = colors.blue })
hl("GitSignsChange", { fg = colors.grey_fg })
hl("GitSignsModified", { fg = colors.blue })
hl("CmpItemAbbr", { fg = colors.white })
hl("CmpItemAbbrMatch", { fg = colors.white })
hl("CmpItemKind", { fg = colors.white })
hl("CmpItemMenu", { fg = colors.white })
hl("IndentBlanklineChar", { fg = colors.line })
hl("DiagnosticError", { fg = colors.red })
hl("DiagnosticWarn", { fg = colors.yellow })
hl("DiagnosticInfo", { fg = colors.green })
hl("DiagnosticHint", { fg = colors.purple })
hl("LspReferenceRead", { bg = colors.lightbg })
hl("LspReferenceWrite", { bg = colors.lightbg })
hl("NeogitNotificationError", { fg = colors.red })
hl("NeogitNotificationWarn", { fg = colors.yellow })
hl("NeogitNotificationInfo", { fg = colors.green })
hl("NeogitDiffAddHighlight", { fg = colors.green, bg = colors.one_bg })
hl("NeogitDiffDeleteHighlight", { fg = colors.red, bg = colors.one_bg })
hl("NeogitDiffContextHighlight", { fg = colors.white, bg = colors.one_bg })
hl("NeogitHunkHeader", { fg = colors.red, bg = colors.one_bg })
hl("NeogitHunkHeaderHighlight", { fg = colors.yellow, bg = colors.one_bg })
vim.cmd("hi NotifyINFOBorder guifg="..colors.green)
vim.cmd("hi NotifyINFOTitle guifg="..colors.green)
vim.cmd("hi NotifyINFOIcon guifg="..colors.green)
vim.cmd("hi NotifyWARNBorder guifg="..colors.yellow)
vim.cmd("hi NotifyWARNTitle guifg="..colors.yellow)
vim.cmd("hi NotifyWARNIcon guifg="..colors.yellow)
vim.cmd("hi NotifyERRORBorder guifg="..colors.red)
vim.cmd("hi NotifyERRORTitle guifg="..colors.red)
vim.cmd("hi NotifyERRORIcon guifg="..colors.red)
hl("TelescopeBorder", { fg = colors.one_bg })
hl("TelescopePreviewTitle", { fg = colors.green })
hl("TelescopePromptTitle", { fg = colors.blue })
hl("TelescopeResultsTitle", { fg = colors.red })
hl("TelescopePreviewBorder", { fg = colors.grey })
hl("TelescopePromptBorder", { fg = colors.line })
hl("TelescopeResultsBorder", { fg = colors.line })
vim.api.nvim__set_hl_ns(ns)
