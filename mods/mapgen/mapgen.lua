--
-- Aliases for map generator outputs
--

minetest.register_alias("mapgen_stone", "nodes:stone")
minetest.register_alias("mapgen_dirt", "nodes:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "nodes:dirt_with_grass")
minetest.register_alias("mapgen_sand", "nodes:sand")
minetest.register_alias("mapgen_water_source", "nodes:water_source")
minetest.register_alias("mapgen_river_water_source", "nodes:river_water_source")
minetest.register_alias("mapgen_lava_source", "nodes:lava_source")
minetest.register_alias("mapgen_gravel", "nodes:gravel")

--minetest.register_alias("mapgen_tree", "default:tree")
--minetest.register_alias("mapgen_leaves", "default:leaves")
--minetest.register_alias("mapgen_apple", "default:apple")
--minetest.register_alias("mapgen_junglegrass", "default:junglegrass")

minetest.register_alias("mapgen_cobble", "nodes:cobblestone")
--minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "nodes:cobblestone_mossy")


--
-- Ore generation
--


-- Blob ore first to avoid other ores inside blobs
--[[
minetest.register_ore({
	ore_type         = "blob",
	ore              = "default:clay",
	wherein          = {"common:sand"},
	clust_scarcity   = 24*24*24,
	clust_size       = 7,
	y_min            = -15,
	y_max            = 0,
	noise_threshold = 0,
	noise_params     = {
		offset=0.35,
		scale=0.2,
		spread={x=5, y=5, z=5},
		seed=-316,
		octaves=1,
		persist=0.5
	},
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "common:stone",
	clust_scarcity = 8*8*8,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = 64,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "common:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -15,
	y_max          = 2,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "common:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -63,
	y_max          = -16,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "common:stone",
	clust_scarcity = 7*7*7,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = -31000,
	y_max          = -64,
})


--
-- Register biomes for biome API
--
]]--

minetest.clear_registered_biomes()
minetest.clear_registered_decorations()

minetest.register_biome({
	name = "mapgen:grassland",
	--node_dust = "",
	node_top = "nodes:dirt_with_grass",
	depth_top = 1,
	node_filler = "nodes:dirt",
	depth_filler = 1,
	node_stone = "",
	node_water_top = "",
	--depth_water_top = ,
	node_water = "",
	y_min = 5,
	y_max = 31000,
	heat_point = 50,
	humidity_point = 50,
})

minetest.register_biome({
	name = "mapgen:grassland_ocean",
	--node_dust = "",
	node_top = "nodes:sand",
	depth_top = 1,
	node_filler = "nodes:sand",
	depth_filler = 2,
	node_stone = "",
	node_water_top = "",
	--depth_water_top = ,
	node_water = "",
	y_min = -31000,
	y_max = 4,
	heat_point = 50,
	humidity_point = 50,
})
