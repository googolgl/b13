--- Leaves
--- Листья

local path_to_file = modpath .. "/json/leaves.json"
local res = json_2_table(path_to_file)

if type(res) == "table" then
    for name, v in pairs(res) do
        --print(dump(v))
        -- если какой то из нод необходимо прописать кастомную функцию, добавляем условие по имени
        if name == "leaves_apple" then
            --[[v.drop = {
                max_items = 1,
                items = {
                    {
                        items = {sapling},
                        rarity = sapling_chances[fortune_level + 1] or sapling_chances[fortune_level]
                    },
                    {
                        items = {"mcl_core:stick 1"},
                        rarity = stick_chances[fortune_level + 1]
                    },
                    {
                        items = {"mcl_core:stick 2"},
                        rarity = stick_chances[fortune_level + 1]
                    },
                }
            }]]

        --elseif name == "snow" then
        end

        v.description = S(v.description)
        v._help = S(v._help)
        v.drawtype = "mesh"
	    v.mesh = "leaves.obj"
        v.paramtype = "light"
        v.use_texture_alpha = "clip"
        v.waving = 2
        v.walkable = true
        --v.liquid_viscosity = 8
	    --v.liquidtype = "source"
	    --v.liquid_renewable = false
	    --v.liquid_range = 0
        v.sounds = node_sound_defaults({
            footstep = {
                name = "default_grass_footstep",
                gain = 0.1325
            },
            dug = {
                name = "default_grass_footstep",
                gain = 0.425
            },
            dig = {
                name = "default_dig_snappy",
                gain = 0.4
            },
            place = {
                name = "default_place_node",
                gain = 1.0
            }
        })
        minetest.register_node("nodes:"..name, v)
    end
end