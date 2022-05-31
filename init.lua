vim.opt.shadafile = "NONE"
vim.schedule(function()
	vim.opt.shadafile = "/home/luuk/.local/state/nvim/shada/main.shada"
	vim.cmd[[
		rshada
		source /home/luuk/.config/nvim/shortcuts.vim
	]]
end)
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = { tab = "  ", extends = "", precedes = "" }
vim.opt.title = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("sI")
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.number = true
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
vim.opt.confirm = true
vim.opt.laststatus = 3

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
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

_G.colors = {
	red  = "#BF616A", teal   = "#97B7D7", one_bg  = "#373D49", lightbg   = "#3B4252", blue         = "#81A1C1",
	cyan = "#5E81AC", black  = "#2E3440", orange  = "#D08770", one_bg2   = "#434C5E", foreground   = "#E5E9F0",
	grey = "#4B515D", green  = "#A3BE8C", purple  = "#8FBCBB", one_bg3   = "#4C566A", light_grey   = "#646A76",
	line = "#3A404C", white  = "#D8DEE9", yellow  = "#EBCB8B", lightbg2  = "#393F4B", dark_purple  = "#B48EAD",
	pink = "#D57780", black2 = "#343A46", grey_fg = "#606672", baby_pink = "#DE878F", darker_black = "#2A303C",
}

pcall(require, "impatient")
pcall(require, "packer_compiled")
require("packer").startup({ function(use)
	use("lewis6991/impatient.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({
		"feline-nvim/feline.nvim",
		config = function()
			local lsp = require("feline.providers.lsp")
			local lsp_severity = vim.diagnostic.severity
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
					local icon = require("nvim-web-devicons").get_icon(filename, vim.fn.expand("%:e"))
					if icon == nil then return " " end
					return " "..icon.." "..filename.." "
				end,
				enabled = function() return vim.api.nvim_win_get_width(0) > 70 end,
				hl = { fg = colors.white, bg = colors.lightbg },
				right_sep = {
					str = icons.right,
					hl = { fg = colors.lightbg, bg = colors.lightbg2 },
				},
			}
			components.active[1][3] = {
				provider = function() return "  "..vim.fn.fnamemodify(vim.fn.getcwd(), ":t").." " end,
				enabled = function() return vim.api.nvim_win_get_width(0) > 80 end,
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
				provider = function() return vim.lsp.get_active_clients() and "  LSP" or "" end,
				enabled = function() return vim.api.nvim_win_get_width(0) > 70 end,
				hl = { fg = colors.grey_fg, bg = colors.black2 },
			}
			components.active[3][2] = {
				provider = "git_branch",
				enabled = function() return vim.api.nvim_win_get_width(0) > 70 end,
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
				["nt"] = { "T-PENDING", colors.green },
				["v"] = { "VISUAL", colors.cyan },
				["V"] = { "V-LINE", colors.cyan },
				['\22'] = { "V-BLOCK", colors.cyan },
				["R"] = { "REPLACE", colors.orange },
				["Rv"] = { "V-REPLACE", colors.orange },
				["s"] = { "SELECT", colors.blue },
				["S"] = { "S-LINE", colors.blue },
				['\19'] = { "S-BLOCK", colors.blue },
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
				hl = function() return { fg = mode_colors[vim.api.nvim_get_mode().mode][2], bg = colors.one_bg2 } end,
			}
			components.active[3][8] = {
				provider = icons.vi_mode,
				hl = function() return { fg = colors.black2, bg = mode_colors[vim.api.nvim_get_mode().mode][2] } end,
			}
			components.active[3][9] = {
				provider = function() return " "..mode_colors[vim.api.nvim_get_mode().mode][1].." " end,
				hl = function() return { fg = mode_colors[vim.api.nvim_get_mode().mode][2], bg = colors.one_bg } end,
			}
			components.active[3][10] = {
				provider = icons.left,
				enabled = function() return vim.api.nvim_win_get_width(0) > 90 end,
				hl = { fg = colors.grey, bg = colors.one_bg },
			}
			components.active[3][11] = {
				provider = icons.left,
				enabled = function() return vim.api.nvim_win_get_width(0) > 90 end,
				hl = { fg = colors.green, bg = colors.grey },
			}
			components.active[3][12] = {
				provider = icons.position,
				enabled = function() return vim.api.nvim_win_get_width(0) > 90 end,
				hl = { fg = colors.black, bg = colors.green },
			}
			components.active[3][13] = {
				provider = "position",
				hl = { fg = colors.green, bg = colors.one_bg },
			}
			components.active[3][14] = {
				provider = function()
					local current_line = vim.fn.line(".")
					if current_line == 1 then return " ﬢﬢ"
					elseif current_line == vim.fn.line("$") then return "ﬠﬠﬠ"
					end
					local result, _ = math.modf((current_line / vim.fn.line("$")) * 100)
					return " "..result.."%%"
				end,
				enabled = function() return vim.api.nvim_win_get_width(0) > 90 end,
				hl = { fg = colors.green, bg = colors.one_bg },
			}
			require("feline").setup({
				theme = { fg = colors.grey_fg, bg = colors.black2 },
				components = components,
				force_inactive = {}
			})
			require("feline").winbar.setup()
		end,
	})
	use({ "junegunn/fzf.vim" })
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				options = {
					separator_style = "thin",
					diagnostics = "nvim_lsp",
					custom_filter = function(buf)
						local ignored = { "dap-repl" }
						if not vim.tbl_contains(ignored, vim.api.nvim_buf_get_option(buf, "filetype")) then return true end
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
			local nnn = require("nnn")
			nnn.setup({
				explorer = { cmd = "nnn -Go", session = "shared", side = "topleft", tabs = true },
				picker = { cmd = "tmux new-session nnn -GPp", style = { border = "rounded" } },
				replace_netrw = "explorer",
				windownav = { left = "<C-h>", right = "<C-l>" },
				auto_open = { setup = "picker", tabpage = "explorer", empty = true },
				auto_close = true,
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
	})
	use("wbthomason/packer.nvim")
	use({
		"SmiteshP/nvim-gps",
		event = "CursorHold",
		config = function()
			require("nvim-gps").setup({
				separator = "  ",
				icons = { ["container-name"] = " " }
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
			vim.lsp.buf.rename = {
				float = function()
					local currName = vim.fn.expand("<cword>")
					local tshl = require("nvim-treesitter-playground.hl-info").get_treesitter_hl()
					if tshl and #tshl > 0 then
						local ind = tshl[#tshl]:match("^.*()%*%*.*%*%*")
						tshl = tshl[#tshl]:sub(ind + 2, -3)
						local allowed = { "TSVariable", "TSFuncBuiltin", "TSFunction", "TSField", "TSProperty" }
						if not vim.tbl_contains(allowed, tshl) then return end
					else
						return
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
					vim.api.nvim_buf_set_keymap(0, "i", "<CR>", "<cmd>stopinsert | lua vim.lsp.buf.rename.apply('"..currName.."',"..win..")<CR>", map_opts)
					vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<cmd>stopinsert | lua vim.lsp.buf.rename.apply('"..currName.."',"..win..")<CR>", map_opts)
				end,
				apply = function(curr, win)
					local newName = vim.trim(vim.fn.getline('.'))
					vim.api.nvim_win_close(tonumber(win), true)
					if #newName > 0 and newName ~= curr then
						local params = vim.lsp.util.make_position_params()
						params.newName = newName
						vim.lsp.buf_request(0, "textDocument/rename", params, function(err, res, ctx)
							if err then vim.notify(("Error running lsp query 'rename': "..err), vim.log.levels.ERROR) end
							if res and res.changes then
								local msg = ""
								for f, c in pairs(res.changes) do
									local new = c[1].newText
									msg = msg..("%d changes -> %s"):format(#c, f:gsub("file://",""):gsub(vim.fn.getcwd(),".")).."\n"
									msg = msg:sub(1, #msg - 1)
									vim.notify(msg, vim.log.levels.INFO, { title = ("Rename: %s -> %s"):format(vim.fn.expand("<cword>"), new) })
								end
							end
							vim.lsp.util.apply_workspace_edit(res, vim.lsp.get_client_by_id(ctx.client_id).offset_encoding)
						end)
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
				bufmap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
				bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
				bufmap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>", opts)
				bufmap("n", "gx", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
				bufmap("n", "gz", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
				bufmap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
				bufmap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
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
			local win = require("lspconfig.ui.windows")
			local _default_opts = win.default_opts
			win.default_opts = function(options)
			   local opts = _default_opts(options)
			   opts.border = "rounded"
			   return opts
			end
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
				ls.builtins.diagnostics.vale.with({ args = '--config="$XDG_CONFIG_HOME/vale/vale.ini"' }),
			}
			ls.setup({ sources = sources })
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
	use({ "j-hui/fidget.nvim",
		after = "lsp_signature.nvim",
		config = function() require("fidget").setup() end
	})
	use({ "RRethy/vim-illuminate", after = "fidget.nvim" })
	use({
		"~/dev/stabilize.nvim",
		after = "vim-illuminate",
		config = function() require("stabilize").setup({ forcemark = "f", nested = "QuickFixCmdPost,DiagnosticChanged *" }) end,
	})
	use({ "nvim-treesitter/playground", after = "stabilize.nvim" })
	use({
		"rcarriga/nvim-notify",
		after = "playground",
		config = function()
			require("notify").setup({ max_width = 40 })
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
				window = {
					completion = cmp.config.window.bordered({ winhighlight = "" }),
					documentation = cmp.config.window.bordered({ winhighlight = "" }),
				},
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
					format = function(_, item)
						item.kind = icons[item.kind]
						return item
					end,
					fields = { 'kind', 'abbr', 'menu' }
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
		"echasnovski/mini.nvim",
		after = "cmp-latex-symbols",
		config = function()
			require("mini.surround").setup({ search_method = "cover_or_nearest" })
			require("mini.pairs").setup()
		end,
	})
	use({
		"numToStr/Comment.nvim",
		after = "mini.nvim",
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
	use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })
	use({
		"mfussenegger/nvim-dap",
		module = "dap",
		config = function()
			local dap = require("dap")
			dap.configurations.python = { {
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				pythonPath = function()
					return "/usr/bin/python"
				end
			}}
			dap.adapters.lldb = {
			  type = 'executable',
			  command = '/usr/bin/lldb-vscode',
			  name = "lldb"
			}
			dap.configurations.c = {
			  {
			    name = "Launch",
			    type = "lldb",
			    request = "launch",
			    program = function() return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') end,
			    cwd = '${workspaceFolder}',
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
			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticHint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
		end
	})
	use {
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup({
				sidebar = {
					elements = {
						{ id = "scopes", size = 0.52 },
						{ id = "breakpoints", size = 0.16 },
						{ id = "stacks", size = 0.16 },
						{ id = "watches", size = 0.16 },
					},
				}
			})
		end,
		module = "dapui"
	}
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function() require("nvim-dap-virtual-text").setup() end
	})
	use({
		"lervag/vimtex",
		cmd = "VimtexInverseSearch",
		ft = "tex",
		config = function() vim.g.vimtex_view_method = "zathura" end
	})
	use({
		"sindrets/diffview.nvim",
		module = "neogit",
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
		cmd = "VimwikiIndex",
		setup = function() vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } } end
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
map("n", "gx", "<cmd>silent !xdg-open <cfile><CR>")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "k", "(v:count > 5 ? (\"m'\" . v:count1) : \"\") . (v:count || mode(1)[0:1] == \"no\" ? \"\" : \"g\") . \"k\"", { expr = true })
map("n", "j", "(v:count > 5 ? (\"m'\" .v:count1) : \"\") . (v:count || mode(1)[0:1] == \"no\" ? \"\" : \"g\") . \"j\"", { expr = true })
map("n", "<leader>k", ":m .-2<CR>==")
map("n", "<leader>j", ":m .+1<CR>==")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("i", "<C-k>", "<Esc>:m .-2<CR>==")
map("i", "<C-j>", "<Esc>:m .+1<CR>==")
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
map("n", "<leader>gc", "<cmd>lua require('neogit').open({ cwd = vim.fn.expand('%:h') })<CR>")
map("n", "<F5>", "<cmd>lua require('dap').continue() require('dapui').open()<CR>")
map("n", "<F6>", "<cmd>lua require('dapui').toggle()<CR>")
map("n", "<F10>", "<cmd>lua require('dap').step_over()<CR>")
map("n", "<F11>", "<cmd>lua require('dap').step_into()<CR>")
map("n", "<F12>", "<cmd>lua require('dap').step_out()<CR>")
map("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
map("n", "<leader>B", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<leader>lp", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>")
map("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>")
map("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>")

local group = vim.api.nvim_create_augroup("AutoCommands", { clear = true })
vim.api.nvim_create_autocmd("Filetype", { pattern = "sh", group = group,
	command = "setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4" })
vim.api.nvim_create_autocmd("FocusLost,InsertLeave,CursorHold", { group = group,
	command = "silent! update" })
vim.api.nvim_create_autocmd("QuickFixCmdPost", { pattern = "[^l]*", group = group,
	callback = function() TroubleQuickFixPost("quickfix") end })
vim.api.nvim_create_autocmd("QuickFixCmdPost", { pattern = "l*", group = group,
	callback = function() TroubleQuickFixPost("loclist") end })
vim.api.nvim_create_autocmd("TextYankPost", { group = group,
	callback = function() vim.highlight.on_yank({ higroup="IncSearch", timeout=1000 }) end })
vim.api.nvim_create_autocmd("BufRead,BufWrite", { pattern = "/run/user/1000/neomutt*", group = group,
	callback = function() vim.schedule(function() vim.cmd("TZAtaraxis") end) end })

_G.P = vim.pretty_print

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

local hl = vim.api.nvim_set_hl
hl(0, "Normal", { fg = colors.foreground, bg = colors.black })
hl(0, "NormalFloat", { fg = colors.foreground, bg = colors.black })
hl(0, "FloatBorder", { fg = colors.lightbg })
hl(0, "Bold", { bold = true })
hl(0, "Debug", { fg = colors.pink })
hl(0, "Directory", { fg = colors.blue })
hl(0, "Error", { fg = colors.black, bg = colors.pink })
hl(0, "ErrorMsg", { fg = colors.pink, bg = colors.black })
hl(0, "Exception", { fg = colors.pink })
hl(0, "FoldColumn", { fg = colors.teal, bg = colors.lightbg })
hl(0, "Folded", { fg = colors.one_bg3, bg = colors.lightbg })
hl(0, "IncSearch", { fg = colors.dark_purple })
hl(0, "Macro", { fg = colors.pink })
hl(0, "MatchParen", { bg = colors.lightbg })
hl(0, "ModeMsg", { fg = colors.green })
hl(0, "MoreMsg", { fg = colors.green })
hl(0, "Question", { fg = colors.blue })
hl(0, "Search", { fg = colors.dark_purple })
hl(0, "Substitute", { fg = colors.lightbg, bg = colors.yellow })
hl(0, "SpecialKey", { fg = colors.one_bg3 })
hl(0, "TooLong", { fg = colors.pink })
hl(0, "Underlined", { fg = colors.pink })
hl(0, "Visual", { bg = colors.one_bg2 })
hl(0, "VisualNOS", { fg = colors.pink })
hl(0, "WarningMsg", { fg = colors.pink })
hl(0, "WildMenu", { fg = colors.pink, bg = colors.yellow })
hl(0, "Title", { fg = colors.blue })
hl(0, "Conceal", { fg = colors.blue, bg = colors.black })
hl(0, "Cursor", { fg = colors.black, bg = colors.white })
hl(0, "NonText", { fg = colors.one_bg3 })
hl(0, "LineNr", { fg = colors.grey })
hl(0, "SignColumn", { fg = colors.one_bg3 })
hl(0, "StatusLineNC", { fg = colors.one_bg3, underline = true })
hl(0, "StatusLine", { fg = colors.one_bg2, underline = true })
hl(0, "VertSplit", { fg = colors.one_bg2 })
hl(0, "ColorColumn", { bg = colors.lightbg })
hl(0, "CursorColumn", { bg = colors.lightbg })
hl(0, "CursorLine", { bg = colors.lightbg })
hl(0, "CursorLinenr", { fg = colors.white, bg = colors.black })
hl(0, "QuickFixLine", { bg = colors.lightbg })
hl(0, "Pmenu", { fg = colors.one_bg, bg = colors.black2 })
hl(0, "PmenuSbar", { fg = colors.one_bg2 })
hl(0, "PmenuSel", { fg = colors.teal, bg = colors.lightbg })
hl(0, "PmenuThumb", { fg = colors.blue })
hl(0, "TabLine", { fg = colors.one_bg3, bg = colors.lightbg })
hl(0, "TabLineFill", { fg = colors.one_bg3, bg = colors.lightbg })
hl(0, "TabLineSel", { fg = colors.green, bg = colors.lightbg })

-- Standard syntax highlighting
hl(0, "Boolean", { fg = colors.orange })
hl(0, "Character", { fg = colors.pink })
hl(0, "Comment", { fg = colors.grey_fg, italic = true })
hl(0, "Conditional", { fg = colors.green })
hl(0, "Constant", { fg = colors.cyan })
hl(0, "Define", { fg = colors.dark_purple })
hl(0, "Delimiter", { fg = colors.dark_purple })
hl(0, "Float", { fg = colors.orange })
hl(0, "Function", { fg = colors.yellow })
hl(0, "Identifier", { fg = colors.teal })
hl(0, "Include", { fg = colors.blue })
hl(0, "Keyword", { fg = colors.green })
hl(0, "Label", { fg = colors.yellow })
hl(0, "Number", { fg = colors.orange })
hl(0, "Operator", { fg = colors.white })
hl(0, "PreProc", { fg = colors.yellow })
hl(0, "Repeat", { fg = colors.cyan })
hl(0, "Special", { fg = colors.orange })
hl(0, "SpecialChar", { fg = colors.dark_purple })
hl(0, "Statement", { fg = colors.green })
hl(0, "StorageClass", { fg = colors.yellow })
hl(0, "String", { fg = colors.pink })
hl(0, "Structure", { fg = colors.dark_purple })
hl(0, "Tag", { fg = colors.yellow })
hl(0, "Todo", { fg = colors.yellow, bg = colors.lightbg })
hl(0, "Type", { fg = colors.yellow })
hl(0, "Typedef", { fg = colors.yellow })

-- Diff highlighting
hl(0, "DiffAdd", { fg = colors.green, bg = colors.lightbg })
hl(0, "DiffChange", { fg = colors.one_bg3, bg = colors.lightbg })
hl(0, "DiffDelete", { fg = colors.pink, bg = colors.lightbg })
hl(0, "DiffText", { fg = colors.blue, bg = colors.lightbg })
hl(0, "DiffAdded", { fg = colors.green, bg = colors.black })
hl(0, "DiffFile", { fg = colors.pink, bg = colors.black })
hl(0, "DiffNewFile", { fg = colors.green, bg = colors.black })
hl(0, "DiffLine", { fg = colors.blue, bg = colors.black })
hl(0, "DiffRemoved", { fg = colors.pink, bg = colors.black })

-- Git highlighting
hl(0, "gitcommitOverflow", { fg = colors.pink })
hl(0, "gitcommitSummary", { fg = colors.green })
hl(0, "gitcommitComment", { fg = colors.one_bg3 })
hl(0, "gitcommitUntracked", { fg = colors.one_bg3 })
hl(0, "gitcommitDiscarded", { fg = colors.one_bg3 })
hl(0, "gitcommitSelected", { fg = colors.one_bg3 })
hl(0, "gitcommitHeader", { fg = colors.dark_purple })
hl(0, "gitcommitSelectedType", { fg = colors.blue })
hl(0, "gitcommitUnmergedType", { fg = colors.blue })
hl(0, "gitcommitDiscardedType", { fg = colors.blue })
hl(0, "gitcommitBranch", { fg = colors.orange, bold = true })
hl(0, "gitcommitUntrackedFile", { fg = colors.yellow })
hl(0, "gitcommitUnmergedFile", { fg = colors.pink, bold = true })
hl(0, "gitcommitDiscardedFile", { fg = colors.pink, bold = true })
hl(0, "gitcommitSelectedFile", { fg = colors.green, bold = true })

-- Mail highlighting
hl(0, "mailQuoted1", { fg = colors.yellow })
hl(0, "mailQuoted2", { fg = colors.green })
hl(0, "mailQuoted3", { fg = colors.dark_purple })
hl(0, "mailQuoted4", { fg = colors.teal })
hl(0, "mailQuoted5", { fg = colors.blue })
hl(0, "mailQuoted6", { fg = colors.yellow })
hl(0, "mailURL", { fg = colors.blue })
hl(0, "mailEmail", { fg = colors.blue })

hl(0, "EndOfBuffer", { fg = colors.black })
hl(0, "NnnNormal", { bg = colors.black })
hl(0, "NvimInternalError", { fg = colors.red })
hl(0, "GitSignsAdd", { fg = colors.blue })
hl(0, "GitSignsChange", { fg = colors.grey_fg })
hl(0, "GitSignsModified", { fg = colors.blue })
hl(0, "CmpItemAbbr", { fg = colors.white })
hl(0, "CmpItemAbbrMatch", { fg = colors.teal })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = colors.teal })
hl(0, "CmpItemMenu", { fg = colors.white })
hl(0, "CmpItemKind", { fg = colors.teal })
hl(0, "CmpItemKindText", { fg = colors.teal })
hl(0, "CmpItemKindMethod", { fg = colors.teal })
hl(0, "CmpItemKindFunction", { fg = colors.teal })
hl(0, "CmpItemKindConstructor", { fg = colors.teal })
hl(0, "CmpItemKindField", { fg = colors.teal })
hl(0, "CmpItemKindVariable", { fg = colors.teal })
hl(0, "CmpItemKindClass", { fg = colors.teal })
hl(0, "CmpItemKindInterface", { fg = colors.teal })
hl(0, "CmpItemKindModule", { fg = colors.teal })
hl(0, "CmpItemKindProperty", { fg = colors.teal })
hl(0, "CmpItemKindUnit", { fg = colors.teal })
hl(0, "CmpItemKindValue", { fg = colors.teal })
hl(0, "CmpItemKindEnum", { fg = colors.teal })
hl(0, "CmpItemKindKeyword", { fg = colors.teal })
hl(0, "CmpItemKindSnippet", { fg = colors.teal })
hl(0, "CmpItemKindColor", { fg = colors.teal })
hl(0, "CmpItemKindFile", { fg = colors.teal })
hl(0, "CmpItemKindReference", { fg = colors.teal })
hl(0, "CmpItemKindFolder", { fg = colors.teal })
hl(0, "CmpItemKindEnumMember", { fg = colors.teal })
hl(0, "CmpItemKindConstant", { fg = colors.teal })
hl(0, "CmpItemKindStruct", { fg = colors.teal })
hl(0, "CmpItemKindEvent", { fg = colors.teal })
hl(0, "CmpItemKindOperator", { fg = colors.teal })
hl(0, "CmpItemKindTypeParameter", { fg = colors.teal })
hl(0, "IndentBlanklineChar", { fg = colors.line })
hl(0, "DiagnosticError", { fg = colors.red })
hl(0, "DiagnosticWarn", { fg = colors.yellow })
hl(0, "DiagnosticInfo", { fg = colors.green })
hl(0, "DiagnosticHint", { fg = colors.purple })
hl(0, "LspReferenceRead", { bg = colors.lightbg })
hl(0, "LspReferenceWrite", { bg = colors.lightbg })
hl(0, "NeogitNotificationError", { fg = colors.red })
hl(0, "NeogitNotificationWarn", { fg = colors.yellow })
hl(0, "NeogitNotificationInfo", { fg = colors.green })
hl(0, "NeogitDiffAddHighlight", { fg = colors.green, bg = colors.one_bg })
hl(0, "NeogitDiffDeleteHighlight", { fg = colors.red, bg = colors.one_bg })
hl(0, "NeogitDiffContextHighlight", { fg = colors.white, bg = colors.one_bg })
hl(0, "NeogitHunkHeader", { fg = colors.red, bg = colors.one_bg })
hl(0, "NeogitHunkHeaderHighlight", { fg = colors.yellow, bg = colors.one_bg })
hl(0, "NotifyINFOBorder", { fg = colors.green })
hl(0, "NotifyINFOTitle", { fg = colors.green })
hl(0, "NotifyINFOIcon", { fg = colors.green })
hl(0, "NotifyWARNBorder", { fg = colors.yellow })
hl(0, "NotifyWARNTitle", { fg = colors.yellow })
hl(0, "NotifyWARNIcon", { fg = colors.yellow })
hl(0, "NotifyERRORBorder", { fg = colors.red })
hl(0, "NotifyERRORTitle", { fg = colors.red })
hl(0, "NotifyERRORIcon", { fg = colors.red })
hl(0, "TelescopeBorder", { fg = colors.one_bg })
hl(0, "TelescopePreviewTitle", { fg = colors.green })
hl(0, "TelescopePromptTitle", { fg = colors.blue })
hl(0, "TelescopeResultsTitle", { fg = colors.red })
hl(0, "TelescopePreviewBorder", { fg = colors.grey })
hl(0, "TelescopePromptBorder", { fg = colors.line })
hl(0, "TelescopeResultsBorder", { fg = colors.line })
hl(0, "WhichKeyValue", { fg = colors.purple })
hl(0, "DapUIVariable", { fg = colors.foreground })
hl(0, "DapUIScope", { fg = colors.purple })
hl(0, "DapUIType", { fg = colors.dark_purple  })
hl(0, "DapUIValue", { fg = colors.foreground })
hl(0, "DapUIModifiedValue", { fg = colors.purple, bold = true })
hl(0, "DapUIDecoration", { fg = colors.purple })
hl(0, "DapUIThread", { fg = colors.green })
hl(0, "DapUIStoppedThread", { fg = colors.purple })
hl(0, "DapUIFrameName", { fg = colors.foreground })
hl(0, "DapUISource", { fg = colors.dark_purple })
hl(0, "DapUILineNumber", { fg = colors.purple })
hl(0, "DapUIFloatBorder", { fg = colors.purple })
hl(0, "DapUIWatchesEmpty", { fg = colors.red })
hl(0, "DapUIWatchesValue", { fg = colors.green })
hl(0, "DapUIWatchesError", { fg = colors.red })
hl(0, "DapUIBreakpointsPath", { fg = colors.purple })
hl(0, "DapUIBreakpointsInfo", { fg = colors.green })
hl(0, "DapUIBreakpointsCurrentLine", { fg = colors.green, bold = true })
hl(0, "DapUIBreakpointsLine", { fg = colors.purple })
