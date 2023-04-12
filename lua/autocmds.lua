local group = a.nvim_create_augroup("AutoCommands", {clear = true})
a.nvim_create_autocmd("VimResized", {
  group = group,
  command = "execute 'let &ph=&lines/2'"
})
a.nvim_create_autocmd("Filetype", {
  pattern = "sh",
  group = group,
  command = "setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4"
})
a.nvim_create_autocmd({"FocusLost", "InsertLeave", "CursorHold"}, {
  group = group,
  command = "silent! update"
})
a.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "[^l]*",
  group = group,
  callback = function() TroubleQuickFixPost("quickfix") end,
})
a.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "l*",
  group = group,
  callback = function() TroubleQuickFixPost("loclist") end,
})
a.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function() vim.highlight.on_yank({higroup = "IncSearch", timeout = 1000}) end,
})
a.nvim_create_autocmd("BufReadPost", {
  group = group,
  callback = function()
    O.formatoptions:remove("r")
    O.formatoptions:remove("o")
  end,
})
a.nvim_create_autocmd("BufWritePost", {
  pattern = {"bm-files", "bm-dirs"},
  group = group,
  callback = function() os.execute("shortcuts") end,
})
a.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(args)
    local client = l.get_client_by_id(args.data.client_id)
    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, args.buf)
    end
    local function bmap(mode, lhs, rhs, opts)
      opts.buffer = 0
      map(mode, lhs, rhs, opts)
    end
    bmap("n", "gD", function() l.buf.declaration() end, {desc = "Go to declaration"})
    bmap("n", "gd", function() l.buf.definition() end, {desc = "Go to definition"})
    bmap("n", "K", function() l.buf.hover() end, {desc = "Hover symbol"})
    bmap("n", "gi", function() l.buf.implementation() end, {desc = "Go to implementation"})
    bmap("n", "gk", function() l.buf.signature_help() end, {desc = "Hover signature help"})
    bmap("n", "<leader>wa", function() l.buf.add_workspace_folder() end, {desc = "Add workspave folder"})
    bmap("n", "<leader>wr", function() l.buf.remove_workspace_folder() end, {desc = "Remove workspace folder"})
    bmap("n", "<leader>wl", function() print(vim.inspect(l.buf.list_workspace_folders())) end,
      {desc = "List workspace folders"})
    bmap("n", "<leader>D", function() l.buf.type_definition() end, {desc = "Go to type definition"})
    bmap("n", "<leader>rn", function() l.buf.rename.float() end, {desc = "Rename symbol"})
    bmap("n", "<leader>ca", function() l.buf.code_action() end, {desc = "Code action"})
    bmap("v", "<leader>ca", function() l.buf.range_code_action() end, {desc = "Code action"})
    bmap("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", {desc = "References"})
    bmap("n", "<leader>e", function() d.open_float(0, {scope = "line"}) end, {desc = "Hover diagnistics"})
    bmap("n", "gx", function() d.goto_prev() end, {desc = "Next diagnostic"})
    bmap("n", "gz", function() d.goto_next() end, {desc = "Previous diagnostic"})
    bmap("n", "<leader>q", function() d.setloclist() end, {desc = "Setloclist"})
    bmap("n", "<leader>f", function() l.buf.formatting() end, {desc = "Format"})
  end,
})
