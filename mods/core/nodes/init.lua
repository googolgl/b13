--- Nodes

S = minetest.get_translator("nodes")
modpath = minetest.get_modpath("nodes")

--require(modpath .. "/solids.lua")
dofile(modpath .. "/solids.lua")
dofile(modpath .. "/loose.lua")
dofile(modpath .. "/ores.lua")
dofile(modpath .. "/liquids.lua")
dofile(modpath .. "/woods.lua")
dofile(modpath .. "/leaves.lua")
dofile(modpath .. "/plants.lua")