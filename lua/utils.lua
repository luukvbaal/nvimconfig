_G.P   = vim.pretty_print

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
local shortcuts = home.."/.config/nvim/shortcuts.vim"
if f.exists(shortcuts) then c.source(shortcuts) end

local shada = home.."/.local/state/nvim/shada/main.shada"
o.shadafile = shada
if f.exists(shada) then c.rshada() end
