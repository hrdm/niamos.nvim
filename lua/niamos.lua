local cmd = vim.cmd
local fn = vim.fn

local config = {
  comment_italics = true,
  background_set = false,
  background_color = require("colorbuddy.init").Color.none,
}

local M = {
  Color = require("colorbuddy.init").Color,
  colors = require("colorbuddy.init").colors,
  Group = require("colorbuddy.init").Group,
  groups = require("colorbuddy.init").groups,
  styles = require("colorbuddy.init").styles,
}

function M.set_colors()
  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    cmd("hi clear")
  end

  if fn.exists("syntax_on") then
    cmd("syntax reset")
  end

  vim.g.colors_name = "niamos"

  local Color = M.Color
  local colors = M.colors
  local Group = M.Group
  local groups = M.groups
  local styles = M.styles

  Color.new("base03", "#002b36")
  Color.new("base02", "#073642")
  Color.new("base01", "#586e75")
  Color.new("base00", "#657b83")
  Color.new("base0", "#839496")
  Color.new("base1", "#93a1a1")
  Color.new("base2", "#eee8d5")
  Color.new("base3", "#fdf6e3")
  Color.new("yellow", "#b58900")
  Color.new("orange", "#cb4b16")
  Color.new("red", "#dc322f")
  Color.new("magenta", "#d33682")
  Color.new("violet", "#6c71c4")
  Color.new("blue", "#268bd2")
  Color.new("cyan", "#2aa198")
  Color.new("green", "#719e07")

  Color.new("black", "#161618")
  Color.new("indian_light_black", "#181a1c")
  Color.new("yellow", "#ffc919")
  Color.new("red", "#ff5f5f")
  Color.new("b_yellow", "#faba00")
  Color.new("b_yellow_lt_04", "#fff9e5")
  Color.new("b_red", "#ff5f5f")
  Color.new("b_red_lt_03", "#fff8f8")
  Color.new("b_red_lt_02", "#ffc5c5")
  Color.new("indian_grey", "#b2baba")
  Color.new("indian_grey_02", "#f2f2f2")
  Color.new("indian_grey_10", "#fafafa")
  Color.new("indian_exp_grey", "#e4e4e4")
  Color.new("b_blue", "#3d7da7")
  Color.new("b_green_dk_01", "#2f7573")
  Color.new("b_green", "#3e9997")
  Color.new("b_green_lt_02", "#51b9b6")
  Color.new("b_green_lt_05", "#e3f3f3")
  Color.new("indian_light_green", "#12b19c")
  Color.new("indian_light_red", "#ff9999")
  Color.new("s_orange_dk_01", "#ffa64b")
  Color.new("s_orange", "#ffbf7e")
  Color.new("s_orange_lt_02", "#fff2e4")
  Color.new("b_orange", "#ffaf5f")
  Color.new("s_blue", "#3cacce")
  Color.new("s_blue_dk_01", "#2b8eac")
  Color.new("Normal", "#4e585a")
  Color.new("indian_exp_green", "#87c095")
  Color.new("personal_background", "#F0F0F0")
  Color.new("b_violet", "#7469B6")
  Color.new("s_pink", "#FF5580")
  Color.new("twiter_light_", "#f3f4f6")
  Color.new("indian_dark_green_2", "#589797")
  Color.new("indian_dark_green_3", "#2aa198")

  Group.new("Error", colors.red)
  Group.new("Warning", colors.yellow)
  Group.new("Information", colors.blue)
  Group.new("Hint", colors.cyan)

  if config.background_set and config.background_color == Color.none then
    config.background_color = colors.base03
  end

  local bg_color = config.background_color

  Group.new("Normal", colors.Normal:light(), colors.none, styles.none)
  Group.new("NormalFloat", colors.none, colors.indian_grey_10, styles.none)
  -- normal non-current text
  Group.new("NormalNC", colors.base0:dark(), bg_color)

  Group.new("Comment", colors.base0, colors.none, styles.italic)
  Group.new("Constant", colors.cyan)
  Group.new("Identifier", colors.s_blue_dk_01, colors.none, styles.none)

  -- any statement, conditional, repeat (for, do while), label, operator
  Group.new("Statement", colors.indian_light_green, colors.none, styles.none)
  Group.new("pythonBuiltin", colors.s_blue, colors.none, styles.none)

  Group.new("PreProc", colors.red:dark(), colors.none, styles.none)
  Group.new("Type", colors.yellow)
  Group.new("Special", colors.red, colors.none, styles.none)
  Group.new("SpecialKey", colors.base1, colors.none, styles.none)
  Group.new("Underlined", colors.violet)
  Group.new("Strikethrough", colors.base01, colors.none, styles.strikethrough)
  Group.new("Ignore", colors.none)
  Group.new("Error", colors.red)
  Group.new("Todo", colors.magenta, colors.none, styles.bold)
  Group.new("Function", colors.s_blue, colors.none, styles.none)
  Group.link("Include", groups.PreProc)
  Group.link("Macro", groups.PreProc)
  Group.link("Keyword", groups.Statement)
  Group.new("Delimiter", colors.red, colors.none, styles.none)
  Group.link("Repeat", groups.Statement)
  Group.new("Conditional", colors.indian_light_green, colors.none, styles.none)
  Group.link("Define", groups.PreProc)
  Group.new("Operator", colors.s_blue, colors.none, styles.none)
  Group.new("Character", colors.indian_exp_green, colors.none, styles.none)
  Group.link("Float", groups.Constant)
  Group.link("Boolean", groups.Constant)
  Group.new("Number", colors.s_orange_dk_01, colors.none, styles.none)
  Group.link("Debug", groups.Special)
  Group.link("Label", groups.Statement)
  Group.link("Exception", groups.Statement)
  Group.link("Typedef", groups.Type)
  Group.link("StorageClass", groups.Type)

  Group.link("SpecialChar", groups.Special)
  Group.new("Text", colors.cyan)
  Group.new("String", colors.indian_exp_green, colors.none, styles.none)
  Group.new("NonText", colors.base00, colors.none, styles.bold)
  Group.new("StatusLine", colors.indian_grey:dark(), colors.none, styles.undercurl)
  Group.new("StatusLineNC", colors.base00, colors.base02, styles.reverse)
  Group.new("Visual", colors.none, colors.s_orange_lt_02, styles.none)

  Group.new("Directory", colors.blue)
  Group.new("ErrorMsg", colors.b_red, colors.b_red_lt_03, styles.none)
  Group.new("MsgArea", colors.indian_light_green, colors.none, styles.none)

  Group.new("IncSearch", colors.b_red, colors.b_red_lt_02, styles.None)
  Group.new("Search", colors.b_yellow, colors.b_yellow_lt_04, styles.None)

  Group.new("CurSearch", colors.b_red, colors.b_yellow_lt_04, styles.None)

  Group.new("MoreMsg", colors.blue, colors.none, styles.NONE)
  Group.new("ModeMsg", colors.blue, colors.none, styles.NONE)
  Group.new("Question", colors.cyan, colors.none, styles.bold)
  Group.new("WinSeparator", colors.base00, colors.none, styles.NONE)
  Group.link("VertSplit", groups.WinSeparator)
  Group.new("Title", colors.orange, colors.none, styles.bold)
  Group.new("VisualNOS", colors.none, colors.base02, styles.reverse)
  Group.new("WarningMsg", colors.orange, colors.none, styles.bold)
  Group.new("WildMenu", colors.base2, colors.base02, styles.reverse)
  Group.new("Folded", colors.indian_grey, colors.indian_grey:light():light(), styles.none)
  Group.new("FoldColumn", colors.indian_grey, colors.none, styles.bold)

  Group.new("DiffAdd", colors.b_green, colors.b_green_lt_05, styles.none)
  Group.new("DiffChange", colors.yellow, colors.b_yellow_lt_04, styles.none)
  Group.new("DiffDelete", colors.b_red, colors.b_red_lt_03, styles.none)
  Group.new("DiffText", colors.b_blue, colors.b_blue:light():light():light():light(), styles.bold)
  Group.new("DiffviewFilePanelSelected", colors.b_red, colors.none, styles.none)
  Group.new("NeoTreeNormal", colors.Normal, colors.personal_background, styles.NONE)
  Group.new("NeoTreeNormalNC", colors.Normal, colors.personal_background, styles.NONE)

  Group.new("SignColumn", colors.base0, colors.none, styles.NONE)
  Group.new("Conceal", colors.blue, colors.none, styles.NONE)

  Group.new("SpellBad", colors.none, colors.none, styles.undercurl, colors.red)
  Group.new("SpellCap", colors.none, colors.none, styles.undercurl, colors.violet)
  Group.new("SpellRare", colors.none, colors.none, styles.undercurl, colors.cyan)
  Group.new("SpellLocal", colors.none, colors.none, styles.undercurl, colors.yellow)

  -- pum (popup menu)
  Group.new("Pmenu", colors.none, colors.indian_grey_02, styles.None)
  Group.new("PmenuSel", colors.b_green, colors.b_green_lt_05, styles.None)
  Group.new("PmenuThumb", colors.indian_exp_grey, colors.indian_grey, styles.None)
  -- Group.new("PmenuSbar", colors.none, colors.indian_grey:light():light(), styles.None)

  -- be nice for this float border to be cyan if active
  Group.new("FloatBorder", colors.b_orange, colors.none)

  Group.new("TabLine", colors.b_blue, colors.none, styles.none) -- not selected tab
  Group.new("TabLineFill", colors.b_blue, colors.none, styles.none) -- filler from a tab to right

  Group.new("TabLineSel", colors.white, colors.b_blue, styles.bold)
  Group.new("TabLineSeparatorSel", colors.cyan, colors.none)

  Group.new("TabLineSep", colors.b_blue, colors.none, styles.none) -- right separator
  Group.new("TabLineSep2", colors.none, colors.b_blue, styles.reverse) -- left separator
  Group.new("TabLineSelMod", colors.yellow, colors.b_blue, styles.bold) -- modified tab
  Group.new("TabLineMod", colors.b_red, colors.none, styles.bold) -- modified tab not selected

  Group.new("LineNr", colors.indian_grey, colors.none, styles.none)
  Group.new("CursorLine", colors.none, colors.twiter_light_, styles.none)
  Group.new("CursorLineNr", colors.b_yellow, colors.twiter_light_, styles.none)

  Group.new("ColorColumn", colors.none, colors.base02, styles.NONE)
  Group.new("Cursor", colors.base03, colors.base0, styles.NONE)
  Group.link("lCursor", groups.Cursor)
  Group.link("TermCursor", groups.Cursor)
  Group.new("TermCursorNC", colors.base03, colors.base01)

  Group.new("MatchParen", colors.red, colors.none, styles.bold + styles.undercurl)

  Group.new("gitgutteradd", colors.indian_exp_green:dark(), colors.none, styles.none)
  Group.new("GitGutterChange", colors.yellow)
  Group.new("GitGutterDelete", colors.red)
  Group.new("GitGutterChangeDelete", colors.red)

  Group.new("GitSignsAddLn", colors.green)
  Group.new("GitSignsAddNr", colors.green)
  Group.new("GitSignsChangeLn", colors.yellow)
  Group.new("GitSignsChangeNr", colors.yellow)
  Group.new("GitSignsDeleteLn", colors.red)
  Group.new("GitSignsDeleteNr", colors.red)
  Group.link("GitSignsCurrentLineBlame", groups.Comment)
  Group.new("GitSignsAdd", colors.indian_light_green, colors.none, styles.none)
  Group.new("GitSignsChange", colors.yellow, colors.none, styles.none)
  Group.new("GitSignsDelete", colors.b_red, colors.none, styles.none)
  Group.new("DiagnosticERRORReverse", colors.white, colors.b_red, styles.bold)
  Group.new("DiagnosticINFOReverse", colors.white, colors.s_blue, styles.bold)

  Group.new("GitSignsStagedChange", colors.s_pink, colors.none, styles.bold)
  Group.new("GitSignsStagedAdd", colors.s_pink, colors.none, styles.bold)
  Group.new("GitSignsStagedDelete", colors.b_red, colors.none, styles.bold)

  -- vim highlighting
  Group.link("vimVar", groups.Identifier)
  Group.link("vimFunc", groups.Identifier)
  Group.link("vimUserFunc", groups.Identifier)
  Group.link("helpSpecial", groups.Special)
  Group.link("vimSet", groups.Normal)
  Group.link("vimSetEqual", groups.Normal)
  Group.new("vimCommentString", colors.violet)
  Group.new("vimCommand", colors.yellow)
  Group.new("vimCmdSep", colors.blue, colors.NONE, styles.bold)
  Group.new("helpExample", colors.base1)
  Group.new("helpOption", colors.cyan)
  Group.new("helpNote", colors.magenta)
  Group.new("helpVim", colors.magenta)
  Group.new("helpHyperTextJump", colors.blue, colors.NONE, styles.underline)
  Group.new("helpHyperTextEntry", colors.green)
  Group.new("vimIsCommand", colors.base00)
  Group.new("vimSynMtchOpt", colors.yellow)
  Group.new("vimSynType", colors.cyan)
  Group.new("vimHiLink", colors.blue)
  Group.new("vimGroup", colors.blue, colors.NONE, styles.underline + styles.bold)

  Group.new("gitcommitSummary", colors.green)
  Group.new("gitcommitComment", colors.base01, colors.NONE, styles.italic)
  Group.link("gitcommitUntracked", groups.gitcommitComment)
  Group.link("gitcommitDiscarded", groups.gitcommitComment)
  Group.new("gitcommitSelected", groups.gitcommitComment)
  Group.new("gitcommitUnmerged", colors.green, colors.NONE, styles.bold)
  Group.new("gitcommitOnBranch", colors.base01, colors.NONE, styles.bold)
  Group.new("gitcommitBranch", colors.magenta, colors.NONE, styles.bold)
  Group.link("gitcommitNoBranch", groups.gitcommitBranch)
  Group.new("gitcommitDiscardedType", colors.red)
  Group.new("gitcommitSelectedType", colors.green)
  Group.new("gitcommitHeader", colors.base01)
  Group.new("gitcommitUntrackedFile", colors.cyan)
  Group.new("gitcommitDiscardedFile", colors.red)
  Group.new("gitcommitSelectedFile", colors.green)
  Group.new("gitcommitUnmergedFile", colors.yellow)
  Group.new("gitcommitFile", colors.base0)
  Group.link("gitcommitDiscardedArrow", groups.gitCommitDiscardedFile)
  Group.link("gitcommitSelectedArrow", groups.gitCommitSelectedFile)
  Group.link("gitcommitUnmergedArrow", groups.gitCommitUnmergedFile)

  Group.link("diffAdded", groups.Statement)
  Group.link("diffLine", groups.Identifier)

  Group.new("NeomakeErrorSign", colors.orange)
  Group.new("NeomakeWarningSign", colors.yellow)
  Group.new("NeomakeMessageSign", colors.cyan)
  Group.new("NeomakeNeomakeInfoSign", colors.green)

  Group.new("CmpItemKind", colors.green)
  Group.new("CmpItemMenu", groups.NormalNC)
  Group.new("CmpItemAbbr", colors.Normal, colors.none, styles.none)
  Group.new("CmpItemAbbrMatch", colors.b_green, colors.b_green_lt_05, styles.None)
  Group.new("CmpItemKindText", colors.b_orange, colors.none, styles.none)
  Group.new("CmpItemKindMethod", colors.green, colors.none, styles.none)
  Group.new("CmpItemKindFunction", colors.blue, colors.none, styles.none)
  Group.new("CmpItemKindConstructor", colors.orange, colors.none, styles.none)
  Group.new("CmpItemKindField", colors.yellow, colors.none, styles.none)
  Group.new("CmpItemKindVariable", colors.orange, colors.none, styles.none)
  Group.new("CmpitemKindClass", colors.yellow, colors.none, styles.none)
  Group.new("CmpItemKindInterface", colors.yellow, colors.none, styles.none)
  Group.new("CmpItemKindModule", colors.green, colors.none, styles.none)
  Group.new("CmpItemKindProperty", colors.green, colors.none, styles.none)
  Group.new("CmpItemKindUnit", colors.orange, colors.none, styles.none)
  Group.new("CmpItemKindValue", colors.cyan, colors.none, styles.none)
  Group.new("CmpItemKindEnum", colors.yellow, colors.none, styles.none)
  Group.new("CmpItemKindKeyword", colors.green, colors.none, styles.none)
  Group.new("CmpItemKindSnippet", colors.magenta, colors.none, styles.none)
  Group.new("CmpItemKindColor", colors.magenta, colors.none, styles.none)
  Group.new("CmpItemKindFile", colors.violet, colors.none, styles.none)
  Group.new("CmpItemKindReference", colors.violet, colors.none, styles.none)
  Group.new("CmpItemKindFolder", colors.violet, colors.none, styles.none)
  Group.new("CmpItemKindEnumMember", colors.cyan, colors.none, styles.none)
  Group.new("CmpItemKindConstant", colors.cyan, colors.none, styles.none)
  Group.new("CmpItemKindStruct", colors.yellow, colors.none, styles.none)
  Group.new("CmpItemKindEvent", colors.orange, colors.none, styles.none)
  Group.new("CmpItemKindOperator", colors.cyan, colors.none, styles.none)
  Group.new("CmpItemKindTypeParameter", colors.orange, colors.none, styles.none)

  Group.new("LspSagaCodeActionTitle", colors.green)
  Group.new("LspSagaBorderTitle", colors.yellow, colors.none, styles.bold)
  Group.new("LspSagaDiagnosticHeader", colors.yellow)
  Group.new("ProviderTruncateLine", colors.base02)
  Group.new("LspSagaShTruncateLine", groups.ProviderTruncateLine)
  Group.new("LspSagaDocTruncateLine", groups.ProviderTruncateLine)
  Group.new("LspSagaCodeActionTruncateLine", groups.ProviderTruncateLine)
  Group.new("LspSagaHoverBorder", colors.cyan)
  Group.new("LspSagaRenameBorder", groups.LspSagaHoverBorder)
  Group.new("LSPSagaDiagnosticBorder", groups.LspSagaHoverBorder)
  Group.new("LspSagaSignatureHelpBorder", groups.LspSagaHoverBorder)
  Group.new("LspSagaCodeActionBorder", groups.LspSagaHoverBorder)
  Group.new("LspSagaLspFinderBorder", colors.b_blue, colors.none, styles.none)
  Group.new("LspSagaFloatWinBorder", groups.LspSagaHoverBorder)
  Group.new("LspSagaSignatureHelpBorder", groups.LspSagaHoverBorder)
  Group.new("LspSagaDefPreviewBorder", groups.LspSagaHoverBorder)
  -- Group.new("LspSagaAutoPreviewBorder", groups.LspSagaHoverBorder)
  Group.new("LspSagaAutoPreview", colors.b_red, colors.b_red_lt_03, styles.bold)

  Group.new("LspFloatWinBorder", groups.LspSagaHoverBorder)
  Group.new("LspLinesDiagBorder", groups.LspSagaHoverBorder)
  Group.new("LspSagaFinderSelection", colors.b_green, colors.none, styles.bold)
  --Group.new('SagaShadow', colors.base02)

  Group.new("SagaNormal", colors.none, colors.none, styles.none)
  Group.new("SagaBorder", colors.b_orange, colors.none, styles.none)
  Group.new("SagaFolder", colors.s_blue, colors.none, styles.bold)
  Group.new("SagaFolderName", colors.b_green, colors.none, styles.bold)
  Group.new("SagaFileName", colors.indian_grey:dark(), colors.none, styles.bold)
  Group.new("SagaSep", colors.b_red, colors.none, styles.bold)
  Group.new("SagaWinbarSep", colors.b_green, colors.none, styles.none)
  Group.new("TargetFileName", colors.indian_grey:light(), colors.none, styles.bold)
  Group.new("FinderParam", colors.b_green, colors.b_green_lt_05, styles.none)
  Group.new("FinderVirtText", colors.b_red, colors.none, styles.none)
  Group.new("DefinitionsIcon", colors.b_blue, colors.none, styles.none)
  Group.new("Definitions", colors.b_green, colors.none, styles.bold)
  Group.new("DefinitionCount", colors.b_red, colors.none, styles.none)
  Group.new("ReferencesIcon", colors.b_blue, colors.none, styles.none)
  Group.new("References", colors.b_green, colors.none, styles.bold)
  Group.new("ReferencesCount", colors.b_red, colors.none, styles.none)
  Group.new("ImplementsIcon", colors.b_blue, colors.none, styles.none)
  Group.new("Implements", colors.b_green, colors.none, styles.bold)
  Group.new("ImplementsCount", colors.b_red, colors.none, styles.none)
  Group.new("DefinitionBorder", colors.b_red, colors.b_red_lt_03, styles.bold)

  Group.new("DevIconPy", colors.b_yellow, colors.none, styles.none)
  Group.new("DevIconLua", colors.b_blue, colors.none, styles.none)

  Group.new("TelescopeMatching", colors.b_red, colors.b_red_lt_03, styles.none)
  Group.new("TelescopePreviewMatch", colors.b_green, colors.b_green_lt_05, styles.none)
  Group.new("TelescopeBorder", colors.base01) -- float border not quite dark enough, maybe that needs to change?
  Group.new("TelescopePromptBorder", colors.cyan) -- active border lighter for clarity
  Group.new("TelescopeTitle", groups.Normal) -- separate them from the border a little, but not make them pop
  Group.new("TelescopePromptPrefix", groups.Normal) -- default is groups.Identifier
  Group.link("TelescopeSelection", groups.CursorLine)
  Group.new("TelescopeSelectionCaret", colors.cyan)
  Group.new("TelescopeResultsBorder", colors.b_green, colors.none, styles.none)
  Group.new("TelescopePreviewBorder", colors.b_red, colors.b_red_lt_03, styles.none)

  Group.new("NeogitDiffAddHighlight", colors.green, colors.base02)
  Group.new("NeogitDiffDeleteHighlight", colors.red, colors.base02)
  Group.new("NeogitHunkHeader", groups.Normal, colors.base02)
  Group.new("NeogitHunkHeaderHighlight", colors.base3, colors.base1)
  Group.new("NeogitDiffContextHighlight", colors.base2, colors.base02)
  Group.new("NeogitCommandText", groups.Normal)
  Group.new("NeogitCommandTimeText", groups.Normal)
  Group.new("NeogitCommandCodeNormal", groups.Normal)
  Group.new("NeogitCommandCodeError", groups.Error)
  Group.new("NeogitNotificationError", groups.Error, colors.none)
  Group.new("NeogitNotificationInfo", groups.Information, colors.none)
  Group.new("NeogitNotificationWarning", groups.Warning, colors.none)

  -- seblj/nvim-tabline
  Group.new("TabLineSeparatorActive", colors.cyan)
  Group.link("TabLineModifiedSeparatorActive", groups.TablineSeparatorActive)

  -- kevinhwang91/nvim-bqf
  Group.new("BqfPreviewBorder", colors.base01)
  Group.new("BqfSign", colors.cyan)

  -- Primeagen/harpoon
  Group.new("HarpoonBorder", colors.cyan)
  Group.new("HarpoonWindow", groups.Normal)

  -- nvim-tree/nvim-tree.lua
  Group.new("NvimTreeFolderIcon", colors.blue)
  Group.new("NvimTreeRootFolder", colors.orange)
  Group.new("NvimTreeImageFile", colors.orange)
  Group.new("NvimTreeSpecialFile", colors.orange, colors.none, styles.bold + styles.underline)

  -- phaazon/hop.nvim
  Group.link("HopNextKey", groups.IncSearch)
  Group.link("HopNextKey1", groups.IncSearch)
  Group.link("HopNextKey2", groups.IncSearch)

  -- https://github.com/j-hui/fidget.nvim (for some reason the background
  -- is only correct if used with background_set = true) even when set below)
  Group.new("FidgetTitle", colors.magenta)
  Group.new("FidgetTask", colors.base0)

  -- TreeSitter
  Group.link("TSBoolean", groups.Constant)
  Group.link("TSCharacter", groups.Constant)
  Group.link("TSComment", groups.Comment)
  Group.link("TSConditional", groups.Conditional)
  Group.link("TSConstant", groups.Constant)
  Group.link("TSConstBuiltin", groups.Constant)
  Group.link("TSConstMacro", groups.Constant)
  Group.link("TSError", groups.Error)
  Group.link("TSException", groups.Exception)
  Group.link("TSField", groups.Identifier)
  Group.link("TSFloat", groups.Constant)
  Group.link("TSFunction", groups.Function)
  Group.link("TSFuncBuiltin", groups.Function)
  Group.link("TSFuncMacro", groups.Function)
  Group.link("TSInclude", groups.Include)
  Group.link("TSKeyword", groups.Keyword)
  Group.link("TSLabel", groups.Statement)
  Group.link("TSMethod", groups.Function)
  Group.link("TSNamespace", groups.Identifier)
  Group.link("TSNumber", groups.Constant)
  Group.link("TSOperator", groups.Operator)
  Group.link("TSParameterReference", groups.Identifier)
  Group.link("TSProperty", groups.TSField)
  Group.link("TSPunctDelimiter", groups.Delimiter)
  Group.link("TSPunctBracket", groups.Delimiter)
  Group.link("TSPunctSpecial", groups.Special)
  Group.link("TSRepeat", groups.Repeat)
  Group.link("TSString", groups.Constant)
  Group.link("TSStringRegex", groups.Constant)
  Group.link("TSStringEscape", groups.Constant)
  Group.new("TSStrong", colors.base1, colors.none, styles.bold)
  Group.link("TSConstructor", groups.Function)
  Group.link("TSKeywordFunction", groups.Identifier)
  Group.new("TSLiteral", groups.Normal)
  Group.link("TSParameter", groups.Identifier)
  Group.link("TSVariable", groups.Normal)
  Group.link("TSVariableBuiltin", groups.Identifier)
  Group.link("TSTag", groups.Special)
  Group.link("TSTagDelimiter", groups.Delimiter)
  Group.link("TSTitle", groups.Title)
  Group.new("TSType", colors.indian_light_red, colors.none, styles.NONE)
  Group.new("TSTypeBuiltin", colors.indian_light_red, colors.none, styles.NONE)

  Group.new("DiagnosticSignError", colors.b_red, colors.none, styles.bold)
  Group.new("DiagnosticError", colors.b_red, colors.b_red_lt_03, styles.none)
  Group.new("DiagnosticWarn", colors.b_yellow, colors.b_yellow_lt_04, styles.none)
  Group.new("DiagnosticSignWarn", colors.b_yellow, colors.none, styles.bold)
  Group.new("DiagnosticWARNReverse", colors.white, colors.b_yellow, styles.bold)
  Group.new("DiagnosticInfo", colors.s_blue, colors.none, styles.none)
  Group.new("DiagnosticSignInfo", colors.s_blue, colors.none, styles.none)
  Group.new("DiagnosticHint", colors.b_green, colors.b_green_lt_05, styles.none)
  Group.new("DiagnosticSignHint", colors.b_green, colors.none, styles.bold)
  Group.new("MsgSeparator", colors.indian_exp_green, colors.none, styles.underline)
  Group.new("DiagnosticUnderlineOk", colors.s_pink, colors.none, styles.underline)
  Group.new("DiagnosticUnderlineError", colors.b_red, colors.none, styles.underline)
  Group.new("DiagnosticUnderlineWarn", colors.b_yellow, colors.none, styles.underline)
  Group.new("DiagnosticUnderlineInfo", colors.b_blue, colors.none, styles.underline)
  Group.new("DiagnosticUnderlineHint", colors.b_green, colors.none, styles.underline)
  Group.link("DiagnosticVirtualTextHint", groups.Comment)
  Group.link("DiagnosticTextWarn", groups.WarningMsg)

  Group.new("LspReferenceRead", colors.none, colors.none, styles.underline)
  Group.link("LspReferenceText", groups.LspReferenceRead)
  Group.new("LspReferenceWrite", colors.none, colors.none, styles.underline)

  -- folke/which-key.nvim
  Group.new("WhichKeySeparator", colors.base01, colors.base02, styles.bold)
  Group.new("WhichKeyDesc", colors.cyan, colors.base02)

  -- group names with an ampersand throw an error until they gain support in 0.8.0
  if fn.has("nvim-0.8.0") ~= 0 then
    -- XML-like tags
    Group.new("@tag", colors.green)
    Group.new("@tag.attribute", colors.blue)
    Group.new("@tag.delimiter", colors.red)

    Group.new("@none", colors.none)
    Group.link("@comment", groups.Comment)
    Group.link("@error", groups.Error)
    Group.link("@preproc", groups.PreProc)
    Group.link("@define", groups.Define)
    Group.link("@operator", groups.Operator)

    Group.link("@punctuation.delimiter", groups.Statement)
    Group.link("@punctuation.bracket", groups.Delimiter)
    Group.link("@punctuation.special", groups.Delimiter)

    Group.link("@string", groups.String)
    Group.link("@string.regex", groups.String)
    Group.link("@string.escape", groups.Special)
    Group.link("@string.special", groups.Special)

    Group.link("@character", groups.Character)
    Group.link("@character.special", groups.Special)

    Group.link("@boolean", groups.Boolean)
    Group.link("@number", groups.Number)
    Group.link("@float", groups.Float)

    Group.link("@function", groups.Function)
    Group.link("@function.call", groups.Function)
    Group.link("@function.builtin", groups.Function)
    Group.link("@function.macro", groups.Macro)

    Group.link("@method", groups.Function)
    Group.link("@method.call", groups.Function)

    Group.link("@constructor", groups.Special)
    -- not sure about this one, special is true and kinda nice?
    Group.link("@parameter", groups.Special)

    Group.link("@keyword", groups.Keyword)
    Group.link("@keyword.function", groups.Keyword)
    Group.link("@keyword.operator", groups.Keyword)
    Group.link("@keyword.return", groups.Keyword)

    Group.link("@conditional", groups.Conditional)
    Group.link("@repeat", groups.Repeat)
    Group.link("@debug", groups.Debug)
    Group.link("@label", groups.Label)
    Group.link("@include", groups.Include)
    Group.link("@exception", groups.Exception)

    Group.link("@type", groups.Type)
    Group.link("@type.builtin", groups.Type)
    Group.link("@type.qualifier", groups.Type)
    Group.link("@type.definition", groups.Typedef)

    Group.link("@storageclass", groups.StorageClass)
    Group.link("@attribute", groups.Identifier)
    Group.link("@field", groups.Identifier)
    Group.link("@property", groups.Identifier)

    -- Group.new("@variable", colors.base0)
    -- Group.link("@variable.builtin", groups.Special)
    Group.new("@variable", colors.b_blue, colors.none, styles.none)
    Group.new("@variable.builtin", colors.s_blue, colors.none, styles.bold)
    Group.new("@variable.parameter.builtin", colors.s_blue, colors.none, styles.bold)
    Group.new("cType", colors.s_pink, colors.none, styles.none)
    Group.new("cTypedef", colors.indian_light_green, colors.none, styles.none)
    Group.new("cStructure", colors.indian_light_red:dark(), colors.none, styles.none)

    -- Group.link("@constant", groups.Constant)
    Group.new("@constant", colors.b_violet, colors.none, styles.none)
    Group.link("@constant.builtin", groups.Type)
    Group.link("@constant.macro", groups.Define)

    Group.link("@namespace", groups.Identifier)
    Group.link("@symbol", groups.Identifier)

    Group.link("@text", groups.Normal)
    Group.new("@text.strong", colors.base1, colors.none, styles.bold)
    Group.new("@text.emphasis", colors.base1, colors.none, styles.bold)
    Group.link("@text.underline", groups.Underlined)
    Group.link("@text.strike", groups.Strikethrough)
    Group.link("@text.title", groups.Title)
    Group.link("@text.literal", groups.String)
    Group.link("@text.uri", groups.Underlined)
    Group.link("@text.math", groups.Special)
    Group.link("@text.environment", groups.Macro)
    Group.link("@text.environment.name", groups.Type)
    Group.link("@text.reference", groups.Constant)

    Group.link("@text.todo", groups.Todo)
    Group.link("@text.note", groups.Comment)
    Group.link("@text.warning", groups.WarningMsg)
    Group.new("@text.danger", colors.red, colors.none, styles.bold)
    Group.new("NoiceCmdlinePopupBorder", colors.cyan)
    Group.new("NoiceConfirmBorder", colors.cyan)
    Group.new("NoiceCmdlinePopupBorderSearch", colors.cyan)
    Group.new("NoiceCmdlinePopupTitle", colors.base0)
    Group.new("NoiceCmdlinePrompt", colors.base0)
    Group.new("NoiceCmdlineIconSearch", colors.base0)
    Group.new("NoiceCmdlineIcon", colors.base0)
    Group.new("NoiceFormatTitle", colors.base0)
  end

  if fn.has("nvim-0.9.0") ~= 0 then
    Group.link("@lsp.type.type", groups.Type)
    Group.link("@lsp.type.class", groups.Type)
    Group.link("@lsp.type.enum", groups.Type)
    Group.link("@lsp.type.interface", groups.Type)
    Group.link("@lsp.type.struct", groups.Type)
    Group.link("@lsp.type.typeParameter", groups.Type)
    Group.link("@lsp.type.parameter", groups.Special)
    Group.link("@lsp.type.variable", groups.TSVariable)
    Group.link("@lsp.type.property", groups.TSProperty)
    Group.link("@lsp.type.enumMember", groups.TSProperty)
    Group.link("@lsp.type.events", groups.Label)
    Group.link("@lsp.type.function", groups.Function)
    Group.link("@lsp.type.method", groups.TSMethod)
    Group.link("@lsp.type.keyword", groups.Keyword)
    Group.link("@lsp.type.modifier", groups.Operator)
    Group.link("@lsp.type.comment", groups.Comment)
    Group.link("@lsp.type.string", groups.String)
    Group.link("@lsp.type.number", groups.Number)
    Group.link("@lsp.type.regexp", groups.TSStringRegex)
    Group.link("@lsp.type.operator", groups.Operator)

    -- lualine
    Group.new("LuaLineNormalA", colors.white, colors.b_blue, styles.bold)
    Group.new("LuaLineNormalB", colors.indian_light_black, colors.indian_exp_grey)
    Group.new("LuaLineNormalC", colors.b_blue, colors.none)
    Group.new("LuaLineNormalY", colors.indian_light_black, colors.indian_exp_grey)

    Group.new("LuaLineCommandA", colors.white, colors.b_red, styles.bold)
    Group.new("LuaLineInsertA", colors.white, colors.b_green, styles.bold)
    Group.new("LuaLineVisualA", colors.white, colors.b_red, styles.bold)
    Group.new("LuaLineReplaceA", colors.white, colors.b_red, styles.bold)

    Group.new("LuaLineInactiveA", colors.white, colors.indian_exp_grey, styles.bold)
    Group.new("LuaLineInactiveB", colors.indian_exp_grey, colors.none)
    Group.new("LuaLineInactiveC", colors.indian_exp_grey, colors.none)
    Group.new("LuaLineInactiveY", colors.indian_exp_grey, colors.none)

    Group.new("LuaLineBufferActive", colors.indian_light_green, colors.none, styles.none)
    Group.new("LuaLineBufferInactive", colors.indian_grey, colors.none, styles.none)

    Group.new("lualine_x_diagnostics_info_terminal", colors.s_blue, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_info_inactive", colors.s_blue, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_info_replace", colors.s_blue, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_info_command", colors.s_blue, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_info_visual", colors.s_blue, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_info_normal", colors.s_blue, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_info_insert", colors.s_blue, colors.none, styles.none)

    Group.new("lualine_x_diagnostics_error_terminal", colors.b_red, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_error_inactive", colors.b_red, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_error_replace", colors.b_red, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_error_command", colors.b_red, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_error_visual", colors.b_red, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_error_normal", colors.b_red, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_error_insert", colors.b_red, colors.none, styles.none)

    Group.new("lualine_x_diagnostics_warn_terminal", colors.b_yellow, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_warn_inactive", colors.b_yellow, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_warn_replace", colors.b_yellow, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_warn_command", colors.b_yellow, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_warn_visual", colors.b_yellow, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_warn_normal", colors.b_yellow, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_warn_insert", colors.b_yellow, colors.none, styles.none)

    Group.new("lualine_x_diagnostics_hint_terminal", colors.b_green, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_hint_inactive", colors.b_green, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_hint_replace", colors.b_green, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_hint_command", colors.b_green, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_hint_visual", colors.b_green, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_hint_normal", colors.b_green, colors.none, styles.none)
    Group.new("lualine_x_diagnostics_hint_insert", colors.b_green, colors.none, styles.none)

    -- Group.new("PmenuKind", colors.none, colors.style, styles.none)
    -- Group.new("PmenuExtra", colors.none, colors.style, styles.none)
    -- indent plugin support
    Group.new("IblScope", colors.indian_dark_green_2, colors.none, styles.none)
    Group.new("IblIndent", colors.indian_exp_grey, colors.none, styles.none)
    Group.new("SnacksIndent", colors.indian_exp_grey, colors.none, styles.none)

    -- noice
    Group.new("NoiceCmdlineIconLua", colors.white, colors.b_blue:light(), styles.none)
    Group.new("NoiceCmdlineIconSearch", colors.white, colors.b_red, styles.none)
    Group.new("NoiceCmdlineIconCmdline", colors.white, colors.b_green, styles.none)
    Group.new("NoiceCmdlineIconFilter", colors.white, colors.b_orange, styles.none)
    Group.new("NoiceCursor", colors.none, colors.indian_dark_green_3, styles.none)
    -- alpha
    Group.new("AlphaHeader", colors.indian_light_green, colors.none, styles.none)
    Group.new("AlphaButtons", colors.b_orange, colors.none, styles.none)
    Group.new("AlphaShortcut", colors.indian_exp_grey_, colors.none, styles.none)
    Group.new("AlphaFooter", colors.b_red, colors.none, styles.none)
    -- snacks
    Group.new("SnacksDashboardHeader", colors.b_green_dk_01, colors.none, styles.bold)
    Group.new("SnacksDashboardTitle", colors.b_green, colors.none, styles.bold)
    Group.new("SnacksDashboardIcon", colors.b_green_dk_01, colors.none, styles.none)
    Group.new("SnacksDashboardDesc", colors.b_blue:light(), colors.none, styles.none)
    Group.new("SnacksDashboardKey", colors.indian_grey, colors.none, styles.none)
    -- bufferline
    Group.new("bufferlineIndicatorSelected", colors.b_orange, colors.none, styles.none)
    Group.new("BufferLineSeparator", colors.s_pink, colors.none, styles.none)
    Group.new("BufferlineIndicatorSelected", colors.b_yellow, colors.none, styles.none)
    Group.new("BufferLineTruncMarker", colors.white, colors.s_pink, styles.none)
    Group.new("BufferLineModified", colors.indian_exp_green, colors.none, styles.none)
    Group.new("BufferLineBufferSelected", colors.s_pink, colors.none, styles.bold)
  end

  -- noice
  Group.new("NoiceCmdlineIconHelp", colors.white, colors.b_orange, styles.none)
  Group.new("NoiceFormatProgressDone", colors.b_green, colors.b_green_lt_05, styles.None)

  -- snacks
  Group.new("SnacksNotifierBorderInfo", colors.b_green_lt_02, colors.none, styles.none)
  Group.new("SnacksNotifierTitleInfo", colors.b_green_lt_02, colors.none, styles.none)

  function M.translate(group)
    if fn.has("nvim-0.6.0") == 0 then
      return group
    end

    if not string.match(group, "^LspDiagnostics") then
      return group
    end

    local translated = group
    translated = string.gsub(translated, "^LspDiagnosticsDefault", "Diagnostic")
    translated = string.gsub(translated, "^LspDiagnostics", "Diagnostic")
    translated = string.gsub(translated, "Warning$", "Warn")
    translated = string.gsub(translated, "Information$", "Info")
    return translated
  end

  local lspColors = {
    Error = groups.Error,
    Warning = groups.Warning,
    Information = groups.Information,
    Hint = groups.Hint,
  }
  for _, lsp in pairs({ "Error", "Warning", "Information", "Hint" }) do
    local lspGroup = Group.new(M.translate("LspDiagnosticsDefault" .. lsp), lspColors[lsp])
    Group.link(M.translate("LspDiagnosticsVirtualText" .. lsp), lspGroup)
    Group.new(M.translate("LspDiagnosticsUnderline" .. lsp), colors.none, colors.none, styles.undercurl, lspColors[lsp])
  end

  for _, name in pairs({ "LspReferenceText", "LspReferenceRead", "LspReferenceWrite" }) do
    Group.link(M.translate(name), groups.CursorLine)
  end
end

function M.setup(opts)
  config = vim.tbl_deep_extend("force", config, opts)

  return M
end

return M
