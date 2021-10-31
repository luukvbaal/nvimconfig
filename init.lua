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

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

require("packer").startup({
	function(use)
		use("nvim-lua/plenary.nvim")
		use({ "wbthomason/packer.nvim", event = "VimEnter" })
		use({
			"NvChad/nvim-base16.lua",
			after = "packer.nvim",
			config = function()
				local base16 = require("base16")
				base16(base16.themes("nord"), true)
				local ns = vim.api.nvim_create_namespace("base16")
				local function hl(name, val)
					vim.api.nvim_set_hl(ns, name, val)
				end
				hl("Comment", { foreground = colors.grey_fg, italic = true })
				hl("CursorLinenr", { foreground = colors.white, background = colors.black })
				hl("LineNr", { foreground = colors.grey })
				hl("EndOfBuffer", { foreground = colors.black })
				hl("FloatBorder", { foreground = colors.line })
				hl("NormalFloat", { foreground = colors.black })
				hl("Pmenu", { foreground = colors.one_bg })
				hl("PmenuSbar", { foreground = colors.one_bg2 })
				hl("PmenuSel", { foreground = colors.pmenu_bg })
				hl("PmenuThumb", { foreground = colors.nord_blue })
				hl("NnnNormal", { foreground = colors.darker_black })
				hl("NvimInternalError", { foreground = colors.red })
				hl("StatusLineNC", { foreground = colors.one_bg3, underline = true })
				hl("StatusLine", { foreground = colors.one_bg2, underline = true })
				hl("VertSplit", { foreground = colors.one_bg2 })
				hl("GitSignsAdd", { foreground = colors.nord_blue })
				hl("GitSignsChange", { foreground = colors.grey_fg })
				hl("GitSignsModified", { foreground = colors.nord_blue })
				hl("MatchParen", { foreground = colors.black, background = colors.red })
				hl("CmpItemAbbr", { foreground = colors.white })
				hl("CmpItemAbbrMatch", { foreground = colors.white })
				hl("CmpItemKind", { foreground = colors.white })
				hl("CmpItemMenu", { foreground = colors.white })
				hl("IndentBlanklineChar", { foreground = colors.line })
				hl("DiagnosticError", { foreground = colors.red })
				hl("DiagnosticWarn", { foreground = colors.yellow })
				hl("DiagnosticInfo", { foreground = colors.green })
				hl("DiagnosticHint", { foreground = colors.purple })
				hl("NeogitNotificationError", { foreground = colors.red })
				hl("NeogitNotificationWarn", { foreground = colors.yellow })
				hl("NeogitNotificationInfo", { foreground = colors.green })
				hl("NeogitDiffAddHighlight", { foreground = colors.green, background = colors.one_bg })
				hl("NeogitDiffDeleteHighlight", { foreground = colors.red, background = colors.one_bg })
				hl("NeogitDiffContextHighlight", { foreground = colors.white, background = colors.one_bg })
				hl("NeogitHunkHeader", { foreground = colors.red, background = colors.one_bg })
				hl("NeogitHunkHeaderHighlight", { foreground = colors.yellow, background = colors.one_bg })
				hl("NotifyINFOBorder", { foreground = colors.line })
				hl("NotifyINFOTitle", { foreground = colors.green })
				hl("NotifyINFOIcon", { foreground = colors.green })
				hl("NotifyWARNBorder", { foreground = colors.line })
				hl("NotifyWARNTitle", { foreground = colors.yellow })
				hl("NotifyWARNIcon", { foreground = colors.yellow })
				hl("NotifyERRORBorder", { foreground = colors.line })
				hl("NotifyERRORTitle", { foreground = colors.red })
				hl("NotifyERRORIcon", { foreground = colors.red })
				hl("TelescopeBorder", { foreground = colors.one_bg })
				hl("TelescopePreviewTitle", { foreground = colors.green })
				hl("TelescopePromptTitle", { foreground = colors.blue })
				hl("TelescopeResultsTitle", { foreground = colors.red })
				hl("TelescopePreviewBorder", { foreground = colors.grey })
				hl("TelescopePromptBorder", { foreground = colors.line })
				hl("TelescopeResultsBorder", { foreground = colors.line })
    		vim.api.nvim__set_hl_ns(ns)
			end,
		})
		use("sindrets/diffview.nvim")
		use({
			"TimUntersberger/neogit",
			config = function()
				require("neogit").setup({
					signs = {
						section = { "", "" },
						item = { "", "" }
					},
					integrations = { diffview = true },
				})
			end
		})
		use({
			"~/dev/nnn.nvim",
			after = "nvim-base16.lua",
			config = function()
				local builtin = require("nnn").builtin
				require("nnn").setup({
					explorer = { cmd = "nnn -G", session = "shared", side = "botright" },
					picker = { cmd = "tmux new-session nnn -GPp", style = { border = "rounded" } },
					replace_netrw = "picker",
					windownav = { left = "<C-h>", right = "<C-l>" },
					auto_open = {
						setup = "picker",
						tabpage = "explorer",
						empty = true,
						ft_ignore = { "gitcommit" }
					},
					auto_close = true,
					tabs = true,
					mappings = {
						{ "<C-t>", builtin.open_in_tab },       -- open file(s) in tab
						{ "<C-s>", builtin.open_in_split },     -- open file(s) in split
						{ "<C-v>", builtin.open_in_vsplit },    -- open file(s) in vertical split
						{ "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
						{ "<C-w>", builtin.cd_to_path },        -- cd to file directory
						{ "<C-p>", builtin.open_in_preview },   -- open file in preview split keeping nnn focused
					},
				})
			end,
		})
		use({
			"rcarriga/nvim-notify",
			after = "nvim-base16.lua",
			config = function()
				vim.notify = require("notify")
			end
		})
		use({
			"~/dev/stabilize.nvim",
			after = "nvim-base16.lua",
			config = function() require("stabilize").setup({ forcemark = "f" }) end,
		})
		use({ "kyazdani42/nvim-web-devicons", after = "nvim-base16.lua" })
		use({
			"SmiteshP/nvim-gps",
			after = "nvim-treesitter",
			config = function() require("nvim-gps").setup() end,
		})
		use({
			"famiu/feline.nvim",
			after = "nvim-web-devicons",
			config = function()
				local lsp = require("feline.providers.lsp")
				local statusline_style = {
					left = "",
					right = " ",
					main_icon = "  ",
					vi_mode_icon = " ",
					position_icon = " ",
				}
				local components = { active = {}, inactive = {} }
				for i = 1, 3 do components.active[i] = {} end
				components.active[1][1] = {
					provider = statusline_style.main_icon,
					hl = { fg = colors.statusline_bg, bg = colors.nord_blue },
					right_sep = {
						str = statusline_style.right,
						hl = { fg = colors.nord_blue, bg = colors.lightbg },
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
						str = statusline_style.right,
						hl = { fg = colors.lightbg, bg = colors.lightbg2 },
					},
				}
				components.active[1][3] = {
					provider = function()
						local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						return "  "..dir_name.." "
					end,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 80 end,
					hl = { fg = colors.grey_fg2, bg = colors.lightbg2 },
					right_sep = {
						str = statusline_style.right,
						hi = { fg = colors.lightbg2, bg = colors.statusline_bg },
					},
				}
				components.active[1][4] = {
					provider = function() return require("nvim-gps").get_location() end,
					enabled = function()
						local module = vim.F.npcall(require, "nvim-gps")
						return module and module.is_available()
					end,
					hl = { fg = colors.grey_fg2 },
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
					hl = { fg = colors.grey_fg2 },
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
					hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
				}
				components.active[3][2] = {
					provider = "git_branch",
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 70 end,
					hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
					icon = "  ",
				}
				components.active[3][3] = {
					provider = "git_diff_added",
					hl = { fg = colors.green, bg = colors.statusline_bg },
					icon = "  ",
				}
				components.active[3][4] = {
					provider = "git_diff_changed",
					hl = { fg = colors.yellow, bg = colors.statusline_bg },
					icon = "  ",
				}
				components.active[3][5] = {
					provider = "git_diff_removed",
					hl = { fg = colors.baby_pink, bg = colors.statusline_bg },
					icon = "  ",
				}
				components.active[3][6] = {
					provider = " "..statusline_style.left,
					hl = { fg = colors.one_bg2, bg = colors.statusline_bg },
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
					["s"] = { "SELECT", colors.nord_blue },
					["S"] = { "S-LINE", colors.nord_blue },
					[""] = { "S-BLOCK", colors.nord_blue },
					["c"] = { "COMMAND", colors.pink },
					["cv"] = { "COMMAND", colors.pink },
					["ce"] = { "COMMAND", colors.pink },
					["r"] = { "PROMPT", colors.teal },
					["rm"] = { "MORE", colors.teal },
					["r?"] = { "CONFIRM", colors.teal },
					["!"] = { "SHELL", colors.green },
				}
				components.active[3][7] = {
					provider = statusline_style.left,
					hl = function() return { fg = mode_colors[vim.fn.mode()][2], bg = colors.one_bg2 } end,
				}
				components.active[3][8] = {
					provider = statusline_style.vi_mode_icon,
					hl = function() return { fg = colors.statusline_bg, bg = mode_colors[vim.fn.mode()][2] } end,
				}
				components.active[3][9] = {
					provider = function() return " "..mode_colors[vim.fn.mode()][1].." " end,
					hl = function() return { fg = mode_colors[vim.fn.mode()][2], bg = colors.one_bg } end,
				}
				components.active[3][10] = {
					provider = statusline_style.left,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 90 end,
					hl = { fg = colors.grey, bg = colors.one_bg },
				}
				components.active[3][11] = {
					provider = statusline_style.left,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 90 end,
					hl = { fg = colors.green, bg = colors.grey },
				}
				components.active[3][12] = {
					provider = statusline_style.position_icon,
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
						return result.."%%"
					end,
					enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 90 end,
					hl = { fg = colors.green, bg = colors.one_bg },
				}
				require("feline").setup({
					colors = { fg = colors.grey_fg, bg = colors.statusline_bg },
					components = components,
				})
			end,
		})
		use({
			"akinsho/bufferline.nvim",
			after = "nvim-web-devicons",
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
						buffer_selected = {
							guifg = colors.white,
							guibg = colors.black,
							gui = "bold",
						},
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
						tab_selected = { guifg = colors.black2, guibg = colors.nord_blue },
						tab_close = { guifg = colors.red, guibg = colors.black },
					},
				})
			end,
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				require("indent_blankline").setup({
					char = "▏",
					show_trailing_blankline_indent = false,
					show_first_indent_level = false,
					buftype_exclude = { "terminal" },
					filetype_exclude = {
						"help",
						"terminal",
						"dashboard",
						"packer",
						"lspinfo",
						"TelescopePrompt",
						"TelescopeResults",
					},
				})
			end,
		})
		use({
			"norcalli/nvim-colorizer.lua",
			event = "BufRead",
			config = function() require("colorizer").setup({ "*" }, { names = false }) end,
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			event = "BufRead",
			run = "<cmd>TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					matchup = { enable = true },
					highlight = { enable = true, use_languagetree = true },
					ensure_installed = {
						"bash",
						"bibtex",
						"c",
						"cmake",
						"cpp",
						"css",
						"dockerfile",
						"go",
						"html",
						"java",
						"javascript",
						"json",
						"latex",
						"lua",
						"perl",
						"php",
						"python",
						"r",
						"regex",
						"rust",
						"toml",
						"typescript",
						"verilog",
						"vim",
						"yaml",
					},
				})
			end,
		})
		use({ "nvim-treesitter/playground", after = "nvim-treesitter" })
		use("folke/lua-dev.nvim")
		use({
			"neovim/nvim-lspconfig",
			event = "BufReadPre",
			config = function()
				vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError" })
				vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticHint" })
				vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
				vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
				vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
				vim.diagnostic.config( { virtual_text = false })
				local function on_attach(_, bufnr)
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
					bufmap("n", "<leader>rn", "<cmd>lua rename()<CR>", opts)
					bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
					bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
					bufmap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
					bufmap("n", "gx", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
					bufmap("n", "gz", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
					bufmap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
					bufmap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
					bufmap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
					vim.cmd("autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })")
				end
				local lspconfig = require("lspconfig")
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
				lspconfig.bashls.setup({ on_attach = on_attach, capabilities = capabilities })
				lspconfig.clangd.setup({ on_attach = on_attach, capabilities = capabilities })
				lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
				lspconfig.rust_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })
				lspconfig.sumneko_lua.setup(require("lua-dev").setup({
					lspconfig = {
						on_attach = on_attach,
						capabilities = capabilities,
						cmd = { "lua-language-server" }
					}
				}))
				lspconfig.texlab.setup( { on_attach = on_attach, capabilities = capabilities })
			end,
		})
		use({
			"https://gitlab.com/yorickpeterse/nvim-dd.git",
			after = "nvim-lspconfig",
			config = function() require("dd").setup({ timeout = 0 }) end
		})
		use({
			"ray-x/lsp_signature.nvim",
			after = "nvim-dd.git",
			config = function() require("lsp_signature").setup({ doc_lines = 0, hint_enable = false }) end,
		})
		use({
			"andymass/vim-matchup",
			opt = true,
			setup = function() vim.defer_fn(function() require("packer").loader("vim-matchup") end, 0) end,
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
			"folke/trouble.nvim",
			after = "nvim-lspconfig",
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
		use({ "rafamadriz/friendly-snippets", event = "InsertEnter" })
		use({
			"hrsh7th/nvim-cmp",
			module = "cmp",
			after = "friendly-snippets",
			config = function()
				local icons = {
					Text = "",
					Method = "",
					Function = "",
					Constructor = "",
					Field = "ﰠ",
					Variable = "",
					Class = "ﴯ",
					Interface = "",
					Module = "",
					Property = "ﰠ",
					Unit = "塞",
					Value = "",
					Enum = "",
					Keyword = "",
					Snippet = "",
					Color = "",
					File = "",
					Reference = "",
					Folder = "",
					EnumMember = "",
					Constant = "",
					Struct = "פּ",
					Event = "",
					Operator = "",
					TypeParameter = "",
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
		use({ "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp", after = "nvim-lspconfig" })
		use({ "hrsh7th/cmp-cmdline", after = "cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-buffer", after = "cmp-cmdline" })
		use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
		use({ "kdheepak/cmp-latex-symbols", after = "cmp-path" })
		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			config = function()
				require("nvim-autopairs").setup()
				require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
			end,
		})
		use({
			"blackCauldron7/surround.nvim",
			opt = true,
			config = function() require("surround").setup({ mappings_style = "sandwich" }) end,
			setup = function() vim.defer_fn(function() require("packer").loader("surround.nvim") end, 0) end
		})
		use({
			"lervag/vimtex",
			ft = "tex",
			config = function() vim.g.vimtex_view_method = "zathura" end
		})
		use {
			"lewis6991/gitsigns.nvim",
			after = "nvim-base16.lua",
			config = function() require("gitsigns").setup() end
		}
		use({
			"karb94/neoscroll.nvim",
			opt = true,
			config = function()
				require("neoscroll").setup()
				require("neoscroll.config").set_mappings({ ["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "150" } } })
				require("neoscroll.config").set_mappings({ ["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "150" } } })
			end,
			setup = function()
				vim.defer_fn(function() require("packer").loader("neoscroll.nvim") end, 0)
			end,
		})
		use({
			"folke/which-key.nvim",
			opt = true,
			config = function()
				local wk = require("which-key")
				wk.setup()
				wk.register({}, {})
			end,
			setup = function()
				vim.defer_fn(function() require("packer").loader("which-key.nvim") end, 0)
			end,
		})
		use({
			"terrortylor/nvim-comment",
			cmd = "CommentToggle",
			config = function() require("nvim_comment").setup() end,
		})
		use({
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
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
				})
				require("telescope").load_extension("fzf")
			end,
		})
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope", before = "telescope.nvim" })
		use({
			"Pocco81/TrueZen.nvim",
			config = function() require("true-zen").setup({ integrations = { feline = true, nvim_bufferline = true } }) end
		})
		use({
			"vimwiki/vimwiki",
			ft = "markdown",
			cmd = "VimwikiIndex",
			config = function() vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } } end
		})
	end,
	config = {
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
map("n", "<leader>/", "<cmd>CommentToggle<CR>")
map("v", "<leader>/", ":'<,'>CommentToggle<CR>")
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
map("n", "<C-A-n>", "<cmd>NnnExplorer<CR>")
map("t", "<C-A-n>", "<cmd>NnnExplorer<CR>")
map("n", "<C-A-b>", "<cmd>NnnExplorer %:p:h<CR>")
map("n", "<C-A-p>", "<cmd>NnnPicker<CR>")
map("t", "<C-A-p>", "<cmd>NnnPicker<CR>")
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
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
	autocmd BufWritePost init.lua source <afile> | PackerCompile
	autocmd QuickFixCmdPost [^l]* lua TroubleQuickFixPost("quickfix")
	autocmd QuickFixCmdPost l* lua TroubleQuickFixPost("loclist")
	autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup="IncSearch", timeout=1000 })
	autocmd BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	autocmd BufRead,BufWrite /run/user/1000/neomutt* lua vim.schedule(function() require("true-zen.main").main(4, "toggle") end)
	augroup end
]])

function _G.inspect(...) print(vim.inspect(...)) end

function _G.TroubleQuickFixPost(mode)
	require("trouble.providers").get(vim.api.nvim_get_current_win(),
	vim.api.nvim_get_current_buf(), function(items)
		if #items > 0 then require("trouble").open({ mode = mode }) end
	end, { mode = mode })
	vim.cmd("doautocmd User StabilizeRestore")
end

function _G.vimgrepprompt()
	local pattern = vim.fn.input("vimgrep pattern: ")
	if pattern and pattern ~= "" then
		local ok = vim.F.npcall(vim.cmd, "vimgrep /"..pattern.."/j %")
		vim.schedule(function() print(ok and " " or "No results") end)
	end
end

function _G.rename()
	local rename = "textDocument/rename"
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
		titlehighlight = "TelescopePromptTitle",
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
	vim.api.nvim_buf_set_keymap(0, "i", "<CR>", "<cmd>stopinsert | lua _rename('"..currName.."')<CR>", map_opts)
	vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<cmd>stopinsert | lua _rename('"..currName.."')<CR>", map_opts)

	local function handler(err, result, ctx, config)
		if err then vim.notify(("Error running lsp query '%s': %s"):format(rename, err), vim.log.levels.ERROR) end
		local new
		if result and result.changes then
			local msg = ""
			for f, c in pairs(result.changes) do
				new = c[1].newText
				msg = msg..("%d changes -> %s"):format(#c, f:gsub("file://",""):gsub(vim.fn.getcwd(),".")).."\n"
				msg = msg:sub(1, #msg - 1)
				vim.notify(msg, vim.log.levels.INFO, { title = ("Rename: %s -> %s"):format(currName, new) })
			end
		end
		vim.lsp.handlers[rename](err, result, ctx, config)
	end

	function _G._rename(curr)
		local newName = vim.trim(vim.fn.getline('.'))
		vim.api.nvim_win_close(win, true)
		if #newName > 0 and newName ~= curr then
			local params = vim.lsp.util.make_position_params()
			params.newName = newName
			vim.lsp.buf_request(0, rename, params, handler)
		end
	end
end

_G.colors = {
	red  = "#BF616A", black  = "#2E3440", pmenu_bg  = "#A3BE8C", folder_bg     = "#7797B7",
	sun  = "#E1C181", green  = "#A3BE8C", grey_fg   = "#565C68", nord_blue     = "#81A1C1",
	blue = "#7797B7", white  = "#ABB2BF", lightbg   = "#3F4551", light_grey    = "#646A76",
	cyan = "#9AAFE6", black2 = "#343A46", one_bg2   = "#464C58", dark_purple   = "#B48EAD",
	grey = "#4B515D", one_bg = "#373D49", one_bg3   = "#494F5B", darker_black  = "#2A303C",
	line = "#3A404C", orange = "#E39A83", grey_fg2  = "#606672", statusline_bg = "#333945",
	pink = "#D57780", purple = "#AAB1BE", lightbg2  = "#393F4B", vibrant_green = "#AFCA98",
	teal = "#6484A4", yellow = "#EBCB8B", baby_pink = "#DE878F"
}
