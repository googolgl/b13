--- Plants
--- Растения

local path_to_file = modpath .. "/json/plants.json"
local res = json_2_table(path_to_file)

if type(res) == "table" then
    for name, v in pairs(res) do
        --print(dump(v))
        -- если какой то из нод необходимо прописать кастомную функцию, добавляем условие по имени
        --[[if name == "lava" then

        elseif name == "snow" then

        end]]
        v.description = S(v.description)
        v._help = S(v._help)
        v.drawtype = "plantlike"
        v.paramtype = "light"
        v.waving = 1
        v.walkable = false
        v.buildable_to = true
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
