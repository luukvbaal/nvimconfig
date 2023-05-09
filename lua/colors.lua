_G.colors           = {
  red = "#BF616A",
  teal = "#97B7D7",
  one_bg = "#373D49",
  lightbg = "#3B4252",
  blue = "#81A1C1",
  cyan = "#5E81AC",
  black = "#2E3440",
  orange = "#D08770",
  one_bg2 = "#434C5E",
  foreground = "#E5E9F0",
  grey = "#4B515D",
  green = "#A3BE8C",
  purple = "#8FBCBB",
  one_bg3 = "#4C566A",
  light_grey = "#646A76",
  line = "#3A404C",
  white = "#D8DEE9",
  yellow = "#EBCB8B",
  lightbg2 = "#393F4B",
  dark_purple = "#B48EAD",
  pink = "#D57780",
  black2 = "#343A46",
  grey_fg = "#606672",
  baby_pink = "#DE878F",
  darker_black = "#2A303C",
}

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

local hl            = a.nvim_set_hl
hl(0, "Normal", {fg = colors.foreground, bg = colors.black})
hl(0, "NormalFloat", {fg = colors.foreground, bg = colors.black})
hl(0, "FloatBorder", {fg = colors.lightbg})
hl(0, "Bold", {bold = true})
hl(0, "Debug", {fg = colors.pink})
hl(0, "Directory", {fg = colors.blue})
hl(0, "Error", {fg = colors.black, bg = colors.pink})
hl(0, "ErrorMsg", {fg = colors.pink, bg = colors.black})
hl(0, "Exception", {fg = colors.pink})
hl(0, "FoldColumn", {fg = colors.teal, bg = colors.lightbg})
hl(0, "Folded", {fg = colors.one_bg3, bg = colors.lightbg})
hl(0, "IncSearch", {fg = colors.dark_purple})
hl(0, "Macro", {fg = colors.pink})
hl(0, "MatchParen", {bg = colors.lightbg})
hl(0, "ModeMsg", {fg = colors.green})
hl(0, "MoreMsg", {fg = colors.green})
hl(0, "Question", {fg = colors.blue})
hl(0, "Search", {fg = colors.dark_purple})
hl(0, "Substitute", {fg = colors.lightbg, bg = colors.yellow})
hl(0, "SpecialKey", {fg = colors.one_bg3})
hl(0, "TooLong", {fg = colors.pink})
hl(0, "Underlined", {fg = colors.pink})
hl(0, "Visual", {bg = colors.one_bg2})
hl(0, "VisualNOS", {fg = colors.pink})
hl(0, "WarningMsg", {fg = colors.pink})
hl(0, "WildMenu", {fg = colors.pink, bg = colors.yellow})
hl(0, "Title", {fg = colors.blue})
hl(0, "Conceal", {fg = colors.blue, bg = colors.black})
hl(0, "Cursor", {fg = colors.black, bg = colors.white})
hl(0, "NonText", {fg = colors.one_bg3})
hl(0, "LineNr", {fg = colors.grey})
hl(0, "SignColumn", {fg = colors.one_bg3})
hl(0, "StatusLineNC", {fg = colors.one_bg3, underline = true})
hl(0, "StatusLine", {fg = colors.one_bg2, underline = true})
hl(0, "VertSplit", {fg = colors.one_bg2})
hl(0, "ColorColumn", {bg = colors.lightbg})
hl(0, "CursorColumn", {bg = colors.lightbg})
hl(0, "CursorLine", {bg = colors.lightbg})
hl(0, "CursorLinenr", {fg = colors.white, bg = colors.black})
hl(0, "QuickFixLine", {bg = colors.lightbg})
hl(0, "Pmenu", {fg = colors.teal, bg = colors.black2})
hl(0, "PmenuSbar", {fg = colors.one_bg2})
hl(0, "PmenuSel", {fg = colors.teal, bg = colors.lightbg})
hl(0, "PmenuThumb", {fg = colors.blue})
hl(0, "TabLine", {fg = colors.one_bg3, bg = colors.lightbg})
hl(0, "TabLineFill", {fg = colors.one_bg3, bg = colors.lightbg})
hl(0, "TabLineSel", {fg = colors.green, bg = colors.lightbg})

-- Standard syntax highlighting
hl(0, "Boolean", {fg = colors.orange})
hl(0, "Character", {fg = colors.pink})
hl(0, "Comment", {fg = colors.grey_fg, italic = true})
hl(0, "Conditional", {fg = colors.green})
hl(0, "Constant", {fg = colors.cyan})
hl(0, "Define", {fg = colors.dark_purple})
hl(0, "Delimiter", {fg = colors.dark_purple})
hl(0, "Float", {fg = colors.orange})
hl(0, "Function", {fg = colors.yellow})
hl(0, "Identifier", {fg = colors.teal})
hl(0, "Include", {fg = colors.blue})
hl(0, "Keyword", {fg = colors.green})
hl(0, "Label", {fg = colors.yellow})
hl(0, "Number", {fg = colors.orange})
hl(0, "Operator", {fg = colors.white})
hl(0, "PreProc", {fg = colors.yellow})
hl(0, "Repeat", {fg = colors.cyan})
hl(0, "Special", {fg = colors.orange})
hl(0, "SpecialChar", {fg = colors.dark_purple})
hl(0, "Statement", {fg = colors.green})
hl(0, "StorageClass", {fg = colors.yellow})
hl(0, "String", {fg = colors.pink})
hl(0, "Structure", {fg = colors.dark_purple})
hl(0, "Tag", {fg = colors.yellow})
hl(0, "Todo", {fg = colors.yellow, bg = colors.lightbg})
hl(0, "Type", {fg = colors.yellow})
hl(0, "Typedef", {fg = colors.yellow})

-- Diff highlighting
hl(0, "DiffAdd", {fg = colors.green, bg = colors.lightbg})
hl(0, "DiffChange", {fg = colors.one_bg3, bg = colors.lightbg})
hl(0, "DiffDelete", {fg = colors.pink, bg = colors.lightbg})
hl(0, "DiffText", {fg = colors.blue, bg = colors.lightbg})
hl(0, "DiffAdded", {fg = colors.green, bg = colors.black})
hl(0, "DiffFile", {fg = colors.pink, bg = colors.black})
hl(0, "DiffNewFile", {fg = colors.green, bg = colors.black})
hl(0, "DiffLine", {fg = colors.blue, bg = colors.black})
hl(0, "DiffRemoved", {fg = colors.pink, bg = colors.black})

-- Git highlighting
hl(0, "gitcommitOverflow", {fg = colors.pink})
hl(0, "gitcommitSummary", {fg = colors.green})
hl(0, "gitcommitComment", {fg = colors.one_bg3})
hl(0, "gitcommitUntracked", {fg = colors.one_bg3})
hl(0, "gitcommitDiscarded", {fg = colors.one_bg3})
hl(0, "gitcommitSelected", {fg = colors.one_bg3})
hl(0, "gitcommitHeader", {fg = colors.dark_purple})
hl(0, "gitcommitSelectedType", {fg = colors.blue})
hl(0, "gitcommitUnmergedType", {fg = colors.blue})
hl(0, "gitcommitDiscardedType", {fg = colors.blue})
hl(0, "gitcommitBranch", {fg = colors.orange, bold = true})
hl(0, "gitcommitUntrackedFile", {fg = colors.yellow})
hl(0, "gitcommitUnmergedFile", {fg = colors.pink, bold = true})
hl(0, "gitcommitDiscardedFile", {fg = colors.pink, bold = true})
hl(0, "gitcommitSelectedFile", {fg = colors.green, bold = true})

-- Mail highlighting
hl(0, "mailQuoted1", {fg = colors.yellow})
hl(0, "mailQuoted2", {fg = colors.green})
hl(0, "mailQuoted3", {fg = colors.dark_purple})
hl(0, "mailQuoted4", {fg = colors.teal})
hl(0, "mailQuoted5", {fg = colors.blue})
hl(0, "mailQuoted6", {fg = colors.yellow})
hl(0, "mailURL", {fg = colors.blue})
hl(0, "mailEmail", {fg = colors.blue})

hl(0, "EndOfBuffer", {fg = colors.black})
hl(0, "NnnNormal", {bg = colors.black})
hl(0, "NvimInternalError", {fg = colors.red})
hl(0, "GitSignsAdd", {fg = colors.blue})
hl(0, "GitSignsChange", {fg = colors.grey_fg})
hl(0, "GitSignsModified", {fg = colors.blue})
hl(0, "CmpItemAbbr", {fg = colors.white})
hl(0, "CmpItemAbbrMatch", {fg = colors.teal})
hl(0, "CmpItemAbbrMatchFuzzy", {fg = colors.teal})
hl(0, "CmpItemMenu", {fg = colors.white})
hl(0, "CmpItemKind", {fg = colors.teal})
hl(0, "CmpItemKindText", {fg = colors.teal})
hl(0, "CmpItemKindMethod", {fg = colors.teal})
hl(0, "CmpItemKindFunction", {fg = colors.teal})
hl(0, "CmpItemKindConstructor", {fg = colors.teal})
hl(0, "CmpItemKindField", {fg = colors.teal})
hl(0, "CmpItemKindVariable", {fg = colors.teal})
hl(0, "CmpItemKindClass", {fg = colors.teal})
hl(0, "CmpItemKindInterface", {fg = colors.teal})
hl(0, "CmpItemKindModule", {fg = colors.teal})
hl(0, "CmpItemKindProperty", {fg = colors.teal})
hl(0, "CmpItemKindUnit", {fg = colors.teal})
hl(0, "CmpItemKindValue", {fg = colors.teal})
hl(0, "CmpItemKindEnum", {fg = colors.teal})
hl(0, "CmpItemKindKeyword", {fg = colors.teal})
hl(0, "CmpItemKindSnippet", {fg = colors.teal})
hl(0, "CmpItemKindColor", {fg = colors.teal})
hl(0, "CmpItemKindFile", {fg = colors.teal})
hl(0, "CmpItemKindReference", {fg = colors.teal})
hl(0, "CmpItemKindFolder", {fg = colors.teal})
hl(0, "CmpItemKindEnumMember", {fg = colors.teal})
hl(0, "CmpItemKindConstant", {fg = colors.teal})
hl(0, "CmpItemKindStruct", {fg = colors.teal})
hl(0, "CmpItemKindEvent", {fg = colors.teal})
hl(0, "CmpItemKindOperator", {fg = colors.teal})
hl(0, "CmpItemKindTypeParameter", {fg = colors.teal})
hl(0, "IndentBlanklineChar", {fg = colors.line})
hl(0, "IndentBlanklineContextChar", {fg = colors.one_bg3})
hl(0, "DiagnosticError", {fg = colors.red})
hl(0, "DiagnosticWarn", {fg = colors.yellow})
hl(0, "DiagnosticInfo", {fg = colors.green})
hl(0, "DiagnosticHint", {fg = colors.purple})
hl(0, "LspReferenceRead", {bg = colors.lightbg})
hl(0, "LspReferenceWrite", {bg = colors.lightbg})
hl(0, "NeogitNotificationError", {fg = colors.red})
hl(0, "NeogitNotificationWarn", {fg = colors.yellow})
hl(0, "NeogitNotificationInfo", {fg = colors.green})
hl(0, "NeogitDiffAddHighlight", {fg = colors.green, bg = colors.one_bg})
hl(0, "NeogitDiffDeleteHighlight", {fg = colors.red, bg = colors.one_bg})
hl(0, "NeogitDiffContextHighlight", {fg = colors.white, bg = colors.one_bg})
hl(0, "NeogitHunkHeader", {fg = colors.red, bg = colors.one_bg})
hl(0, "NeogitHunkHeaderHighlight", {fg = colors.yellow, bg = colors.one_bg})
hl(0, "NotifyINFOBorder", {fg = colors.green})
hl(0, "NotifyINFOTitle", {fg = colors.green})
hl(0, "NotifyINFOIcon", {fg = colors.green})
hl(0, "NotifyWARNBorder", {fg = colors.yellow})
hl(0, "NotifyWARNTitle", {fg = colors.yellow})
hl(0, "NotifyWARNIcon", {fg = colors.yellow})
hl(0, "NotifyERRORBorder", {fg = colors.red})
hl(0, "NotifyERRORTitle", {fg = colors.red})
hl(0, "NotifyERRORIcon", {fg = colors.red})
hl(0, "TelescopeBorder", {fg = colors.one_bg})
hl(0, "TelescopePreviewTitle", {fg = colors.green})
hl(0, "TelescopePromptTitle", {fg = colors.blue})
hl(0, "TelescopeResultsTitle", {fg = colors.red})
hl(0, "TelescopePreviewBorder", {fg = colors.grey})
hl(0, "TelescopePromptBorder", {fg = colors.line})
hl(0, "TelescopeResultsBorder", {fg = colors.line})
hl(0, "WhichKeyValue", {fg = colors.purple})
hl(0, "DapUIVariable", {fg = colors.foreground})
hl(0, "DapUIScope", {fg = colors.purple})
hl(0, "DapUIType", {fg = colors.dark_purple})
hl(0, "DapUIValue", {fg = colors.foreground})
hl(0, "DapUIModifiedValue", {fg = colors.purple, bold = true})
hl(0, "DapUIDecoration", {fg = colors.purple})
hl(0, "DapUIThread", {fg = colors.green})
hl(0, "DapUIStoppedThread", {fg = colors.purple})
hl(0, "DapUIFrameName", {fg = colors.foreground})
hl(0, "DapUISource", {fg = colors.dark_purple})
hl(0, "DapUILineNumber", {fg = colors.purple})
hl(0, "DapUIFloatBorder", {fg = colors.purple})
hl(0, "DapUIWatchesEmpty", {fg = colors.red})
hl(0, "DapUIWatchesValue", {fg = colors.green})
hl(0, "DapUIWatchesError", {fg = colors.red})
hl(0, "DapUIBreakpointsPath", {fg = colors.purple})
hl(0, "DapUIBreakpointsInfo", {fg = colors.green})
hl(0, "DapUIBreakpointsCurrentLine", {fg = colors.green, bold = true})
hl(0, "TreesitterContextLineNumber", {fg = colors.teal})
