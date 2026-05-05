local lush = require('lush')
local hsl = lush.hsl

---@diagnostic disable: undefined-global
return lush(function()
  return {
    Normal { fg = hsl('#ffffff'), bg = hsl('#000000') },
    Function { fg = hsl('#ffffff'), bg = hsl('#000000') },
    Keyword { fg = hsl('#ffffff'), gui = "bold" },
    Identifier { fg = hsl('#ffffff'), gui = "bold" },
    StatusLine { fg = hsl('#ffffff'), gui = "bold", bg = hsl('#101010') },
    Directory { fg = hsl('#ffffff') },
    Special { fg = hsl('#999999'), bg = hsl('#000000') },
    String { fg = hsl('#999999'), bg = hsl('#000000') },
    Comment { fg = hsl('#999999'), bg = hsl('#000000') },
    markdownH1 { fg = hsl(210, 80, 60), gui = "bold" },
    markdownH1Delimiter { fg = hsl(210, 80, 60), gui = "bold" },
    markdownH2 { fg = hsl(210, 80, 60), gui = "bold" },
    markdownH2Delimiter { fg = hsl(210, 80, 60), gui = "bold" },
    markdownH3 { fg = hsl(210, 80, 60), gui = "bold" },
    markdownH3Delimiter { fg = hsl(210, 80, 60), gui = "bold" },
  }
end)
