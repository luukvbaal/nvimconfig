_G.o = vim.o
_G.f = vim.fn
o.shadafile = "NONE"

local lazypath = f.stdpath("data").."/site/pack/lazy/start/lazy.nvim"
if not f.exists(lazypath) then
	print("Cloning lazy.nvim...")
	f.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
end

require("lazy").setup({
	root = f.stdpath("data").."/site/pack/lazy/start",
	defaults = { lazy = true },
	dev = { path = "~/dev", patterns = { "nnn.nvim", "statuscol.nvim" } },
	diff = { cmd = "diffview.nvim"},
	ui = { border = "rounded" },
	spec = "plugins",
})
