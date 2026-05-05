local lush = require("lush")
local hsl = lush.hsl

-- Grayscale palette (dark)
local p = {
  -- Backgrounds
  bg0   = hsl("#080808"), -- deepest bg (under floats)
  bg1   = hsl("#111111"), -- normal bg
  bg2   = hsl("#191919"), -- float / popup bg
  bg3   = hsl("#232323"), -- visual selection
  bg4   = hsl("#2d2d2d"), -- statusline, tabline
  bg5   = hsl("#383838"), -- borders, dividers, fold col

  -- Foregrounds
  fg1   = hsl("#424242"), -- comments (very muted)
  fg2   = hsl("#606060"), -- line numbers, non-text
  fg3   = hsl("#848484"), -- operators, punctuation
  fg4   = hsl("#b0b0b0"), -- normal text
  fg5   = hsl("#d0d0d0"), -- keywords, types (bright)
  fg6   = hsl("#e8e8e8"), -- strings, constants (brightest)
  white = hsl("#ffffff"), -- titles, headings

  none  = "NONE",
}

---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- Core
    Normal          { bg = p.bg1,  fg = p.fg4 },
    NormalFloat     { bg = p.bg2,  fg = p.fg4 },
    NormalNC        { bg = p.bg0,  fg = p.fg4 },
    NormalSB        { bg = p.bg0,  fg = p.fg4 },

    -- Cursor
    Cursor          { bg = p.fg4,  fg = p.bg1 },
    CursorIM        { Cursor },
    CursorLine      { bg = p.bg2 },
    CursorLineNr    { bg = p.bg2,  fg = p.fg5 },
    CursorColumn    { CursorLine },
    TermCursor      { Cursor },

    -- Line numbers / signs
    LineNr          { fg = p.fg2 },
    SignColumn      { bg = Normal.bg, fg = p.fg2 },
    FoldColumn      { bg = Normal.bg, fg = p.fg2 },
    Folded          { bg = p.bg3,  fg = p.fg2 },

    -- Splits / borders
    VertSplit       { fg = p.bg5,  bg = Normal.bg },
    WinSeparator    { VertSplit },

    -- Status / Tab line
    StatusLine      { bg = p.bg4,  fg = p.fg4 },
    StatusLineNC    { bg = p.bg4,  fg = p.fg2 },
    TabLine         { bg = p.bg4,  fg = p.fg2 },
    TabLineFill     { bg = p.bg4 },
    TabLineSel      { bg = p.bg1,  fg = p.fg5 },

    -- Pmenu (completion)
    Pmenu           { bg = p.bg2,  fg = p.fg4 },
    PmenuSel        { bg = p.bg5,  fg = p.fg6 },
    PmenuSbar       { bg = p.bg4 },
    PmenuThumb      { bg = p.bg5 },

    -- Search
    Search          { bg = p.bg5,  fg = p.white },
    IncSearch       { bg = p.fg5,  fg = p.bg1 },
    CurSearch       { IncSearch },
    Substitute      { Search },

    -- Visual
    Visual          { bg = p.bg3 },
    VisualNOS       { Visual },

    -- Messages / mode
    MsgArea         { fg = p.fg3 },
    MoreMsg         { fg = p.fg5 },
    WarningMsg      { fg = p.fg5 },
    ErrorMsg        { fg = p.white, bg = p.bg5 },
    ModeMsg         { fg = p.fg5 },
    Question        { fg = p.fg5 },
    Title           { fg = p.white, gui = "bold" },

    -- Misc UI
    WildMenu        { PmenuSel },
    NonText         { fg = p.fg1 },
    EndOfBuffer     { fg = p.bg5 },
    Whitespace      { fg = p.fg1 },
    SpecialKey      { fg = p.fg1 },
    MatchParen      { bg = p.bg5,  fg = p.white,  gui = "bold" },
    Conceal         { fg = p.fg2 },
    Directory       { fg = p.fg5 },
    QuickFixLine    { bg = p.bg3 },
    WinBar          { bg = p.bg1,  fg = p.fg3 },
    WinBarNC        { bg = p.bg0,  fg = p.fg2 },

    -- Spell
    SpellBad        { gui = "undercurl", sp = p.fg3.hex },
    SpellCap        { gui = "undercurl", sp = p.fg3.hex },
    SpellRare       { gui = "undercurl", sp = p.fg3.hex },
    SpellLocal      { gui = "undercurl", sp = p.fg3.hex },

    -- Diff
    DiffAdd         { bg = p.bg3,  fg = p.fg5 },
    DiffChange      { bg = p.bg3 },
    DiffDelete      { bg = p.bg3,  fg = p.fg2 },
    DiffText        { bg = p.bg5,  fg = p.fg6 },
    diffAdded       { DiffAdd },
    diffRemoved     { DiffDelete },
    diffChanged     { DiffChange },

    -- Syntax
    Comment         { fg = p.fg1,  gui = "italic" },
    Constant        { fg = p.fg6 },
    String          { fg = p.fg6 },
    Character       { fg = p.fg6 },
    Number          { fg = p.fg5 },
    Boolean         { fg = p.fg5 },
    Float           { Number },

    Identifier      { fg = p.fg4 },
    Function        { fg = p.fg5 },

    Statement       { fg = p.fg5 },
    Conditional     { fg = p.fg5 },
    Repeat          { fg = p.fg5 },
    Label           { fg = p.fg5 },
    Operator        { fg = p.fg3 },
    Keyword         { fg = p.fg5,  gui = "bold" },
    Exception       { fg = p.fg5 },

    PreProc         { fg = p.fg3 },
    Include         { fg = p.fg3 },
    Define          { fg = p.fg3 },
    Macro           { fg = p.fg3 },
    PreCondit       { fg = p.fg3 },

    Type            { fg = p.fg5 },
    StorageClass    { fg = p.fg5 },
    Structure       { fg = p.fg5 },
    Typedef         { fg = p.fg5 },

    Special         { fg = p.fg3 },
    SpecialChar     { fg = p.fg3 },
    Tag             { fg = p.fg3 },
    Delimiter       { fg = p.fg3 },
    SpecialComment  { fg = p.fg2,  gui = "italic" },
    Debug           { fg = p.fg3 },

    Underlined      { gui = "underline" },
    Error           { fg = p.white,  bg = p.bg5 },
    Todo            { fg = p.fg1,  gui = "bold,italic" },

    -- Treesitter
    sym("@comment")                    { Comment },
    sym("@comment.documentation")      { Comment },
    sym("@keyword")                    { Keyword },
    sym("@keyword.function")           { Keyword },
    sym("@keyword.operator")           { Operator },
    sym("@keyword.return")             { Keyword },
    sym("@keyword.import")             { PreProc },
    sym("@keyword.export")             { PreProc },
    sym("@keyword.directive")          { PreProc },

    sym("@variable")                   { fg = p.fg4 },
    sym("@variable.builtin")           { fg = p.fg5 },
    sym("@variable.parameter")         { fg = p.fg4 },
    sym("@variable.member")            { fg = p.fg4 },

    sym("@function")                   { Function },
    sym("@function.builtin")           { fg = p.fg5 },
    sym("@function.call")              { fg = p.fg4 },
    sym("@function.method")            { Function },
    sym("@function.method.call")       { fg = p.fg4 },

    sym("@constructor")                { fg = p.fg5 },
    sym("@operator")                   { Operator },
    sym("@punctuation.bracket")        { fg = p.fg3 },
    sym("@punctuation.delimiter")      { fg = p.fg3 },
    sym("@punctuation.special")        { fg = p.fg3 },

    sym("@string")                     { String },
    sym("@string.escape")              { fg = p.fg5 },
    sym("@string.regex")               { fg = p.fg5 },
    sym("@string.special")             { fg = p.fg5 },

    sym("@number")                     { Number },
    sym("@number.float")               { Float },
    sym("@boolean")                    { Boolean },
    sym("@constant")                   { Constant },
    sym("@constant.builtin")           { fg = p.fg5 },
    sym("@constant.macro")             { fg = p.fg3 },

    sym("@type")                       { Type },
    sym("@type.builtin")               { fg = p.fg5,  gui = "italic" },
    sym("@type.definition")            { Type },
    sym("@type.qualifier")             { fg = p.fg5 },

    sym("@attribute")                  { fg = p.fg3 },
    sym("@namespace")                  { fg = p.fg3 },
    sym("@module")                     { fg = p.fg3 },
    sym("@label")                      { Label },
    sym("@tag")                        { fg = p.fg5 },
    sym("@tag.attribute")              { fg = p.fg4 },
    sym("@tag.delimiter")              { fg = p.fg3 },

    sym("@markup.heading")             { fg = p.white,  gui = "bold" },
    sym("@markup.link")                { fg = p.fg5,    gui = "underline" },
    sym("@markup.link.url")            { fg = p.fg3,    gui = "underline" },
    sym("@markup.raw")                 { fg = p.fg6 },
    sym("@markup.strong")              { gui = "bold" },
    sym("@markup.italic")              { gui = "italic" },
    sym("@markup.strikethrough")       { gui = "strikethrough" },
    sym("@markup.list")                { fg = p.fg3 },

    -- Diagnostics
    DiagnosticError             { fg = p.fg5 },
    DiagnosticWarn              { fg = p.fg4 },
    DiagnosticInfo              { fg = p.fg3 },
    DiagnosticHint              { fg = p.fg3 },
    DiagnosticOk                { fg = p.fg3 },
    DiagnosticUnderlineError    { gui = "undercurl", sp = p.fg5.hex },
    DiagnosticUnderlineWarn     { gui = "undercurl", sp = p.fg4.hex },
    DiagnosticUnderlineInfo     { gui = "undercurl", sp = p.fg3.hex },
    DiagnosticUnderlineHint     { gui = "undercurl", sp = p.fg3.hex },
    DiagnosticVirtualTextError  { fg = p.fg2 },
    DiagnosticVirtualTextWarn   { fg = p.fg2 },
    DiagnosticVirtualTextInfo   { fg = p.fg1 },
    DiagnosticVirtualTextHint   { fg = p.fg1 },

    -- LSP
    LspReferenceText            { bg = p.bg3 },
    LspReferenceRead            { bg = p.bg3 },
    LspReferenceWrite           { bg = p.bg5 },
    LspInlayHint                { fg = p.fg1,  bg = p.bg2 },
    LspCodeLens                 { fg = p.fg1 },

    -- GitSigns
    GitSignsAdd                 { fg = p.fg5,  bg = Normal.bg },
    GitSignsChange              { fg = p.fg3,  bg = Normal.bg },
    GitSignsDelete              { fg = p.fg2,  bg = Normal.bg },

    -- Telescope
    TelescopeNormal             { NormalFloat },
    TelescopeBorder             { fg = p.bg5,   bg = NormalFloat.bg },
    TelescopePromptBorder       { TelescopeBorder },
    TelescopeResultsBorder      { TelescopeBorder },
    TelescopePreviewBorder      { TelescopeBorder },
    TelescopeSelection          { bg = p.bg3 },
    TelescopeSelectionCaret     { fg = p.fg5,   bg = p.bg3 },
    TelescopeMatching           { fg = p.white, gui = "bold" },
    TelescopePromptPrefix       { fg = p.fg3 },

    -- nvim-cmp
    CmpItemAbbr                 { fg = p.fg4 },
    CmpItemAbbrMatch            { fg = p.white, gui = "bold" },
    CmpItemAbbrMatchFuzzy       { CmpItemAbbrMatch },
    CmpItemAbbrDeprecated       { fg = p.fg2,   gui = "strikethrough" },
    CmpItemKind                 { fg = p.fg2 },
    CmpItemMenu                 { fg = p.fg1 },

    -- Outline
    OutlineCurrent              { fg = p.white, gui = "bold" },

    -- which-key
    WhichKey                    { fg = p.fg5 },
    WhichKeyGroup               { fg = p.fg3 },
    WhichKeyDesc                { fg = p.fg4 },
    WhichKeySeparator           { fg = p.fg1 },
    WhichKeyFloat               { NormalFloat },
    WhichKeyBorder              { TelescopeBorder },
  }
end)

return theme
