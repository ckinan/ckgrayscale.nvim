local lush = require('lush')
local hsl = lush.hsl

---@diagnostic disable: undefined-global
return lush(function()
  return {
    Normal { fg = hsl('#ffffff'), bg = hsl('#101010') },
    Function { fg = hsl('#ffffff'), bg = hsl('#101010') },
    Keyword { fg = hsl('#ffffff'), gui = "bold" },
    Identifier { fg = hsl('#ffffff'), gui = "bold" },
    StatusLine { fg = hsl('#ffffff'), gui = "bold" },
    Directory { fg = hsl('#ffffff') },
    Special { fg = hsl('#999999'), bg = hsl('#101010') },
    String { fg = hsl('#999999'), bg = hsl('#101010') },
    Comment { fg = hsl('#999999'), bg = hsl('#101010') },
  }
end)
