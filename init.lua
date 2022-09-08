-- use({
--      "lewis6991/satellite.nvim",
-- 	after = "which-key.nvim",
-- 	config = function() require("satellite").setup() end
-- })
_G.a   = vim.api
_G.c   = vim.cmd
_G.d   = vim.diagnostic
_G.f   = vim.fn
_G.g   = vim.g
_G.l   = vim.lsp
_G.npc = vim.F.npcall
_G.o   = vim.opt
_G.P   = vim.pretty_print
_G.S   = vim.schedule
_G.tc  = vim.tbl_contains
_G.te  = vim.tbl_extend

o.shadafile = "NONE"
o.wrap = false
o.list = true
o.listchars = { tab = "  ", extends = "", precedes = "" }
o.title = true
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.shortmess:append("sI")
o.smartcase = true
o.ignorecase = true
o.number = true
o.relativenumber = true
o.splitbelow = true
o.splitright = true
npc(function() o.splitscroll = false end)
o.termguicolors = true
o.timeoutlen = 400
o.undofile = true
o.updatetime = 250
o.spell = true
o.spelloptions = "camel"
o.shell = "/bin/sh"
o.signcolumn = "auto:2"
o.completeopt = "menu,menuone,noselect"
o.showmode = false
o.confirm = true
o.laststatus = 3
o.cmdheight = 0

g.mapleader = " "
g.maplocalleader = ","
g.loaded_2html_plugin = 1
g.loaded_fzf = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logiPat = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_rrhelper = 1
g.loaded_spellfile_plugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

_G.colors = {
	red  = "#BF616A", teal   = "#97B7D7", one_bg  = "#373D49", lightbg   = "#3B4252", blue         = "#81A1C1",
	cyan = "#5E81AC", black  = "#2E3440", orange  = "#D08770", one_bg2   = "#434C5E", foreground   = "#E5E9F0",
	grey = "#4B515D", green  = "#A3BE8C", purple  = "#8FBCBB", one_bg3   = "#4C566A", light_grey   = "#646A76",
	line = "#3A404C", white  = "#D8DEE9", yellow  = "#EBCB8B", lightbg2  = "#393F4B", dark_purple  = "#B48EAD",
	pink = "#D57780", black2 = "#343A46", grey_fg = "#606672", baby_pink = "#DE878F", darker_black = "#2A303C",
}

function _G.stat(name, type)
	local stats = vim.loop.fs_stat(name)
	return stats and stats.type == type
end

function _G.map(mode, lhs, rhs, opts, buf)
	local options = { noremap = true, silent = true }
	if opts then options = te("force", options, opts) end
	if buf then a.nvim_buf_set_keymap(buf, mode, lhs, rhs, options)
	else a.nvim_set_keymap(mode, lhs, rhs, options) end
end

local hl = a.nvim_set_hl
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
hl(0, "Pmenu", { fg = colors.teal, bg = colors.black2 })
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
hl(0, "IndentBlanklineContextChar", { fg = colors.one_bg3 })
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

pcall(require, "impatient")
pcall(require, "packer_compiled")
S(function()

function _G.TroubleQuickFixPost(mode)
	require("trouble.providers").get(a.nvim_get_current_win(),
	a.nvim_get_current_buf(), function(items)
		if #items > 0 then require("trouble").open({ mode = mode }) end
	end, { mode = mode })
end

function _G.vimgrepprompt()
	local pattern = f.input("vimgrep pattern: ")
	if pattern and pattern ~= "" then
		local ok = npc(c.vimgrep("'/"..pattern.."/j %'"))
		S(function() print(ok and " " or "No results") end)
	end
end

local home = os.getenv("HOME")
local install_path = f.stdpath("data").."/site/pack/packer/start/packer.nvim"

if not stat(install_path, "directory") then
	print("Cloning packer...")
	Packer_bootstrap = f.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

local shada = home.."/.local/state/nvim/shada/main.shada"
o.shadafile = shada
if stat(shada, "file") then c.rshada() end
local shortcuts = home.."/.config/nvim/shortcuts.vim"
if stat(shortcuts, "file") then c.source(shortcuts) end

g.terminal_color_0  = colors.black
g.terminal_color_1  = colors.red
g.terminal_color_2  = colors.green
g.terminal_color_3  = colors.yellow
g.terminal_color_4  = colors.blue
g.terminal_color_5  = colors.dark_purple
g.terminal_color_6  = colors.cyan
g.terminal_color_7  = colors.foreground
g.terminal_color_8  = colors.one_bg3
g.terminal_color_9  = colors.red
g.terminal_color_10 = colors.green
g.terminal_color_11 = colors.yellow
g.terminal_color_12 = colors.blue
g.terminal_color_13 = colors.dark_purple
g.terminal_color_14 = colors.cyan
g.terminal_color_15 = colors.purple

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
map("v", ">", ">gv")
map("v", "<", "<gv")
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
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>")
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>")
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>")
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>")
map("n", "<leader>xg", "<cmd>lua vimgrepprompt()<CR>")
map("n", "<C-A-j>", "", {	desc = "Trouble next item",
	callback = function() require('trouble').next({skip_groups = true, jump = true}) end })
map("n", "<C-A-k>", "", { desc = "Trouble previous item",
	callback = function() require('trouble').previous({skip_groups = true, jump = true}) end })
map("n", "<leader>gc", "", { desc = "Neogit open",
	callback = function() require('neogit').open({ cwd = f.expand('%:h') }) end })
map("n", "<F5>", "", { desc = "DAP continue()",
	callback = function() require('dap').continue() end })
map("n", "<F6>", "", { desc = "DAPUI Toggle",
	callback = function() require('dapui').toggle() end })
map("n", "<F10>", "", { desc = "DAP Step Over",
	callback = function() require('dap').step_over() end })
map("n", "<F11>", "", { desc = "DAP Step Into",
	callback = function() require('dap').step_into() end })
map("n", "<F12>", "", { desc = "DAP Step Out",
	callback = function() require('dap').step_out() end })
map("n", "<leader>b", "", { desc = "DAP Toggle Breakpoint",
	callback = function() require('dap').toggle_breakpoint() end })
map("n", "<leader>B", "", { desc = "DAP Set Conditional Breakpoint",
	callback = function() require('dap').set_breakpoint(f.input('Breakpoint condition: ')) end })
map("n", "<leader>lp", "", { desc = "DAP Set Log Point",
	callback = function() require('dap').set_breakpoint(nil, nil, f.input('Log point message: ')) end })
map("n", "<leader>dr", "", { desc = "DAP Open REPL",
	callback = function() require('dap').repl.open() end })
map("n", "<leader>sf", "", { desc = "Source file",
	callback = function() c.source(f.expand("%:p")) end })

local group = a.nvim_create_augroup("AutoCommands", { clear = true })
a.nvim_create_autocmd("Filetype", { pattern = "sh", group = group,
	command = "setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4" })
a.nvim_create_autocmd({ "FocusLost", "InsertLeave", "CursorHold" }, { group = group,
	command = "silent! update" })
a.nvim_create_autocmd("QuickFixCmdPost", { pattern = "[^l]*", group = group,
	callback = function() TroubleQuickFixPost("quickfix") end })
a.nvim_create_autocmd("QuickFixCmdPost", { pattern = "l*", group = group,
	callback = function() TroubleQuickFixPost("loclist") end })
a.nvim_create_autocmd("TextYankPost", { group = group,
	callback = function() vim.highlight.on_yank({ higroup="IncSearch", timeout=1000 }) end })

require("packer").startup({ function(use)
	use("lewis6991/impatient.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({
		"feline-nvim/feline.nvim",
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
				},
			})
		end,
	})
	use("nvim-lua/plenary.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		config = function() require("gitsigns").setup({trouble = true}) end
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				ensure_installed = "all",
			})
		end,
		run = ':TSUpdate'
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				char = "▏",
				show_current_context = true,
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
	use({
		stat(home.."/dev/nnn.nvim", "directory") and home.."/dev/nnn.nvim" or "luukvbaal/nnn.nvim",
		cond = function()
			local buf = a.nvim_buf_get_name(0)
			return buf == "" or stat(buf, "directory")
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
		"SmiteshP/nvim-navic",
		event = { "CursorHold", "CursorMoved" },
		config = function()
			require("nvim-navic").setup({
				separator = "  ",
				icons = { ["container-name"] = " " }
			})
		end,
	})
	use({ "folke/lua-dev.nvim", after = "nvim-navic" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "lua-dev.nvim" })
	use({
		"neovim/nvim-lspconfig",
		after = "cmp-nvim-lsp",
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
					local tshl = require("nvim-treesitter-playground.hl-info").get_treesitter_hl()
					if tshl and #tshl > 0 then
						local ind = tshl[#tshl]:match("^.*()%*%*.*%*%*")
						tshl = tshl[#tshl]:sub(ind + 2, -3)
						local allowed = { "TSVariable", "TSFuncBuiltin", "TSFunction", "TSField", "TSProperty" }
						if not tc(allowed, tshl) then return end
					else return end

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
					map("i", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts, 0)
					map("n", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts, 0)
					map("i", "<CR>", "<cmd>stopinsert | lua l.buf.rename.apply('"..currName.."',"..win..")<CR>", map_opts, 0)
					map("n", "<CR>", "<cmd>stopinsert | lua l.buf.rename.apply('"..currName.."',"..win..")<CR>", map_opts, 0)
				end,
				apply = function(curr, win)
					local newName = vim.trim(f.getline('.'))
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
			local function on_attach(client, bufnr)
				map("n", "gD", "", { desc = "Go to declaration",
					callback = function() l.buf.declaration() end }, 0)
				map("n", "gd", "", { desc = "Go to definition",
					callback = function() l.buf.definition() end }, 0)
				map("n", "K", "", { desc = "Hover symbol",
					callback = function() l.buf.hover() end }, 0)
				map("n", "gi", "", { desc = "Go to implementation",
					callback = function() l.buf.implementation() end }, 0)
				map("n", "gk", "", { desc = "Hover signature help",
					callback = function() l.buf.signature_help() end }, 0)
				map("n", "<leader>wa", "", { desc = "Add workspave folder",
					callback = function() l.buf.add_workspace_folder() end }, 0)
				map("n", "<leader>wr", "", { desc = "Remove workspace folder",
					callback = function() l.buf.remove_workspace_folder() end }, 0)
				map("n", "<leader>wl", "", { desc = "List workspace folders",
					callback = function() print(vim.inspect(l.buf.list_workspace_folders())) end }, 0)
				map("n", "<leader>D", "", { desc = "Go to type definition",
					callback = function() l.buf.type_definition() end }, 0)
				map("n", "<leader>rn", "", { desc = "Rename symbol",
					callback = function() l.buf.rename.float() end }, 0)
				map("n", "<leader>ca", "", { desc = "Code action",
					callback = function() l.buf.code_action() end }, 0)
				map("v", "<leader>ca", "", { desc = "Code action",
					callback = function() l.buf.range_code_action() end }, 0)
				map("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", { desc = "References", }, 0)
				map("n", "<leader>e", "", { desc = "Hover diagnistics",
					callback = function() d.open_float(0, { scope = 'line' }) end }, 0)
				map("n", "gx", "", { desc = "Next diagnostic",
					callback = function() d.goto_prev() end }, 0)
				map("n", "gz", "", { desc = "Previous diagnostic",
					callback = function() d.goto_next() end }, 0)
				map("n", "<leader>q", "", { desc = "Setloclist",
					callback = function() d.setloclist() end }, 0)
				map("n", "<leader>f", "", { desc = "Format",
					callback = function() l.buf.formatting() end }, 0)
				require("illuminate").on_attach(client)
				require("nvim-navic").attach(client, bufnr)
			end
			local lspconfig = require("lspconfig")
			local capabilities = l.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
			lspconfig.bashls.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })
			lspconfig.sumneko_lua.setup(require("lua-dev").setup({
				lspconfig = {
					on_attach = on_attach,
					capabilities = capabilities,
					cmd = { "lua-language-server" },
					settings = {
						Lua = {
							diagnostics = {
								disable = { "missing-parameter", "param-type-mismatch", "assign-type-mismatch", "cast-local-type" },
								globals = { "P" }
							}
						}
					}
				}
			}))
			lspconfig.texlab.setup( { on_attach = on_attach, capabilities = capabilities })
			capabilities.offsetEncoding = { "utf-16" }
			lspconfig.clangd.setup({ on_attach = on_attach, capabilities = capabilities })
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
		as = "nvim-dd",
		after = "null-ls.nvim",
		config = function()
			require("dd").setup({ timeout = 1 })
		end
	})
	use({
		"bellini666/trouble.nvim",
		after = "nvim-dd",
		config = function()
			require("trouble").setup({
				auto_open = true,
				auto_close = true,
				padding = false,
				signs = { error = "", warning = "", hint = "", information = "", other = "", },
				track_cursor = true,
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
		"andymass/vim-matchup",
		after = "vim-illuminate",
		config = function() require("nvim-treesitter.configs").setup({ matchup = { enable = true }}) end
	})
	use({ "nvim-treesitter/playground", after = "vim-matchup"})
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
	use({ "rafamadriz/friendly-snippets", event = { "CursorHold" } })
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
				}
			})
			cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })
			cmp.setup.cmdline(":", { sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }) })
			cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
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
		config = function() require("nvim-autopairs").setup() end
	})
	use({
		"kylechui/nvim-surround",
		after = "nvim-autopairs",
		config = function() require("nvim-surround").setup() end
	})
	use({
		"numToStr/Comment.nvim",
		after = "nvim-surround",
		config = function() require("Comment").setup() end,
	})
	use({
		"folke/which-key.nvim",
		after = "Comment.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup({ icons = { separator = "➡" } })
			wk.register({}, {})
		end,
	})
	use({ "github/copilot.vim", cmd = "Copilot" })
	use({
		"mfussenegger/nvim-dap",
		module = { "dap", "dapui" },
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
				type = 'executable',
				command = '/usr/bin/lldb-vscode',
				name = "lldb"
			}
			dap.configurations.c = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function() return f.input('Path to executable: ', f.getcwd() .. '/', 'file') end,
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
	})
	use {
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup({
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
				} }
			})
		end,
		module = "dapui"
	}
	use({
		"theHamsta/nvim-dap-virtual-text",
		module = "dap",
		config = function() require("nvim-dap-virtual-text").setup() end
	})
	use({
		"lervag/vimtex",
		cmd = "VimtexInverseSearch",
		ft = "tex",
		config = function() g.vimtex_view_method = "zathura" end
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
				pickers = { fd = { find_command = { "fd", ".", "~", "--type", "f", "-H" } } },
			})
			require("telescope").load_extension("fzf")
		end,
	})
	use({
		"Pocco81/true-zen.nvim",
		cmd = "TZAtaraxis",
		config = function() require("true-zen").setup() end
	})
	use({
		"vimwiki/vimwiki",
		cmd = "VimwikiIndex",
		setup = function() g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } } end
	})
	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		cmd = { "SnipRun", "SnipInfo"}
	})
	if Packer_bootstrap then
		require('packer').sync()
	end
end,
config = {
	compile_path = f.stdpath('config')..'/lua/packer_compiled.lua',
	display = {
		prompt_border = "rounded",
		open_fn = function() return require("packer.util").float({ border = "rounded" }) end
}}}) end)
