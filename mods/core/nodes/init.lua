--- Nodes

S = minetest.get_translator("nodes")
modpath = minetest.get_modpath("nodes")

function copytable(new, def)
    -- Копируем таблицу в другую
      for def_key, def_value in pairs(def) do
        new[def_key] = def_value
      end
    return new
end

--require(modpath .. "/solids.lua")
dofile(modpath .. "/solids.lua")
dofile(modpath .. "/loose.lua")
dofile(modpath .. "/ores.lua")
dofile(modpath .. "/liquids.lua")
dofile(modpath .. "/trees.lua")
dofile(modpath .. "/leaves.lua")
dofile(modpath .. "/plants.lua")