local lush = require('lush')
local hsl = lush.hsl

---@diagnostic disable: undefined-global
return lush(function()
  return {
    Normal { fg = hsl('#ffffff'), bg = hsl('#181818') },
    Function { fg = hsl('#ffffff'), bg = hsl('#181818') },
    Keyword { fg = hsl('#ffffff'), gui = "bold" },
    Identifier { fg = hsl('#ffffff'), gui = "bold" },
    StatusLine { fg = hsl('#ffffff'), gui = "bold" },
    Directory { fg = hsl('#ffffff') },
    Special { fg = hsl('#999999'), bg = hsl('#181818') },
    String { fg = hsl('#999999'), bg = hsl('#181818') },
    Comment { fg = hsl('#999999'), bg = hsl('#181818') },
  }
end)
