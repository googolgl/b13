-- String interpolation

local modpath = minetest.get_modpath("chat")
dofile(modpath.."/chatcommands.lua")

-- Usage: print("Hello, %s!" % {name})
getmetatable("").__mod = function(a, b)
    if not b then
            return a
    elseif type(b) == "table" then
            return string.format(a, unpack(b))
    else
            return string.format(a, b)
    end
end
